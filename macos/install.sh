#!/bin/bash

set -ue -o pipefail

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH=$PATH:/opt/homebrew/bin

brew update && brew upgrade

brew install gcc gawk gnu-sed glow git \
  iterm2 mysql-client ripgrep n pyenv tmux vim jq yj \
  zsh-completions zsh-autosuggestions

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

brew install visual-studio-code virtualbox vagrant

code --install-extension streetsidesoftware.code-spell-checker
code --install-extension github.copilot
code --install-extension eamodio.gitlens
code --install-extension ms-ceintl.vscode-language-pack-ja
code --install-extension ms-toolsai.jupyter
code --install-extension yzhang.markdown-all-in-one
code --install-extension bierner.markdown-mermaid
code --install-extension davidanson.vscode-markdownlint
code --install-extension ms-python.python
code --install-extension vscodevim.vim

