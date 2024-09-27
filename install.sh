PROGRAM="Tmux"
CONFIG_FOLDER="tmux"
TMUX_HOME="$HOME/.config/$CONFIG_FOLDER"
PLUGIN_DIR="$HOME/.local/share/tmux/plugins"

echo "-------------> Configurando $PROGRAM"
rm -rf "$TMUX_HOME"
ln -sf "$(pwd)" "$TMUX_HOME"

rm -rf "$PLUGIN_DIR"
git clone https://github.com/tmux-plugins/tpm "$PLUGIN_DIR"

echo "-------------> Installing tmux plugins via TPM"
"$PLUGIN_DIR/bin/install_plugins"

if [ -f "$PLUGIN_DIR/tmux-jump/Makefile" ] && [ ! -x "$PLUGIN_DIR/tmux-jump/bin/tmux-jump" ]; then
	if command -v go >/dev/null 2>&1; then
		echo "-------------> Building tmux-jump (make build)"
		(cd "$PLUGIN_DIR/tmux-jump" && make build)
	else
		echo "warning: go not found — tmux-jump will run an interactive install-wizard on first use"
	fi
fi

echo "-------------> Done"
