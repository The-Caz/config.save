#!/bin/bash

# Install configs
echo "-"
echo "Installing configs..."
cp -a config/. ~/.config
cp -a local_share/. ~/.local/share


# Done!
echo "-"
echo "Done! You're welcome"
