########################
# ~/.zshrc
########################

# インタラクティブじゃなければ何もしない
case $- in
    *i*) ;;
      *) return ;;
esac

########################
# 環境
########################
# プロンプト 以外でも色を使えるようにする
# fore: ${fg[color]}...${reset_color}
# back: ${bg[color]}...${reset_color}
autoload -Uz colors
colors

# プロンプト
local p_user="%B%F{blue}%n@%m%f%b"
local p_path="%F{cyan}%~%f"
local p_time="%F{yellow}%t%f"
local p_prom="%B%(?,%F{green},%F{red})%(!,#,>)%f%b"
# PROMPT="$p_user:$p_path"$'\n'"$p_time $p_prom "

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified


########################
# ls コマンド関連
########################
# ls と zsh のファイル名補完に色を付ける
case ${OSTYPE} in
    darwin*)
        # BSD, Mac
        export LSCOLORS=gxfxcxdxbxegedabagacad
        alias ls='ls -aFG'
        ;;
    linux*)
        # GNU/Linux
        # bash と zsh で変数が違う
        export LS_COLORS="di=36;01:ln=35;01:ex=32;01"
        export ZLS_COLORS=${LS_COLORS}
        # s:string: で string 区切りで文字列を分割できる(:の部分は任意の文字に置き換え可能)
        # http://neko-mac.blogspot.com/2015/03/mac_18.html
        # list-colors の引数は空白区切り
        zstyle ':completion:*' list-colors ${(s.:.)ZLS_COLORS}
        alias ls='ls -aF --color=auto'
        ;;
esac


########################
# cd コマンド関連
########################
setopt auto_cd
DIRSTACKSIZE=20
setopt auto_pushd
setopt pushd_ignore_dups
chpwd() { ls }

function mkcd() {
    mkdir -p $1 && cd $1
}


########################
# コマンド履歴
########################
HISTSIZE=10000
SAVEHIST=100000
HISTFILE=${HOME}/.zsh_history
# setopt share_history
setopt hist_verify          # ヒストリ展開後すぐに実行しない
setopt hist_ignore_dups     # 直前のコマンドと同じなら履歴に追加しない
setopt hist_ignore_all_dups # 重複するコマンドは過去の履歴から削除
setopt hist_reduce_blanks   # 末尾の空白は削除
setopt hist_save_no_dups    # 重複するコマンドはファイルから削除
setopt hist_no_store        # history は保存しない
# コマンド実行日時を出力
alias history='history -t "%F %T"'


########################
# 補完
########################
# 補完を有効にする
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
autoload -Uz compinit
compinit -u
# そのまま補完→候補がなければ小文字を大文字にして補完
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'

# プロセスとジョブの補完
# https://gihyo.jp/dev/serial/01/zsh-book/0005#sec1_h4
zstyle ':completion:*:(processes|jobs)' menu yes select=2


########################
# vcs_info
########################
# バージョン管理システムから情報を取得する
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats "%F{yellow}[%b]%f"
precmd() { vcs_info }

setopt prompt_subst
# PROMPT="$p_user:$p_path "'${vcs_info_msg_0_}'$'\n'"$p_time $p_prom "
PROMPT='${vcs_info_msg_0_}'" $p_path"$'\n'"$p_time$p_prom "


########################
# エイリアス
########################
alias cp='cp -i'
alias mv='mv -i'

if which pbcopy >/dev/null 2>&1; then
    :
elif which xsel >/dev/null 2>&1; then
    alias pbcopy='xsel --input --clipboard'
fi

lscolor() {
  print -cP $(seq -w 0 255 | xargs -I# -r echo "%B%F{#}#%f%b")
}
