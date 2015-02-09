#!/bin/bash

# ===========================================================================
# Use this script to convert md to bare html (no <head>) and save it
# to your clipboard. You can `Ctrl+V` result in any other app (e.g. browser).
#
# USAGE:
#
#  <path_to_scrpipt>/pandoc4headlessHtml.sh <path_to_file>/<filename.md>
#
# REQUIRES:
#
#   sudo apt-get install xclip
#
# ===========================================================================

selfFullName=$0
selfPath=${selfFullName%/*}

$selfPath/pandoc4headlessHtml.sh $1 | xclip -selection c

