#!/bin/bash

lines="source \$HOME/.aliases/aliases"

if ! grep -qxF "$lines" "$HOME/.bashrc"; then
    # Append the lines to .bashrc
    echo "$lines" >> "$HOME/.bashrc"
    echo "Lines successfully added to .bashrc"
else
    echo "Lines already exist in .bashrc"
fi

if [ -f "$HOME/.bash_profile" ]; then
    profile="$HOME/.bash_profile"
elif [ -f "$HOME/.profile" ]; then
    profile="$HOME/.profile"
fi

if [ -n "$profile" ] && ! grep -qxF "source \$HOME/.bashrc" "$profile"; then
    echo "source \$HOME/.bashrc" >> "$profile"
    echo "Added sourcing of .bashrc to $profile"
fi

# Reload profile
if [ -n "$profile" ]; then
    source "$profile"
fi
