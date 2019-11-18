#!/bin/sh
#
# Update homebrew
#
###############################################################################

# Include the general functions
. $DOTFILES/functions/general

# Let the user know what's happening
print_block "Updating Homebrew"

brew update && brew upgrade

print_block "Updating Brewfile"

brew bundle dump --file=$DOTFILES/homebrew/Brewfile --force --no-lock --no-restart
brew bundle list --file=$DOTFILES/homebrew/Brewfile --all

# And we're done
print_block_end
