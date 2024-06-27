#!/bin/bash

lines="source \$HOME/.aliases/aliases"

# Update .bashrc if it doesn't already contain the source line
if ! grep -qxF "$lines" "$HOME/.bashrc"; then
    echo "$lines" >> "$HOME/.bashrc"
    echo "Lines successfully added to .bashrc"
else
    echo "Lines already exist in .bashrc"
fi

# Update the appropriate profile file for bash
if [ -f "$HOME/.bash_profile" ]; then
    profile="$HOME/.bash_profile"
elif [ -f "$HOME/.profile" ]; then
    profile="$HOME/.profile"
fi

if [ -n "$profile" ] && ! grep -qxF "source \$HOME/.bashrc" "$profile"; then
    echo "source \$HOME/.bashrc" >> "$profile"
    echo "Added sourcing of .bashrc to $profile"
fi

# Reload bash profile
if [ -n "$profile" ]; then
    source "$profile"
fi

# Check if the user is using zsh
if [ -n "$ZSH_VERSION" ]; then
    # Update .zshrc if it doesn't already contain the source line
    if ! grep -qxF "$lines" "$HOME/.zshrc"; then
        echo "$lines" >> "$HOME/.zshrc"
        echo "Lines successfully added to .zshrc"
    else
        echo "Lines already exist in .zshrc"
    fi

    # Update the appropriate profile file for zsh
    if [ -f "$HOME/.zprofile" ]; then
        zprofile="$HOME/.zprofile"
    fi

    if [ -n "$zprofile" ] && ! grep -qxF "source \$HOME/.zshrc" "$zprofile"; then
        echo "source \$HOME/.zshrc" >> "$zprofile"
        echo "Added sourcing of .zshrc to $zprofile"
    fi

    # Reload zsh profile
    if [ -n "$zprofile" ]; then
        source "$zprofile"
    fi
fi
