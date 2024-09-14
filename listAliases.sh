#!/bin/bash

# Function Description:
# Lists all aliases and functions defined in the ~/.aliases/aliases file.
# Usage:
#   listAliases        - Lists aliases and functions with their descriptions.
#   listAliases -v     - Displays the entire aliases file with syntax highlighting.

# Reset OPTIND to ensure getopts works correctly when sourced
OPTIND=1

# Initialize VERBOSE flag
LISTALIASES_VERBOSE=false

# Parse options
while getopts ":v" opt; do
    case $opt in
        v )
            LISTALIASES_VERBOSE=true
            echo "Verbose mode set"
            ;;
        \? )
            echo "Invalid option: -$OPTARG" >&2
            echo "Usage: listAliases [-v]"
            return 1
            ;;
    esac
done
shift $((OPTIND -1))

if [ "$LISTALIASES_VERBOSE" = true ]; then
    # Verbose mode: display the entire aliases file with syntax highlighting
    if command -v highlight &> /dev/null; then
        highlight -O ansi --syntax=sh "$HOME/.aliases/aliases"
else
    printf "Error: No syntax highlighter found. Install'highlight' to use verbose mode. For Debian based distros use:\nsudo apt install highlight\n" >&2
    printf "Would you like to install 'highlight' now? [Y/n]: "
    read -r response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]] || [ -z "$response" ]; then
        echo "Installing 'highlight'..."
        sudo apt install highlight
    else
        echo "Installation aborted by the user."
    fi
    return 1
fi

else
    # Standard mode: list aliases and functions with their comments
    echo "Hint: To output the entire aliases file with syntax highlighting, use the -v option."
    echo "Available Aliases and Functions:"
    echo "---------------------------------"

    # Path to the aliases file
    ALIASES_FILE="$HOME/.aliases/aliases"

    # Check if the aliases file exists
    if [ ! -f "$ALIASES_FILE" ]; then
        echo "Error: Aliases file '$ALIASES_FILE' does not exist." >&2
        return 1
    fi

    # Extract aliases with their comments
    echo "Aliases:"
    awk '
        /^#/ { comment = substr($0, 2); next }  # Capture comments and skip to the next line
        /^alias/ {                             # Match lines starting with alias
            sub(/^alias\s+/, "");              # Remove the alias keyword and following whitespace
            sub(/=.*/, "");                    # Remove everything after and including the equals sign
            if (comment != "") {
                print "# " comment;            # Print the captured comment
            }
            print $0;                          # Print the alias name
            comment = "";                      # Reset comment for the next round
        }
    ' "$ALIASES_FILE"
    echo

    # Extract functions with their comments
    echo "Functions:"
    awk '
        /^#/ { comment = substr($0, 2) }
        /^[a-zA-Z_][a-zA-Z0-9_]*\s*\(\)\s*\{/ {
            if (comment != "") {
                print "# " comment
            }
            if (match($0, /^([a-zA-Z_][a-zA-Z0-9_]*)\s*\(\)\s*\{/, arr)) {
                print arr[1]
            }
            comment = ""
        }
    ' "$ALIASES_FILE"
    echo
fi