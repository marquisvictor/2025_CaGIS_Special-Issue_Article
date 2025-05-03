# Reproducible Visualization Strategies for Spatially Varying Coefficient (SVC) Models: Incorporating Uncertainty and Assessing Replicability

## Contributors

- Victor Irekponor\*, vireks@terpmail.umd.edu, @marquisvictor, [ORCID link](https://orcid.org/0000-0002-4836-7923), University of Maryland, College Park, MD, U.S.A

- Taylor Oshan, toshan@umd.edu, @TaylorOshan, [0000-0002-0537-2941](https://orcid.org/0000-0002-0537-2941), University of Maryland, College Park, MD, U.S.A

\* Corresponding author and creator

## Abstract

Spatially varying coefficient (SVC) models are often regarded as “big models” due to the extensive volume of outputs that they produce, making it challenging to identify spatial trends across the study area. Maps are therefore commonly used to interpret SVC models, though best practices for visualization are often overlooked and uncertainty ignored, leading to misinterpretation, inconsistencies, and making pattern extraction and comparison challenging. Furthermore, the role of reproducibility and replicability (R&R) in SVC models has received limited attention in the literature. Addressing these gaps requires a structured approach that enhances interpretability, facilitates model comparison, and effectively incorporates model uncertainty when analyzing SVC model output. This study introduces svc-viz, an open-source Python tool that codifies best practices into a standardized framework for interpreting and communicating SVC model results with minimal coding effort. By integrating established visualization principles, svc-viz improves clarity and reduces misinterpretation risks. Additionally, it introduces strategies for visualizing model uncertainty and assessing replicability across datasets, methods, and model inputs. The utility of svc-viz is demonstrated using a 2020 U.S. presidential election dataset. By formalizing visualization strategies, this study advances reproducibility, replicability, and uncertainty consideration in multiscale local modeling, providing researchers with a robust framework for analyzing and communicating spatial relationships.


## Study Metadata

- `Key words`: Multiscale local modeling, Visualization, Uncertainty, Reproducibility and Replicability
- `Subject`: select from the [BePress Taxonomy](http://digitalcommons.bepress.com/cgi/viewcontent.cgi?article=1008&context=reference)
- `Date created`: 30-04-2025
- `Date modified`: 02-05-2025
- `Spatial Coverage`: Contiguous United States
- `Spatial Resolution`: Specify the spatial resolution as a scale factor, description of the level of detail of each unit of observation (including administrative level of administrative areas), and/or or distance of a raster GRID size
- `Spatial Reference System`: Specify the geographic or projected coordinate system for the study
- `Temporal Coverage`: Specify the temporal extent of your study---i.e. the range of time represented by the data observations.
- `Temporal Resolution`: Specify the temporal resolution of your study---i.e. the duration of time for which each observation represents or the revisit period for repeated observations
- `Funding Name`: Methodology, Measuremt & Stats, Human-Envi & Geographical Scis 
- `Funding Title`: Advancing Methods for Spatial Analysis in Local Modeling
- `Award info URI`: [web address for award information](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2117455&HistoricalAwards=false)
- `Award number`: 2117455

## Related to

- `OSF Project`:
- `Pre-analysis Registration`:
- `Post-analysis Report Registration`:
- `Preprint`:
- `Conference Presentation`:
- `Publication`:
- `Prior Study`:
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
- Pre-analysis plan: [docs/report/preanalysis.pdf](docs/report/preanalysis.pdf)
- Study report: [docs/report/report.pdf](docs/report/report.pdf)
- Manuscript: [docs/manuscript/manuscript.pdf](docs/manuscript/manuscript.pdf)
- Presentation: [docs/presentation/presentation.pdf](docs/presentation/presentation.pdf)

#### Compendium reference

The [template_readme.md](template_readme.md) file contains more information on the design of this template and references used in the design.
The [Template_LICENSE](Template_LICENSE) file provides the BSD 3-Clause license for using this template.
To cite the template, please use [template_reference.bib](template_reference.bib) or:
> Kedron, P., & Holler, J. (2023). Template for Reproducible and Replicable Research in Human-Environment and Geographical Sciences. https://doi.org/10.17605/OSF.IO/W29MQ
