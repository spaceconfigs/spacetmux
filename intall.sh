PROGRAM="Tmux"
CONFIG_FOLDER="tmux"

echo "-------------> Installing $PROGRAM"
#wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
#sudo dpkg -i nvim*.deb
#rm nvim*.deb
#$pminstall ghostscript

echo "-------------> Configurando $PROGRAM"
mkdir -p $HOME/.config/$CONFIG_FOLDER/
mkdir -p $HOME/.local/share/tmux

ln -sf $(pwd)/$PROGRAM/* $HOME/.config/$CONFIG_FOLDER/
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins
