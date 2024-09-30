#!/bin/bash

declare -a volumes=("fga-foreword"
                    "fga1"
                    "fga2"
                    "fga3.i"
                    "fga3.ii"
                    "fga3.iii"
                    "fga3.iv"
                    "fga3.v"
                    "fga3.vi")

for file in "${volumes[@]}"
do
  cp ../output/"$file".xml .
  xsltproc book.xsl "$file".xml > "$file".tex
done

cp ../output/fga-bibliography.xml .
xsltproc bibliography.xsl fga-bibliography.xml > fga-bibliography.bib
