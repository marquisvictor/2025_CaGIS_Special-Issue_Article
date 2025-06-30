## 1. Load packages
library(tidyverse)
library(cowplot)
library(cols4all)
library(mgcv)
library(parlitools)
library(broom)
library(spdep)
library(stringr)
install.packages("Metrics")  # Only run once
library(Metrics)

# 2. Read and prepare data
df <- read_csv("ggp-gam-input.csv")
df <- st_as_sf(df, wkt = "geometry")

coords <- st_coordinates(st_centroid(df))

df.gam <- df %>%
  mutate(
    Intercept = 1,
    X = coords[,"X"] / 1000,
    Y = coords[,"Y"] / 1000
  ) %>%
  as_tibble()

# 3. Fit GGP-GAM model with spatially varying coefficients
gam.m <- gam(new_pct_dem ~ 0 +
               Intercept + s(X, Y, bs = 'gp', by = Intercept) +
               sex_ratio + s(X, Y, bs = 'gp', by = sex_ratio) +
               pct_black + s(X, Y, bs = 'gp', by = pct_black) +
               pct_hisp + s(X, Y, bs = 'gp', by = pct_hisp) +
               pct_bach + s(X, Y, bs = 'gp', by = pct_bach) +
               median_income + s(X, Y, bs = 'gp', by = median_income) +
               pct_65_over + s(X, Y, bs = 'gp', by = pct_65_over) +
               pct_age_18_29 + s(X, Y, bs = 'gp', by = pct_age_18_29) +
               gini + s(X, Y, bs = 'gp', by = gini) +
               pct_manuf + s(X, Y, bs = 'gp', by = pct_manuf) +
               ln_pop_den + s(X, Y, bs = 'gp', by = ln_pop_den) +
               pct_3rd_party + s(X, Y, bs = 'gp', by = pct_3rd_party) +
               turn_out + s(X, Y, bs = 'gp', by = turn_out) +
               pct_fb + s(X, Y, bs = 'gp', by = pct_fb) +
               pct_insured + s(X, Y, bs = 'gp', by = pct_insured),
             data = df.gam
)

# 4. Create prediction scenarios to isolate beta surfaces
df.ii <- df.gam %>% select(-id)

zero_out <- function(df, var) {
  others <- setdiff(c("sex_ratio","pct_black","pct_hisp","pct_bach","median_income",
                      "pct_65_over","pct_age_18_29","gini","pct_manuf","ln_pop_den",
                      "pct_3rd_party","turn_out","pct_fb","pct_insured"), var)
  df %>% mutate({{var}} := 1,
                across(all_of(others), ~0),
                Intercept = 0)
}

extract_surface <- function(var) {
  pred_data <- zero_out(df.gam, var)
  df.ii <<- df.ii %>% mutate(
    !!paste0("se_", var) := predict(gam.m, se = TRUE, newdata = pred_data)$se.fit,
    !!paste0("b_", var) := predict(gam.m, newdata = pred_data)
  )
}

# Baseline intercept (all vars zero, Intercept=1)
b0 <- df.gam %>% mutate(across(all_of(c("sex_ratio","pct_black","pct_hisp","pct_bach","median_income",
                                        "pct_65_over","pct_age_18_29","gini","pct_manuf","ln_pop_den",
                                        "pct_3rd_party","turn_out","pct_fb","pct_insured")), ~0), Intercept = 1)
df.ii <- df.ii %>% mutate(se0 = predict(gam.m, se = TRUE, newdata = b0)$se.fit,
                          b0 = predict(gam.m, newdata = b0))

# Extract all surfaces
for (v in c("sex_ratio","pct_black","pct_hisp","pct_bach","median_income",
            "pct_65_over","pct_age_18_29","gini","pct_manuf","ln_pop_den",
            "pct_3rd_party","turn_out","pct_fb","pct_insured")) {
  extract_surface(v)
}

# 5. Create predicted outcome
gam_hex.sp <- df.ii
gam.pred <- predict(gam.m, newdata = gam_hex.sp)

