SAMPLES = ["barcode77"] # Kendi numaranı girdiğinden emin ol

rule all:
    input:
        expand("results/nanoplot/{sample}", sample=SAMPLES),
        expand("results/metrics/{sample}_metrics.csv", sample=SAMPLES),
        expand("results/plots/{sample}_distributions.png", sample=SAMPLES),
        expand("results/plots/{sample}_summary.txt", sample=SAMPLES)

# 1. Adım: Long-read spesifik QC aracı (NanoPlot)
rule run_nanoplot:
    input:
        "data/{sample}.fastq.gz"
    output:
        outdir=directory("results/nanoplot/{sample}")
    shell:
        """
        # NanoPlot kendi klasörünü oluşturur, o yüzden doğrudan output hedefini veriyoruz
        NanoPlot --fastq {input} -o {output.outdir}
        """

# 2. Adım: Her bir okuma için (read-by-read) metrikleri çıkaran özel Python betiği
rule extract_metrics:
    input:
        "data/{sample}.fastq.gz"
    output:
        "results/metrics/{sample}_metrics.csv"
    shell:
        """
        mkdir -p results/metrics
        python data_scripts/data_metrics.py {input} {output}
        """

# 3. Adım: Çıkarılan metrikleri görselleştirme ve istatistikleri hesaplama
rule plot_metrics:
    input:
        "results/metrics/{sample}_metrics.csv"
    output:
        plot="results/plots/{sample}_distributions.png",
        stats="results/plots/{sample}_summary.txt"
    shell:
        """
        mkdir -p results/plots
        python data_scripts/plot_metrics.py {input} {output.plot} {output.stats}
        """
