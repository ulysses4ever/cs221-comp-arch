#!/bin/bash

# ======================================================================
# Use this script to convert md to bare html (no <head>)
#
# USAGE:
#
#  <path_to_scrpipt>/pandoc4headlessHtml.sh <path_to_file>/<filename.md>
#
# OUTPUT:

#   stdout
# ======================================================================

selfFullName=$0
selfPath=${selfFullName%/*}

customWriter=$selfPath/'md2html.lua'

pandoc -S -f markdown-auto_identifiers+example_lists+fancy_lists \
       -t $customWriter \
       --no-highlight $1

