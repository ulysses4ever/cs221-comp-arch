#!/bin/bash

# ======================================================================
# Use this script to convert md to bare html (no <head>) and save it
# to corresponding *.html file
#
# USAGE:
#
#  <path_to_scrpipt>/pandoc4headlessHtml.sh <path_to_file>/<filename.md>
#
# The script generates <filename.html> in the <path_to_file> directory.
# ======================================================================

selfFullName=$0
selfPath=${selfFullName%/*}

srcFileFull=$1
srcFile=${srcFileFull%.*}

htmlFileFull=$srcFile'.html'

$selfPath/pandoc4headlessHtml.sh $srcFileFull > $htmlFileFull

