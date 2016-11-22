#!/bin/sh
#
# Homebrew
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.
#
###############################################################################

# Include the general functions
. ./functions/general

# No Homebrew :(
print_block "Installing Homebrew"

# Check for Homebrew
if ! command_exists brew; then

  print_line "If nothing is moving for a while, try hitting" "Return"

  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /tmp/homebrew-install.log

else

  # Let the user know what's happening
  print_error "Homebrew already installed"

fi

print_block "Installing brew packages from Brewfile"

echo "› brew bundle -v"
brew bundle -v

# And we're done
print_block_end
