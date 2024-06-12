#!/bin/bash

lines="source .aliases/aliases"

if ! grep -qF "$lines" "$HOME/.bashrc"; then
    # Append the lines to .bashrc
    echo "$lines" >> "$HOME/.bashrc"
    echo "Lines successfully added to .bashrc"
else
    echo "Lines already exist in .bashrc"
fi

source ~/.aliases/aliases
