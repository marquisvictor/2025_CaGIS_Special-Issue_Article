# Second Revision of Manuscript

This folder contains scripts, data, and replication materials for the second revision of the manuscript

**Reproducible visualization strategies for spatially varying coefficient (SVC) models: Incorporating uncertainty and assessing replicability**

These updates reflect changes made in response to reviewer and editor comments. 

-----
## File Descriptions

- `2ND-revision-svc-viz paper replication.ipynb`  
    Jupyter notebook for replicating figures and analysis for the second revision, including additional revised visualizations

- `R-scriptGPGPAM.R`  
    R script used for GGP-GAM model recalibration

- `__init__.py`  
  Initialization file for enabling module-based organization of analysis scripts

- `utils.py`  
  Utility functions used within replication scripts for plotting, processing model outputs, and data handling.

- `viz_gwr.py`  
  Python script modified for generating svc-viz plots, with enhanced labeling and color consistency based on reviewer comments

## Data Files

- `Preprocessed_Voting_Data.csv`  
  Cleaned and preprocessed voting dataset used in the analyses in line with Fotheringham et al (2021, 2023).

- `countypres_2000-2020.csv`  
  County-level presidential election data from 2000–2020
  
- `ggp-us-dfii.csv`  
  Intermediate GGP-GAM processed dataset.

- `ggp-us-dfii2025.csv`  
  Updated GGP-GAM processed dataset.

- `us-data.csv`  
  County-level demographic and socioeconomic covariates for modeling.

- `voting_2020.csv`  
 Dependent variable + ACS data combined



## Contact

For questions related to this revision package, please contact:

**Victor Irekponor**  
[vireks@umd.edu]  

---

Thank you for your interest in replicating and building upon our work.
