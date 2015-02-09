#!/bin/bash

selfFullName=$0
selfPath=${selfFullName%/*}

$selfPath/pandochtml.sh $1
$selfPath/pandocpdf.sh $1
