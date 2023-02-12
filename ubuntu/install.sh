#!/bin/bash

set -ue -o pipefail

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y \
    vim \
    git \
    zsh \
    make \
    tmux \
    curl \
    xsel \
    ripgrep \
    lsb-release \
    ca-certificates

## chsh を使ってログインシェルを変更すると、IM設定がバグる
## 代わりに、~/.bashrc に `exec $(which zsh) -i` を入れる
## https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=983116
# chsh -s $(which zsh)

readonly ARCH=$(dpkg --print-architecture)
readonly DIST_CODE=$(lsb_release -cs)

## Vim
curl -fsSLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## Google Chrome
### インストール後の処理で ${SRCLISTS}/google-chrome.list の内容が
### 上書きされるので、素直に deb パッケージからインストールする。
readonly CHROME_DEB=/tmp/google-chrome.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_${ARCH}.deb -O ${CHROME_DEB}
sudo dpkg -i ${CHROME_DEB}
rm ${CHROME_DEB}

## 3rd Party APT リポジトリの追加方法は下記を参考にした。
## https://zenn.dev/spiegel/articles/20220508-apt-key-is-deprecated
## https://blog.n-z.jp/blog/2022-07-04-apt-key-signed-by.html

readonly SRCLISTS=/etc/apt/sources.list.d
readonly KEYRINGS=/etc/apt/keyrings
sudo install -d ${KEYRINGS}

## VSCode
sudo curl -fsSL https://packages.microsoft.com/keys/microsoft.asc -o \
    ${KEYRINGS}/microsoft.asc
echo "deb [arch=${ARCH} signed-by=${KEYRINGS}/microsoft.asc] \
    https://packages.microsoft.com/repos/code stable main" | \
    sudo tee ${SRCLISTS}/vscode.list > /dev/null

## Docker
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o \
    ${KEYRINGS}/docker-key.asc
echo "deb [arch=${ARCH} signed-by=${KEYRINGS}/docker-key.asc] \
    https:download.docker.com/linux/ubuntu ${DIST_CODE} stable" | \
    sudo tee ${SRCLISTS}/docker.list > /dev/null

## Github CLI
sudo curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg -o \
    ${KEYRINGS}/githubcli-archive-keyring.gpg
echo "deb [arch=${ARCH} signed-by=${KEYRINGS}/githubcli-archive-keyring.gpg] \
    https://cli.github.com/packages stable main" | \
    sudo tee ${SRCLISTS}/github-cli.list > /dev/null

sudo apt update
sudo apt install -y \
    gh \
    code \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-compose-plugin

sudo systemctl --now enable docker
sudo usermod -aG docker ${USER}
newgrp docker

sudo apt autoremove -y
