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


Subject: Preliminary Quality Analysis and Post-Processing Strategy for Barcode 77

Dear Professor Kılıç,
I have completed the preliminary quality control and metrics analysis for the Barcode 77 raw sequencing data. To evaluate the long-read characteristics, I utilized the NanoPlot tool and developed a custom Python script to extract specific read metrics.
Our analysis yielded a total of 81,011 reads with an N50 of 1,761 bp. The GC content is approximately 53%, exhibiting a unimodal distribution which suggests the sample is free from significant external contamination.
Regarding data quality, the results show that 48.6% of the reads are above the Q10 threshold. To optimize the dataset for high-accuracy analysis, I recommend a quality trimming and filtering step using Chopper. By applying a quality --min_qual 10 filter, we can effectively remove the low-quality noise while preserving our most valuable long-read data.
Following this refinement with Chopper, we can confidently proceed to the genomic alignment phase. Please let me know if you would like me to initiate the filtering process.

Best regards,
Hakan Büyüktuncay
