set -e

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo >>$(pwd)/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>/Users/tranta/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew bundle

# install oh-my-zsh, requires temporary deletion of config from dotfile
rm -rf $(pwd)/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chezmoi apply
