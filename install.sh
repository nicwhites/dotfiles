#! /bin/bash

#Install neovim. NOTE: This wil change based on which distro is being used
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo mv nvim.appimage /usr/bin/nvim
sudo chmod +rx /usr/bin/nvim
#TODO Add alias for vim



