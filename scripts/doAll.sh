# ======================================================================
# This script converts given MD-file to bare html and post it to Moodle
#
# USES:
#
#	local_scripts/send_moodle.sh (cf. local_scripts/readme.txt)
#	scripts/pandoc4headlessHtml.sh
#
# USAGE:
#
#	<path_to_scrpipt>/doAll.sh <path_to_file>/<filename.md>
#
# ======================================================================

selfFullName=$0
selfPath=${selfFullName%/*}

scripts=$selfPath
local_scipts=$scripts/../local_scripts

assignmentId=`head -n 1 $1 | cut -d' ' -f6`

$scripts/pandoc4headlessHtml.sh $1 | \
    $local_scipts/send_moodle.sh '-' $assignmentId

