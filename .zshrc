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

export LSCOLORS=gxfxcxdxbxegedabagacad
# zstyle ':completion:*:default' list-colors ${LSCOLORS}

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified


########################
# cd コマンド関連
########################
setopt auto_cd
DIRSTACKSIZE=20
setopt auto_pushd
setopt pushd_ignore_dups
chpwd() { ls }


########################
# コマンド履歴
########################
HISTSIZE=10000
SAVEHIST=100000
# setopt share_history
setopt hist_verify
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_no_store


########################
# 補完
########################
# 補完を有効にする
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi
autoload -Uz compinit
compinit -u


########################
# vcs_info
########################
# バージョン管理システムから情報を取得する
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats "%F{yellow}[%b]%f"
precmd() { vcs_info }

setopt prompt_subst
# PROMPT="$p_user:$p_path "'${vcs_info_msg_0_}'$'\n'"$p_time $p_prom "
PROMPT='${vcs_info_msg_0_}'" $p_path"$'\n'"$p_prom "


########################
# エイリアス
########################
function mkcd() {
    mkdir -p $1 && cd $1
}

alias ls='ls -aFG'
alias cp='cp -i'
alias mv='mv -i'

alias mk='mkcd'

