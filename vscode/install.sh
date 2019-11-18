
#!/bin/sh
#
# Setup a machine for Visual Studio Code
#
###############################################################################

# Include the general functions
. ./functions/general

print_block "Installing VS Code Preferences";

# symlink settings in
VS_CODE_DIR="${HOME}/Library/Application Support/Code"

# make sure file exists first
mkdir -p "${VS_CODE_DIR}"

# backup old settings folder
if [ -f "${VS_CODE_DIR}/User/settings.json" ]; then
	mv "${VS_CODE_DIR}/User/settings.json" "${VS_CODE_DIR}/User/settings.json.backup"
fi
if [ -f "${VS_CODE_DIR}/User/keybindings.json" ]; then
	mv "${VS_CODE_DIR}/User/keybindings.json" "${VS_CODE_DIR}/User/keybindings.json.backup"
fi

# symlink the User folder
ln -s "${DOTFILES}/vscode/settings.json" "${VS_CODE_DIR}/User/settings.json"
ln -s "${DOTFILES}/vscode/keybindings.json" "${VS_CODE_DIR}/User/keybindings.json"


# Run updates
sh $DOTFILES/vscode/update.sh -s

print_block_end
