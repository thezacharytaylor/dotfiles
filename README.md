# Dotfiles

My configuration files.
Currently migrating from MacOS back to Linux (after 13 years!).
Check the branches for my old MacOS Sequoia setup.

## Notables

- **Operating System**: Fedora Linux 42
- **Desktop Environment**: GNOME
- **Window Manager**: GNOME Shell
- **Terminal**: Ptyxis (for some reason, I'm surprised too)
- **Terminal Theme**: Starship
- **Terminal Palette**: Horizon
- **Font**: GeistMono Nerd Font
- **Keyboard**: Colemak
- **Editor**: NeoVim, AstroVim flavor (Also VSCodium as a backup)
- **Editor Theme**: Dawnfox/Duskfox
- **Towel**: Acquired
- **Notes**: Obsidian for note taking.

## TODO

- [ ] Add new install instructions for Linux
- [ ] Add/complete system links.
- [x] Move all folders to config folder.
- [ ] Update system links
- [ ] Automate/get a manager
- [ ] Get a theme switcher
- [x] Contribute to Witch Hazel Theme (Kitty)
- [ ] Fix lualine for Witch Hazel Theme
- [ ] Propose a light version of Witch Hazel Theme

## Linux Setup Steps

```bash
# Setup zsh
sudo dnf install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -sS https://starship.rs/install.sh | sh

# Link up some config files
cd ~
mkdir repos
cd repos
git clone git@github.com:thezacharytaylor/dotfiles.git
ln -sf /path/to/dotfiles/config/.git /home/???/.gitconfig
ln -s /path/to/dotfiles/config/nvim /home/???/.config/nvim
ln -sf /path/to/dotfiles/config/zsh/zshrc /home/???/.zshrc
ln -s /path/to/dotfiles/config/zsh /home/???/.config/zsh
source /home/???/.zshrc

# Further setup NeoVim
# Get Nerd Fonts and Install
# Change terminal font to a nerd font to make NeoVim pretty
cargo install --locked tree-sitter-cli
sudo dnf install ripgrep
sudo dnf copr enable atim/bottom -y
# confirm python's installation
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
curl -fsSL https://pyenv.run | bash
cd /path/to/dotfiles/config/zsh
nvim keys.ssh
# save file and/or add any API keys now or later
source /home/???/.zshrc
sudo dnf in zoxide wp-cli php php-common composer

# Sort out DNS; See instructions:
# https://mullvad.net/en/help/dns-over-https-and-dns-over-tls#linux
```
