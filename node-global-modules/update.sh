#!/bin/sh
# Update Node global node_modules
set -e

# Include the general functions
. ./functions/general

print_block "Updating Node.js global modules"

DOTFILES_NODE_GLOBAL_MODULES_DIR="$DOTFILES/node-global-modules"

# Update list of globals
\ls $(npm root -g) | cut -f1 -d'/' | grep -v 'npm' > $DOTFILES_NODE_GLOBAL_MODULES_DIR/npm-global

cat $DOTFILES_NODE_GLOBAL_MODULES_DIR/npm-global
