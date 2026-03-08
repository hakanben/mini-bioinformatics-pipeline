import sys
import gzip
import csv
from Bio import SeqIO

def calculate_gc(seq):
    g = seq.count('G') + seq.count('g')
    c = seq.count('C') + seq.count('c')
    return (g + c) / len(seq) * 100 if len(seq) > 0 else 0

def main():
    if len(sys.argv) != 3:
        print("Kullanım: python extract_metrics.py <input.fastq.gz> <output.csv>")
        sys.exit(1)

    input_fastq = sys.argv[1]
    output_csv = sys.argv[2]

    open_func = gzip.open if input_fastq.endswith('.gz') else open
    mode = 'rt' if input_fastq.endswith('.gz') else 'r'

    with open_func(input_fastq, mode) as handle, open(output_csv, 'w', newline='') as out_file:
        writer = csv.writer(out_file)
        writer.writerow(["Read_ID", "Length", "GC_Content", "Mean_Quality"])

        for record in SeqIO.parse(handle, "fastq"):
            read_id = record.id
            length = len(record)
            gc = calculate_gc(record.seq)

            quals = record.letter_annotations["phred_quality"]
            mean_q = sum(quals) / len(quals) if len(quals) > 0 else 0
            
            writer.writerow([read_id, length, gc, mean_q])

if __name__ == "__main__":
    main()
