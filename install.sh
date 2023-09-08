
#!/usr/bin/zsh

# This script assumes you have neovim and tmux downloaded and setup. 
#
#


pkg_manager=""

# Define an array of package names
packages=("tmux" "neovim" "rust" "golang" "lua")

if [ -f /etc/os-release ]; then
    source /etc/os-release
    if [ "$ID" == "arch" ]; then
        pkg_manager="sudo pacman -S"
    elif [ "$ID" == "debian" ]; then
        pkg_manager="sudo apt-get install"
    elif [ "$ID" == "fedora" ]; then
        pkg_manager="sudo dnf install"
    else
        echo "Unsupported Linux distribution. Please install packages manually."
        exit 1
    fi

    # Iterate through the packages and install them
    for package in "${packages[@]}"; do
        $pkg_manager "$package"
    done
else
    echo "This system does not have an /etc/os-release file."
    # Add actions for systems without /etc/os-release here
fi

# Install Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Ask the user a yes/no question
echo "Do you want to install and switch to zsh? (y/n)"

# Read the user's input into a variable
read user_input

# Convert the user's input to lowercase for case-insensitive comparison
user_input_lower=$(echo "$user_input" | tr '[:upper:]' '[:lower:]')

# Check the user's input and take action accordingly
if [ "$user_input_lower" == "y" ]; then

    # ZSH customization
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Theme
    git clone https://github.com/ChesterYue/ohmyzsh-theme-passion
    cp ./ohmyzsh-theme-passion/passion.zsh-theme ~/.oh-my-zsh/themes/passion.zsh-theme
    sed -i 's/^ZSH_THEME=.*/ZSH_THEME="passion"/' ~/.zshrc
    chsh -s $(whereis zsh | awk '{print $2}')
    $pkg_manager bc
    echo "Log out then back in for new shell"

elif [ "$user_input_lower" == "n" ]; then
    echo "Using default shell: $SHELL"
else
    echo "Invalid input. Please enter 'y' for yes or 'n' for no."
fi



