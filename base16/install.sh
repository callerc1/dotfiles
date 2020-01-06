#!/bin/sh
#
# git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
# A shell script to change your shell's default ANSI colors but most importantly, colors 17 to 21 of your shell's 256 colorspace (if supported by your terminal). This script makes it possible to honor the original bright colors of your shell (e.g. bright green is still green and so on) while providing additional base16 colors to applications such as Vim.

# Include the general functions
. ./functions/general

if [ ! -d "$VENDOR/base16-shell" ]; then
  print_block "Installing base16-shell"
  cd $VENDOR
  git clone https://github.com/chriskempson/base16-shell.git
  echo "Copying base16 hardcore in place...";
  cd $DOTFILES/base16
  cp base16-hardcore.sh $VENDOR/base16-shell/scripts
  print_task "Remember to enable hardcore 🌈 scheme with" "'base16_hardcore'";
  print_task "Want to use hardcore 🌈 scheme with vim?" "'cp $DOTFILES/base16/base16-hardcore.vim ~/.vim/plugged/base16-vim/colors'"
else
  if [ -d "$ZSH" ]; then
  echo "\033[0;33mYou already have Base 16 Shell installed.\033[0m You'll need to remove $VENDOR/base16-shell if you want to install";
  else echo "Your base16-shell instalation failed!";
  fi
fi

exit 0
