
#!/usr/bin/zsh

# This script assumes you have neovim and tmux downloaded and setup. 

# Install Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
# install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
