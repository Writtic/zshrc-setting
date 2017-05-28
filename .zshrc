#!/bin/zsh
start_time="$(date +%s)"

# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT

# allows you to type Bash style comments on your command line
# good 'ol Bash
setopt interactivecomments

# Path to your oh-my-zsh installation.
export ZSH=/Users/johan/.oh-my-zsh

autoload -Uz compinit
compinit

# load zgen
source "~/.zgen/zgen.zsh"


if ! zgen saved; then
    echo "Creating a zgen save"

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/osx
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/python
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/brew
    zgen oh-my-zsh plugins/tmux
    zgen oh-my-zsh plugins/command-not-found

    # bulk load
    zgen loadall <<EOPLUGINS

    chrissicool/zsh-256color
    srijanshetty/docker-zsh

    zsh-users/zsh-history-substring-search
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-completions src

    mafredri/zsh-async
    sindresorhus/pure

EOPLUGINS
    zgen save
fi

end_time="$(date +%s)"
echo Loading zgen: $((end_time - start_time)) seconds
echo Complete!
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Setting PATH for brew
PATH="/usr/bin:/bin:/usr/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/opt:/usr/local/share:$PATH"

eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
# source /usr/local/opt/autoenv/activate.sh
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
DEFAULT_USER=$USER

# 10ms for key sequences
KEYTIMEOUT=1
