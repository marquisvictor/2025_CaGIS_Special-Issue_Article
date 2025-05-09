# Reproducible Visualization Strategies for Spatially Varying Coefficient (SVC) Models: Incorporating Uncertainty and Assessing Replicability

## Contributors

- Victor Irekponor\*, vireks@terpmail.umd.edu, @marquisvictor, [0000-0002-4836-7923](https://orcid.org/0000-0002-4836-7923), University of Maryland, College Park, MD, U.S.A

- Taylor Oshan, toshan@umd.edu, @TaylorOshan, [0000-0002-0537-2941](https://orcid.org/0000-0002-0537-2941), University of Maryland, College Park, MD, U.S.A

\* Corresponding author and creator

## Abstract

Spatially varying coefficient (SVC) models are often regarded as “big models” due to the extensive volume of outputs that they produce, making it challenging to identify spatial trends across the study area. Maps are therefore commonly used to interpret SVC models, though best practices for visualization are often overlooked and uncertainty ignored, leading to misinterpretation, inconsistencies, and making pattern extraction and comparison challenging. Furthermore, the role of reproducibility and replicability (R&R) in SVC models has received limited attention in the literature. Addressing these gaps requires a structured approach that enhances interpretability, facilitates model comparison, and effectively incorporates model uncertainty when analyzing SVC model output. This study introduces svc-viz, an open-source Python tool that codifies best practices into a standardized framework for interpreting and communicating SVC model results with minimal coding effort. By integrating established visualization principles, svc-viz improves clarity and reduces misinterpretation risks. Additionally, it introduces strategies for visualizing model uncertainty and assessing replicability across datasets, methods, and model inputs. The utility of svc-viz is demonstrated using a 2020 U.S. presidential election dataset. By formalizing visualization strategies, this study advances reproducibility, replicability, and uncertainty consideration in multiscale local modeling, providing researchers with a robust framework for analyzing and communicating spatial relationships.


### Study metadata

- `Key words`: Multiscale local modeling, Visualization, Uncertainty, Reproducibility and Replicability
- `Subject`: Social and Behavioral Sciences: Geography: Geographic Information Sciences
- `Date created`: 30-04-2025
- `Date modified`: 02-05-2025
- `Spatial Coverage`: United States of America (link: [OpenStreetMap USA](https://www.openstreetmap.org/relation/148838)), includes all U.S. counties.
- `Spatial Resolution`: County-level administrative units (FIPS-based). Data are aggregated to the county level based on U.S. Census geographic definitions.
- `Spatial Reference System`: WGS 84 - EPSG:4326
- `Funding Name`: National Science Foundation (NSF) (Methodology, Measuremt & Stats, Human-Envi & Geographical Scis)
- `Funding Title`: Advancing Methods for Spatial Analysis in Local Modeling
- `Award info URI`: [web address for award information](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2117455&HistoricalAwards=false)
- `Award number`: 2117455



## Related to

- `OSF Project`: https://doi.org/10.6084/m9.figshare.28599680.v1 
- `Conference Presentation`: [2024 CaGIS+UCGIS Symposium](https://cagisucgissymposium2024.sched.com/event/1cDyt/lightning-talks-methodological-innovations-in-geospatial-science#:~:text=**Victor%20Irekponor%20and%20Taylor%20Oshan%0AVisualization%20Strategies%20for%20Handling%20Uncertainty%20in%20SVC%20models%3A%20Implications%20for%20Reproducibility%20and%20Replicability)
- `Publication`: N/A
- `...`:

## Metadata for access

- `Rights`: [LICENSE](LICENSE): BSD 3-Clause "New" or "Revised"
- `Resource type`: Collection
- `Resource language`: English
- `Conforms to`: Template for Reproducible and Replicable Research in Human-Environment and Geographical Sciences version 1.0, DOI:[10.17605/OSF.IO/W29MQ](https://doi.org/10.17605/OSF.IO/W29MQ)

## Compendium structure and contents

This research compendium is structured with four main directories:

- `data`: contains subdirectories for `raw` data and `derived` data.
- `docs`: contains subdirectories for `manuscript`, `presentation`, and `report`
- `procedure`: contains subdirectories for `code` or software scripts, information about the computational `environment` in which the research was conducted, and non-code research `protocols`
- `results`: contains subdirectories for `figures`, formatted data `tables`, or `other` formats of research results.

The data, procedures, and results of this repository are outlined in three tables:
- Data: [data/data_index.csv](data/data_index.csv)
- Procedures: [procedure/procedure_index.csv](procedure/procedure_index.csv)
- Results: [results/results_index.csv](results/results_index.csv)

Important local **documents** include:
- Manuscript: [docs/manuscript/manuscript.pdf](docs/manuscript/manuscript.pdf)
- Presentation: [docs/presentation/presentation.pdf](docs/presentation/presentation.pdf)

#### Compendium reference

The [template_readme.md](template_readme.md) file contains more information on the design of this template and references used in the design.
The [Template_LICENSE](Template_LICENSE) file provides the BSD 3-Clause license for using this template.
To cite the template, please use [template_reference.bib](template_reference.bib) or:
> Kedron, P., & Holler, J. (2023). Template for Reproducible and Replicable Research in Human-Environment and Geographical Sciences. https://doi.org/10.17605/OSF.IO/W29MQ
