#! /bin/bash


# DON'T RUN THIS UNLESS ON A LINUX MACHINE



#Install neovim. NOTE: This wil change based on which distro is being used
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo mv nvim.appimage /usr/bin/nvim
sudo chmod +rx /usr/bin/nvim
#TODO Add alias for vim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
	 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
mkdir -p ~/.config
cp -r nvim ~/.config/
