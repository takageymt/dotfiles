#!/bin/bash

set -ue -o pipefail

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update && brew upgrade -y

brew install gcc gawk gnu-sed glow git mysql-client ripgrep n pyenv tmux vim jq yj \
  zsh-completions zsh-autosuggestions

brew install visual-studio-code virtualbox vagrant
