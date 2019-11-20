#!/bin/sh
#
# Installs -
# Node Global Modules
#
###############################################################################

# Include the general functions
. ./functions/general

# Check for NPM
if ! command_exists npm; then

  print_error "Nooooooo! Npm isn't installed! Can't install NPM Global Modules"

else

  print_block "Installing NPM Global Modules"

  DOTFILES_NODE_GLOBAL_MODULES_DIR="$DOTFILES/node-global-modules"

  # Load list of global node_modules to update from the npm-global file
  OLDIFS=$IFS; IFS=$'\n' node_modules=($(egrep -v '(^#|^$)' $DOTFILES_NODE_GLOBAL_MODULES_DIR/npm-global)); IFS=$OLDIFS

  for module in "${node_modules[@]}"; do
    # Check if it's not in the do not install array in .localrc
    if inArray "$module" "${GLOBAL_NODE_MODULES_IGNORE[@]}"; then
      print_line "Ignored" "${module}"
    else
      print_line "Installing" ${module}
      npm install --global ${module}
    fi
  done

fi

# And we're done
print_block_end
