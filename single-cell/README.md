# Medulloblastoma GNP to MBSHH multiome reanalysis
Reanalysis of single-cell data published in [Shiraishi *et al.*, 2024](https://doi.org/10.1016/j.devcel.2024.05.013)  

## Requirements
This project is written in the `R` data science language with the `seurat`, `signac`, `harmony`, and `jupyter` packages. We recommend installation via conda. For a guide to installing conda, see [this tutorial](https://github.com/auberginekenobi/protocols/tree/main/0_Setting_up_your_workstation).

### Installation instructions
Download this project.
```
git clone git@github.com:auberginekenobi/mbshh-kmt2c-chd7.git
```
Navigate to the root directory for this project.
```
cd gnp-mbshh-single-cell
$MB_HOME=$(pwd)
```
Install (Mac OS with Apple silicon):
```
CONDA_SUBDIR=osx-64 conda env create -f sc-multiome.yml
conda activate sc-multiome
conda config --env --set subdir osx-64
Rscript -e "IRkernel::installspec(name = 'sc-multiome', displayname = 'sc-multiome')"
conda deactivate
```
Install (all other operating systems):
```
conda env create -f sc-multiome.yml
conda activate sc-multiome
Rscript -e "IRkernel::installspec(name = 'sc-multiome', displayname = 'sc-multiome')"
conda deactivate
```
Installation of the large dependencies (BSgenome.Mmusculus.UCSC.mm10) and (EnsDb.Mmusculus.v79) was tricky in my experience (Mac OS Sonoma 14.6.1 on NCU wifi). This could be a problem with the wifi connection, conda, Apple M series architecture, or some combination thereof. If these dependencies won't install via conda, you should be able to install these using command-line R.
```
conda activate sc-multiome
R
# `>` indicates the R command prompt and is not part of these commands
> options(timeout = 1200) 
> if (!require("BiocManager", quietly = TRUE))
>     install.packages("BiocManager")
>
> BiocManager::install("BSgenome.Mmusculus.UCSC.mm10")
> BiocManager::install("EnsDb.Mmusculus.v79")
> BiocManager::install("biovizBase")
conda deactivate
```

## Data
Download the data from GEO ID [GSE243609](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE243609):
```
data
└── GSE243609
   ├── GSM7791839_032103_fragments.tsv.gz
   ├── GSM7791840_032103_filtered_feature_bc_matrix.h5
   ├── GSM7791841_RS03056_fragments.tsv.gz
   ├── GSM7791842_RS03056_filtered_feature_bc_matrix.h5
   ├── GSM7791843_RS03060_fragments.tsv.gz
   └── GSM7791844_RS03060_filtered_feature_bc_matrix.h5
```
*Indexing.* The above .tsv.gz files need to be indexed before analysis (requires `tabix`). 
```
cd $MB_HOME
chmod +x scripts/index-fragments.sh
scripts/index-fragments.sh data/GSE243609/GSM7791839_032103_fragments.tsv.gz
scripts/index-fragments.sh data/GSE243609/GSM7791841_RS03056_fragments.tsv.gz
scripts/index-fragments.sh data/GSE243609/GSM7791843_RS03060_fragments.tsv.gz 
```
## Analysis
Run the analysis notebook.
```
jupyter lab
```