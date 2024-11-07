#!/bin/bash

# usage:
# index-fragments.sh [fragments.tsv.gz]

fragments=$1

gzip -d $fragments
base="${fragments%.gz}"
bgzip $base
tabix -p bed $fragments
