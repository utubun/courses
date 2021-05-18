#!/bin/bash

# download assembly summary file for Pseudomonas aeruginosa

echo "Downloading 'assembly_summary.txt' file..."

wget -Nq ftp.ncbi.nlm.nih.gov/genomes/refseq/bacteria/Pseudomonas_aeruginosa/assembly_summary.txt

# Leave the records from assembly_summary for 'latest' version and 'Complete Genome'

awk -F "\t" '{ if ( ($11 == "latest") && ($12 == "Complete Genome") ) { print } }' \
< assembly_summary.txt > assembly_complete.txt

# Count number of files to be downloaded ---------------------------------------

len=$(awk 'END{print NR}' assembly_complete.txt)

echo "Downloading $(awk 'END{print NR}' assembly_complete.txt) files..."

# Download *._genomic.gbff.gz files --------------------------------------------

URL=$(awk -F "\t" '{d=$20; gsub(".*/", "", $20); print d"/"$20"_genomic.gbff.gz"}' \
    assembly_complete.txt
    )

for i in $URL
do
  wget -P ./eco -Nq --no-check-certificate "$i"
  printf .
done | pv -pt -i 0.2 -s $len -w 80 > /dev/null

#wget -P ./eco  --no-check-certificate -N -i $URL


# Clean working directory ------------------------------------------------------

rm assembly_summary.txt
mv assembly_compl.txt assembly_summary.txt

echo Done!