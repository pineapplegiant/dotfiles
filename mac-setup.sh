#! /bin/bash

# Absolute path of our dotfiles repository
DIR=$(cd `dirname $0` && pwd)


# Overwrite existing symlinks if necessary

##/********************************************************************* 
##** SHELL
##*********************************************************************/ 

echo "Symlinking bash_profile..."
ln -sf $DIR/.bash_profile ~/.bash_profile

echo "Symlinking bashrc..."
ln -sf $DIR/.bashrc ~/.bashrc

echo "Symlinking inputrc..."
ln -sf $DIR/.inputrc ~/.inputrc

echo "Symlinking zshrc..."
ln -sf $DIR/.zshrc ~/.zshrc

##/********************************************************************* 
##** DEVELOPMENT
##*********************************************************************/ 

echo "Symlinking eslintrc..."
ln -sf $DIR/.eslintrc ~/.eslintrc

echo "Symlinking yarnrc..."
ln -sf $DIR/.yarnrc ~/.yarnrc

echo "Symlinking tmux conf..."
ln -sf $DIR/.tmux.conf ~/.tmux.conf

echo "Symlinking vimrc..."
ln -sf $DIR/.vimrc ~/.vimrc

echo "Symlinking Neovim..."
ln -sf $DIR/nvim/init.vim /Users/$USER/.config/nvim/init.vim
ln -sf $DIR/nvim/general.vim /Users/$USER/.config/nvim/general.vim
ln -sf $DIR/nvim/mappings.vim /Users/$USER/.config/nvim/mappings.vim
ln -sf $DIR/nvim/plugins.vim /Users/$USER/.config/nvim/plugins.vim
ln -sf $DIR/nvim/coc-settings.json /Users/$USER/.config/nvim/coc-settings.json
ln -sf $DIR/nvim/colors /Users/$USER/.config/nvim/colors
ln -sf $DIR/nvim/autoload /Users/$USER/.config/nvim/autoload
ln -sf $DIR/nvim/snippets /Users/$USER/.config/nvim/snippets


echo "Symlinking VSCODE Settings..."
ln -sf $DIR/settings.json /Users/$USER/Library/ApplicationSupport/Code/User/settings.json

echo "Symlinking VSCODE Keybindings..."
ln -sf $DIR/keybindings.json /Users/$USER/Library/ApplicationSupport/Code/User/keybindings.json

echo "Symlinking GITCONFIG..."
ln -sf $DIR/.gitconfig ~/.gitconfig

echo "Symlinking GITIGNORE..."
ln -sf $DIR/.gitignore_global ~/.gitignore_global

echo ""
echo "=== SYMLINKING COMPLETE ==="
echo ""


