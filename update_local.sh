


echo "Removing old configs..."
rm -rf ~/.config/nvim/*
rm -rf ~/.config/tmux/*
echo "Local NVIM config updated"
cp -r ./nvim/ ~/.config/nvim/
echo "Local tmux config updated"
cp -r ./tmux/ ~/.config/tmux/

