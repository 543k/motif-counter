## Motif Analysis Script
### Goal: To performs motif analysis on a given FASTA file.
### Author: Vivek M.
### Date: 10/23/2024
### Description
This script performs motif analysis on a FASTA file (named "r_bifella.fasta). It compares the motifs to the given genome, and keeps a count for instances of said motif. Gene sequences where motifs are found are extracted into another FASTA file named the corresponding motif.

Input:

A FASTA file containing DNA sequences (named r_bifella.fasta).
A file called interesting_motifs.txt containing a list of motifs (one motif per line) that the script will search for.

Output:

A file named motif_count.txt that lists the count of each motif in the FASTA file.
For each motif found, a separate FASTA file containing the gene headers and sequences where the motif appears. These files are saved in a directory named motifs.

How to Run:

To execute the script, navigate to the directory containing the script (ensuring the above input files are in the same directory) and run:

chmod +X hw.sh
bash hw.sh