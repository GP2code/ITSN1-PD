# Association of ITSN1 Variants with Parkinson’s Disease Risk and Onset in Large-Scale Biobank Data

`GP2 ❤️ Open Science 😍`

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.21649603.svg)](https://doi.org/10.5281/zenodo.21649603)

**Last updated:** March 2026

## Summary
This is the online repository for the manuscript titled **"Association of ITSN1 Variants with Parkinson’s Disease Risk and Onset in Large-Scale Biobank Data"**. This study focuses on **uncovering the pathogenicity of variants in ITSN1 using multi-ancestry Parkinson's disease case/control cohorts**.

## Data statement
Data used in the preparation of this article were obtained from the Global Parkinson’s Genetics Program (GP2; https://gp2.org).

All GP2 data are hosted in collaboration with the Accelerating Medicines Partnership in Parkinson’s disease, and are available via application on the website (https://amp-pd.org/register-for-amp-pd). For up-to-date information on GP2 data acquisition, access, and policies, visit https://gp2.org/. Tier 1 data can be accessed by completing a form on the Accelerating Medicines Partnership in Parkinson’s Disease (AMP®-PD) website (https://amp-pd.org/register-for-amp-pd). Tier 2 data access requires approval and a Data Use Agreement signed by your institution.

In this analysis we used Tier 2 GP2 Release 11 (10.5281/zenodo.17753486).


### Helpful Links

- [GP2 Website](https://gp2.org/)
  - [GP2 Cohort Dashboard](https://gp2.org/cohort-dashboard-advanced/)
- [Introduction to GP2](https://movementdisorders.onlinelibrary.wiley.com/doi/10.1002/mds.28494)
  - [Other GP2 Manuscripts (PubMed)](https://pubmed.ncbi.nlm.nih.gov/?term=%22global+parkinson%27s+genetics+program%22)


## Repository Orientation
- Below is a breakdown of all analyses discussed in the manuscript.

<pre> THIS_REPO/ 
  ├── AAO_regression/ 
  |     ├──01_AAO_Regression_GP2R11.ipynb
  |     └──02_AAO_Regression_AOU.ipynb
  ├── carrier_analyses/
  |     └──01_ITSN1_PD_Carriers_UKB.ipynb
  ├── downstream_analyses/
  |     └──01_Find_Published_Variants_In_UKB.ipynb
  ├── lof_variant_analyses/
  |     ├──01_Run_VEP_LOF.ipynb
  |     └──02_LoF_Skat_ITSN1_GP2_R11.ipynb
  ├── meta_analyses/
  |     └──01_REMETA_ITSN1_Burden_Analysis
  ├── Plotting/
  |     └──01_create_figures_for_manuscript 
  ├── power_calculation/
  |     ├──01_run_power_calc_swarm_parallel.R
  |     └──02_power_calc.swarm
  ├── single_variant_and_skat/
  |     ├──01_EUR_ITSN1_Variant_Analysis_GP2R11_IMP.ipynb
  |     ├──02_EUR_ITSN1_Variant_Analysis_GP2R11_WGS.ipynb
  |     ├──03_ITSN1_Variant_Analysis_UKB_500K_WGS.ipynb
  |     ├──04_EUR_ITSN1_Variant_Analysis_AOU_WGS.ipynb
  |     └──05_papermill.ipynb
  ├── LICENSE
  └── README.md 
</pre>

## Analysis Notebooks
### Languages: Python, Bash, and R
| Directory | Notebooks   | Description | 
|-----------|----------------|--------|
|`AAO_regression/`| `01_AAO_Regression_GP2R11.ipynb`         | AAO Regression in GP2 R11|
|`AAO_regression/`| `02_AAO_Regression_AOU.ipynb`         | AAO Regression in AoU|
|`carrier_analyses/`| `01_ITSN1_PD_Carriers_UKB.ipynb`         | ITSN1 PD carriers in UKB|
|`downstream_analyses/`| `01_Find_Published_Variants_In_UKB.ipynb`         | Extract published variants in UKB data|
|`lof_variant_analyses/`| `01_Run_VEP_LOF.ipynb.ipynb`         | Run VEP with LOF |
|`lof_variant_analyses/`| `02_LoF_Skat_ITSN1_GP2_R11.ipynb`         | SKAT with LOF variants|
|`meta_analyses/`| `01_REMETA_ITSN1_Burden_Analysis.ipynb`         | Meta-analysis|
|`Plotting/`| `01_create_figures_for_manuscript.ipynb`         | Plots for manuscript|
|`power_calculation/`| `01_run_power_calc_swarm_parallel.R`         | Power calculation|
|`power_calculation/`| `02_power_calc.swarm`         | Submit swarm of jobs|
|`single_variant_and_skat/`| `01_EUR_ITSN1_Variant_Analysis_GP2R11_IMP.ipynb`         | GP2 imputed data ITSN1 analysis|
|`single_variant_and_skat/`| `02_EUR_ITSN1_Variant_Analysis_GP2R11_WGS.ipynb`         | GP2 WGS data ITSN1 analysis|
|`single_variant_and_skat/`| `03_ITSN1_Variant_Analysis_UKB_500K_WGS.ipynb`         | UKB WGS data ITSN1 analysis|
|`single_variant_and_skat/`| `04_EUR_ITSN1_Variant_Analysis_AOU_WGS.ipynb`         | AoU WGS data ITSN1 analysis|
|`single_variant_and_skat/`| `05_papermill.ipynb`         | Loop with papermill|



## Software
| **Software** | **Version(s)** | **Resource URL** | **RRID** | **Notes** |
|--------------|----------------|------------------|----------|-----------|
|ADMIXTURE|v.1.3.0|https://dalexander.github.io/admixture/|RRID:SCR_001263|Used for population structure estimation.|
|ANNOVAR|d.06.08.2020|http://www.openbioinformatics.org/annovar/|RRID:SCR_012821|Used for variant annotation.|
|BCFtools|v.1.17+|http://samtools.sourceforge.net/mpileup.shtml|RRID:SCR_005227|Used for genomic file manipulation.|
|Biorender||https://www.biorender.com/|RRID:SCR_018361|Used to generate plots.|
|DRAGEN|v.3.7.8|https://developer.illumina.com/dragen|NA|Used for variant calling for Illumina data.|
|GenoTools|v.1.2.3|https://github.com/GP2code/GenoTools|NA|Used for quality control and genetic ancestry inferrence.|
|gnomAD|v.4.1|http://gnomad.broadinstitute.org/|RRID:SCR_014964|Used to retrieve population frequency data.|
|KING|v.2.3.0|http://people.virginia.edu/~wc9c/KING/|RRID:SCR_009251|Used for relationship inferrence.|
|PLINK|v.1.9,v. 2.0|http://www.nitrc.org/projects/plink|RRID:SCR_001757|Used for genetic analyses.|
|Python Programming Language|3.7, 3.8, 3.9, 3.10|http://www.python.org/|RRID:SCR_008394|pandas; numpy; seaborn; matplotlib; statsmodel; Used for general data wrangling/plotting/analyses|
|R Project for Statistical Computing|v.4.2.2|http://www.r-project.org/|RRID:SCR_001905|tidyverse; dplyr; tidyr; ggplot; data.table; Used for general data wrangling/plotting/analyses	|
|REGENIE|v. 4.1.2|https://rgcgithub.github.io/regenie/|NA|Used for generating summary statistics files.|
|REMETA|v. 0.11.2|https://rgcgithub.github.io/remeta/|NA|Used for gene-based meta analysis.|
|RVTests|v.2.1.0|http://genome.sph.umich.edu/wiki/RvTests|RRID:SCR_007639|Used for burden analyses.|
|SKAT|v.2.2.5|https://cran.r-project.org/package=SKAT|RRID:SCR_009396|Used for power calculation.|
|Ensembl Variant Effect Predictor (VEP)|v.113|https://www.ensembl.org/Tools/VEP/|RRID:SCR_007931|Used for annotating variants and predicting functional consequences.|
