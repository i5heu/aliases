#!/bin/bash

# Script Name: list_commands.sh
# Description: Lists all available aliases and functions provided by the alias library.
# Usage: list_commands.sh

# Check if the aliases are loaded by verifying the existence of the 'list_aliases' function
if ! declare -F list_aliases > /dev/null; then
    echo "Error: Aliases are not loaded. Please source the aliases first."
    exit 1
fi

# Call the list_aliases function
list_aliases
