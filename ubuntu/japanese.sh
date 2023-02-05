#!/bin/bash

set -ue -o pipefail

sudo apt update
sudo apt upgrade -y

sudo apt install language-pack-ja
## man ページの日本語化はどっちでもいいかな
# sudo apt install manpages-ja manpages-ja-dev

## Input Method の日本語化
## https://gihyo.jp/admin/serial/01/ubuntu-recipe/0689
sudo apt install fcitx5-mozc
im-config -n fcitx5

## keyboard-layout
### [NOTE] USキーボード+Fcitx5 の場合、システム設定の入力ソースを US にする必要がある
localectl set-x11-keyboard us pc105 qwerty ctrl:swapcaps
