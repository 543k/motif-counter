#!/bin/sh
#Makes an array of the fasta data, sequence name is one entry, followed by the sequence as an entry
geneArray=($(awk 'BEGIN{RS=">";} NR>1{print ">" $0;}' ./r_bifella.fasta))

#Makes a list of the motif
motifs=$(cat interesting_motifs.txt)

#Creates counter variable for motif_count.txt
counter=0

#Generates relative directory for generated motif fasta files
mkdir ./motifs

#Nested for loop to compare motifs to genome
for motif in $motifs
do
  for gene in "${geneArray[@]}"
  do
    if [[ $gene == *"$motif"* ]]
    then
      #Writes matching gene to corresponding motif fasta
      echo $temp >> ./motifs/"$motif.fasta"
      echo $gene >> ./motifs/"$motif.fasta"
	  count=$(echo $gene | grep -Fo $motif | wc -l)
	  ((counter = $counter + $count))
    fi
     #Retains gene name from orinal fasta file
     temp=$gene
  done
  #Outputs number of motif occurences, and writes to motif_count.txt
  echo "$motif has $counter occurences"
  echo "$motif has $counter occurences" >> motif_count.txt 
  counter=0
done