# 6. Export result
st_write(df.ii, "ggp-us-dfii.csv", layer_options = "GEOMETRY=AS_WKT")




rsq <- function(actual, predicted) {
  1 - (sum((actual - predicted)^2) / sum((actual - mean(actual))^2))
}

r2 = round(rsq(df$new_pct_dem, gam.pred),3)
rmse = round(rmse(df$new_pct_dem, gam.pred),3)
#mae(hex.sp$leave, gam.pred)
aic = round(AIC(gam.m), 1)
st_geometry(gam_hex.sp) <- st_geometry(df)

## 14. Create Tables 4 and 5
tab = tidy(gam.m, digits = 3) 
tab2 <- gam_hex.sp %>% st_drop_geometry() %>% 
  select(pct_black, pct_65_over, pct_age_18_29, pct_fb, pct_uninsured, pct_bach, ln_pop_den)
tab2 = round(apply(tab2,2,summary),3)
colnames(tab2) = c("Intercept", names(hex.sp)[3:10])
tab2 = t(round(tab2, 2))
knitr::kable(tab, booktabs = T, digits = 3, row.names = F, linesep = "",
             caption = paste0("\\label{tab:tab4} The smooth terms of the GGP-GAM model."))
knitr::kable(tab2, booktabs = T, digits = 3, row.names = T, linesep = "",
             caption = paste0("\\label{tab:tab5}The distributions of the GGP-GAM spatially varying coefficient estimates ($R^{2}$ = ",r2, "; AIC = ", aic, ")."))

## 15. Create Figure 6 
plot_vgam_coef_func = function(var.name = "b0", tit) {
  var  = gam_hex.sp %>% 
    st_drop_geometry() %>% 
    dplyr::select(all_of(var.name)) %>%
    unlist() %>% 
    as.vector()
  if (sign(max(var)) * sign(min(var)) == 1) flip = F
  if (sign(max(var)) * sign(min(var)) == -1) flip = T
  
  if(flip) {
    ggplot(gam_hex.sp, aes_string(fill=var.name)) + 
      geom_sf(col = NA) + 
      scale_fill_continuous_c4a_div(palette="scico.vik", name= tit, mid = 0, reverse = T ) + 
      theme_bw() +
      theme(legend.position = "bottom", 
            axis.title.x=element_blank(),
            axis.text.x=element_blank(),
            axis.ticks.x=element_blank(), 
            axis.title.y=element_blank(),
            axis.text.y=element_blank(),
            axis.ticks.y=element_blank(),
            text=element_text(size=8))   
  } else {
    ggplot(gam_hex.sp, aes_string(fill=var.name)) + 
      geom_sf(col = NA) + 
      scale_fill_continuous_c4a_seq(palette="scico.nuuk", name= tit) + 
      theme_bw() +
      theme(legend.position = "bottom", 
            axis.title.x=element_blank(),
            axis.text.x=element_blank(),
            axis.ticks.x=element_blank(), 
            axis.title.y=element_blank(),
            axis.text.y=element_blank(),
            axis.ticks.y=element_blank(),
            text=element_text(size=8))
  }
}

p1 = plot_vgam_coef_func("b0", tit = "Intercept")
p2 = plot_vgam_coef_func("bpct_black", tit = "pct_black")
p3 = plot_vgam_coef_func("bpct_65_over", "pct_65_over")
p4 = plot_vgam_coef_func("bpct_age_18_29", "pct_age_18_29")
p5 = plot_vgam_coef_func("bpct_fb", "pct_fb")
p6 = plot_vgam_coef_func("bpct_uninsured", "pct_uninsured")
p7 = plot_vgam_coef_func("bpct_bach", "pct_bach")
p8 = plot_vgam_coef_func("bln_pop_den", "ln_pop_den")
if (.Platform$GUI == "AQUA") {
  quartz(w=9,h=11) } else  {
    x11(w=9,h=11) } 
plot_grid(p1, p2, p3, p4, p5,p6,p7,p8, ncol = 4)
