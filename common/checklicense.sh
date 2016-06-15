#!/bin/bash
# I, the author of this file, hereby release its contents to the Public Domain

USAGE="Usage: $0 LICENSE_FILE FOLDER"

LICENSE_FILE=${1?$USAGE}
START_FOLDER=${2?$USAGE}

function trim {
    # Determine if 'extglob' is currently on.
    local extglobWasOff=1
    shopt extglob >/dev/null && extglobWasOff=0
    (( extglobWasOff )) && shopt -s extglob # Turn 'extglob' on, if currently turned off.
    # Trim leading and trailing whitespace
    local var=$1
    var=${var##+([[:space:]])}
    var=${var%%+([[:space:]])}
    (( extglobWasOff )) && shopt -u extglob # If 'extglob' was off before, turn it back off.
    echo -n "$var"  # Output trimmed string.
}

COUNT=0
NOK=0
function check {
    for f in $1/*; do
        f=${f#./}
        if [ -d "$f" ]; then
            check "$f"
        elif [[ "$f" =~ \.(swift|h|m)$ ]]; then
            if ! [ "$f" == "$LICENSE_FILE" ]; then
                COUNT=$(($COUNT+1))
                COMMON=$(awk 'NR==FNR{arr[$0];next} $0 in arr' $LICENSE_FILE "$f")
                COMMON=${COMMON##+([[:space:]])}
                COMMON=${COMMON%%+([[:space:]])}

                DIFF=`diff <(echo "$LICENSE") <(echo "$COMMON")`
                if [ -z "$DIFF" ]; then
                    echo "+ $f"
                else
                    echo "- $f"
                    >&2 echo "$0:$LINENO: warn : non-compliant $f"
                    NOK=$(($NOK+1))
                fi
            fi
        fi
    done
}

LICENSE=$(cat $LICENSE_FILE | grep -v -i 'Copyright (c)')
LICENSE=${LICENSE##+([[:space:]])}
LICENSE=${LICENSE%%+([[:space:]])}

check "$START_FOLDER"

if [ $COUNT -lt 1 ]; then
    >&2 echo "$0:$LINENO: warn : No files processed"
    exit 1
else
    echo "$COUNT file(s) processed"
    if [ $NOK -gt 0 ]; then
        >&2 echo "$0:$LINENO: error : $NOK non-compliant file(s)"
        exit 2
    fi
fi
