# mini-bioinformatics-pipeline
This project is an automated Snakemake workflow that extracts and visualizes quality control metrics from long-read sequencing data (fastq).


### Analysis Results Summary

#### 1. Read Quality and Length Distribution

[Read Quality and Length Distribution](results/nanoplot/LengthvsQualityScatterPlot_kde.html)

#### 2. Comprehensive Metrics (Custom Analysis)

![Custom Distribution Plots](results/plots/barcode77_distributions.png)

#### 3. Key Statistics
Total Reads: 81,011
Total Yield: 84.1 Mb
Read Length N50: 1,761 bp
Mean Read Length: 1,038.2 bp
Mean Read Quality (Phred): 8.9
Median Read Quality: 9.9
Data Reliability:
>Q10: 39,370 reads (48.6%)
>Q15: 6,878 reads (8.5%)
For a more detailed and interactive analysis, you can download the full [NanoPlot HTML Report](./results/nanoplot/NanoPlot-report.html).

# Installation
After cloning the project, to create the Conda environment containing the necessary dependencies:

```bash
conda env create -f environment.yml
conda activate longread_env
