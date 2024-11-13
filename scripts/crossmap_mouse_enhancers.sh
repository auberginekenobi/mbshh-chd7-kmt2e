#!/bin/sh

# Script for mapping mouse enhancer regions received from Kohei Kumagawa to orthologous human regions using CrossMap.

# Requires CrossMap, over.chain.gz file.

# Usage:
# crossmap_mouse_enhancers.sh [enhancers.mm10.bed]

source ~/.zshrc
conda activate crossmap
CHAIN=~/anno/chain/mm10ToHg38.over.chain.gz
BED=$1

generate_filestem() {
    # Input: A filename like 08_RD_Gene.bed
    local filename="$1"
    
    # Extract the gene name (assuming the gene name is the part after the first underscore)
    local gene_name=$(echo "$filename" | sed -E 's/.*_([A-Za-z0-9_]+)\.bed/\1/')
    
    # Convert the gene name to uppercase
    gene_name=$(echo "$gene_name" | tr 'a-z' 'A-Z')
    
    # Construct the new filename in the desired format
    echo "${gene_name}"
}

DIR=$(dirname $BED)
STEM=$(generate_filestem $BED)
OUT=$DIR/${STEM}_enhancers.hg38.bed
LOG=$DIR/${STEM}_mapping.txt

CrossMap region $CHAIN $BED > $LOG
awk -F'\t' 'NF == 8 {OFS="\t"; print $5, $6, $7, $8}' $LOG > $OUT

conda deactivate

