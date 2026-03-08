import sys
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

def main():
    if len(sys.argv) != 4:
        print("Kullanım: python plot_metrics.py <input.csv> <output.png> <output_stats.txt>")
        sys.exit(1)

    input_csv = sys.argv[1]
    out_plot = sys.argv[2]
    out_stats = sys.argv[3]

    df = pd.read_csv(input_csv)
    
    stats = df[['GC_Content', 'Length', 'Mean_Quality']].agg(['mean', 'median']).round(2)
    
    print("--- Summary Statistics ---")
    print(stats)
    
    with open(out_stats, 'w') as f:
        f.write("--- Summary Statistics ---\n")
        f.write(stats.to_string())
        f.write("\n")

    fig, axes = plt.subplots(1, 3, figsize=(18, 5))
    
    # GC Content (Blue)
    sns.histplot(df['GC_Content'], kde=True, ax=axes[0], color='skyblue', bins=50)
    axes[0].set_title('GC Content Distribution')
    axes[0].set_xlabel('GC Content (%)')
    
    # Read Lenght  
    sns.histplot(df['Length'], kde=True, ax=axes[1], color='salmon', bins=50)
    axes[1].set_title('Read Length Distribution')
    axes[1].set_xlabel('Read Length (bp)')

    # Mean Quality Score (Green)
    sns.histplot(df['Mean_Quality'], kde=True, ax=axes[2], color='lightgreen', bins=50)
    axes[2].set_title('Mean Quality Score Distribution')
    axes[2].set_xlabel('Phred Quality Score')

    plt.tight_layout()
    plt.savefig(out_plot, dpi=300)

if __name__ == "__main__":
    main()
