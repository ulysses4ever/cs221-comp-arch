#!/bin/bash

# ==============================================================================
# Use this script for conversion md to html with following properties:
# * custom writer md2html.lua for producing html
# * --mathjax engine for math
# * google-code-prettify for syntax highlighting
#
#
# USAGE:
#
#   <path_to_scrpipt>/pandochtml.sh <path_to_file>/<filename.md>
#
# this command generates <filename.html> in the <path_to_file> directory.
# ==============================================================================

selfFullName=$0
selfPath=${selfFullName%/*}
#echo $selfPath

srcFileFull=$1
srcFile=${srcFileFull%.*}
#echo "$srcFile"

htmlFileFull=$srcFile'.html'
#echo "$htmlFileFull"

customWriter=$selfPath/'md2html.lua'
templateFile=$selfPath'/settings/moodledefault.html'

pandoc -S -f markdown-auto_identifiers+example_lists -t $customWriter  --mathjax -V lang=russian --no-highlight $srcFileFull -o $htmlFileFull

