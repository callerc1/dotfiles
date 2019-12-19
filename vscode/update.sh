#!/bin/sh
#
set -e

# Include the general functions
. ./functions/general

print_block "Updating vscode extensions"

DOTFILES_VSCODE_DIR="$DOTFILES/vscode"

# Load list of vscode extensions to update from the extensions file
OLDIFS=$IFS; IFS=$'\n' extensions=($(egrep -v '(^#|^$)' $DOTFILES_VSCODE_DIR/extensions)); IFS=$OLDIFS

for extension in "${extensions[@]}"; do
  # Check if it's not in the do not install array in .localrc
  if inArray "$extension" "${GLOBAL_VSCODE_EXTENSION_IGNORE[@]}"; then
    print_line "Ignored" "${extension}"
  else
    print_line "Installing" ${extension}
    code --install-extension ${extension}
  fi
done

# Update installed list
code --list-extensions > ~/.dotfiles/vscode/extensions

# And we're done
print_block_end
