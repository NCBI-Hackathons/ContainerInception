#!/bin/bash

# Build image
pdflatex -shell-escape useCase0.tex
pdflatex -shell-escape useCase11.tex
pdflatex -shell-escape useCase2.tex

# Remove unnecessary files
rm *.aux *.log *.nav *.out *.snm *.toc *.vrb

#Move images into folder
mkdir -p flowChartImages
mv *.png flowChartImages
