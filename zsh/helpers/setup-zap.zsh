zsh_dir=${XDG_CONFIG_HOME:-$HOME/.config}/zsh
zap_dir=${ADOTDIR:-$XDG_DATA_HOME/zsh/zap}
zap_git="https://raw.githubusercontent.com/zap-zsh/zap/release-v1/install.zsh"

zap_bin="${ADOTDIR}/zap.zsh"

# Import angigen if present, or prompt to install if missing
if [[ -f $zap_bin ]]; then
  source $zap_bin
else
  if read -q "choice?Would you like to install zap now? (y/N)"; then
    echo
    mkdir -p $zap_dir
    curl -L $zap_git > $zap_bin
    source $zap_bin
  fi
fi
