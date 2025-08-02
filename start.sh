#!/bin/sh -e

# Prevent execution if this script was only partially downloaded
{
rc='\033[0m'
red='\033[0;31m'

check() {
    exit_code=$1
    message=$2

    if [ "$exit_code" -ne 0 ]; then
        printf '%sERROR: %s%s\n' "$red" "$message" "$rc"
        exit 1
    fi

    unset exit_code
    unset message
}

temp_file=$(mktemp)
check $? "Creating the temporary file"

curl -fsL "https://github.com/dallagnoli/tuxtile/releases/latest/download/tuxtile" -o "$temp_file"
check $? "Downloading tuxtile"

chmod +x "$temp_file"
check $? "Making tuxtile executable"

"$temp_file" "$@"
check $? "Executing tuxtile"

rm -f "$temp_file"
check $? "Deleting the temporary file"
} # End of wrapping
