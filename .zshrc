# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/chad/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export ZSH=/home/chad/.oh-my-zsh

ZSH_THEME="bullet-train"

BULLETTRAIN_PROMPT_ADD_NEW_LINE=false
BULLETTRAIN_PROMPT_ORDER=(
    context
    time
    screen
    status
    dir
    perl
    virtualenv
    git
)
BULLETTRAIN_TIME_12HR=true
BULLETTRAIN_CONTEXT_HOSTNAME=%M
BULLETTRAIN_DIR_EXTENDED=2
BULLETTRAIN_GIT_COLORIZE_DIRTY=true

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

# No plugins yet, might add more later
plugins=(
)

source $ZSH/oh-my-zsh.sh

PATH=$PATH:$HOME/bin

local cmd=$((RANDOM % 2))

case $((RANDOM % 2)) in
    0) cowcmd="cowsay" ;;
    *) cowcmd="cowthink" ;;
esac

local cowargs=('-b' '-d' '-g' '-p' '-s' '-t' '-w' '-y')
local cowarg=${cowargs[$RANDOM % ${#cowargs[@]}]}

fortune | $cowcmd $cowarg
echo
