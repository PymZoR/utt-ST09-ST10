 #!/bin/bash

FILE=rapport
show=0

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -s|--show) show=1;;
        -f|--file) FILE="$2"; shift ;;
        -o|--okular) okular $FILE.pdf; exit 1;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

pdflatex $FILE.tex
biber $FILE
pdflatex $FILE.tex

if [ "$show" -eq 1 ]
then
    okular rapport.pdf &
fi

rm ./lib/*.aux
rm ./parts/*.aux
rm *.aux *.bbl *.blg *.bcf *.log *.out *.toc *.xml
