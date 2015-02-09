===============================================================================

Use local_scripts folder to store local scripts which 
shouldn't be pushed into repository.

===============================================================================


*******************************************************************************

First real-world example: script for easy post of text (e.g. html) file with new
assignment description to Moodle 
(uses ../moodle_client.py and fixes your security token).

    ----------------------------------------------------------
        send_moodle.sh 
    ----------------------------------------------------------
    selfFullName=$0
    selfPath=${selfFullName%/*}

    srcFile=$1
    resourceID=$2

    moodleClient=$selfPath'/../scripts/moodle_client.py'

    $moodleClient -f $srcFile -i $resourceID -t <token>
    ----------------------------------------------------------
    
    (!) Write your security token instead of <token>.
    
Use this script as follows:

    <path>/local_scripts/send_moodle.sh <filename.html> <assignment id>
    
where
* <filename.html> — html-file with assignment page content;
* <assignment id> — id of the required assignment

DO NOT PUSH THIS SCRIPT INTO REPOSITORY! It contains your security token.
    
    
*******************************************************************************
