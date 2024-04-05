PROGRAM="Tmux"
CONFIG_FOLDER="tmux"

echo "-------------> Installing $PROGRAM"
#wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
#sudo dpkg -i nvim*.deb
#rm nvim*.deb
#$pminstall ghostscript

echo "-------------> Configurando $PROGRAM"
ln -sf $(pwd) ~/.config/$CONFIG_FOLDER
rm -rf ~/.local/share/tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins
