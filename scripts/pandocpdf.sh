#!/bin/bash

selfFullName=$0
selfPath=${selfFullName%/*}
#echo $selfPath

srcFileFull=$1
srcFile=${srcFileFull%.*}
# echo "$srcFile"

pdfFileFull=$srcFile'.pdf'
#echo "$pdfFileFull"

templateFile=$selfPath'/settings/rusdefault.latex'
pandoc --template=$templateFile -V lang=russian $srcFileFull -o $pdfFileFull


