#!/bin/sh

# Script for mapping mouse enhancer regions received from Kohei Kumagawa to orthologous human regions using CrossMap.

# Requires CrossMap, over.chain.gz file.

# Usage:
# crossmap_mouse_enhancers.sh [enhancers.mm10.bed]

source ~/.zshrc
conda activate crossmap
CHAIN=~/anno/chain/mm10ToHg38.over.chain.gz
BED=$1

generate_filename() {
    # Input: A filename like 08_RD_Gene.bed
    local filename="$1"
    
    # Extract the gene name (assuming the gene name is the part after the first underscore)
    local gene_name=$(echo "$filename" | sed -E 's/.*_([A-Za-z0-9_]+)\.bed/\1/')
    
    # Convert the gene name to uppercase
    gene_name=$(echo "$gene_name" | tr 'a-z' 'A-Z')
    
    # Construct the new filename in the desired format
    echo "${gene_name}_enhancers.hg38.bed"
}

OUT=$(generate_filename $BED)
DIR=$(dirname $BED)

CrossMap bed $CHAIN $BED $DIR/$OUT

conda deactivate

