#!/bin/zsh

# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT

# allows you to type Bash style comments on your command line
# good 'ol Bash
# setopt interactivecomments

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
if [[ $TERM == xterm ]]; then TERM=xterm-256color; fi
source $ZSH/oh-my-zsh.sh

autoload -Uz compinit
compinit

# load zgen
source "${HOME}/.zgen/zgen.zsh"


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

    zsh-users/zsh-completions src
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-history-substring-search

    mafredri/zsh-async
    sindresorhus/pure

EOPLUGINS
    zgen oh-my-zsh plugins/vi
    zgen save
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Setting PATH for brew
PATH="/usr/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/opt:/usr/local/share:$PATH"
alias grep="ggrep"
# if [ -n $TMUX ]; then
#    alias vim="TERM=screen-256color vim"
# fi
alias python_ctags="ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./tags . $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))")"
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
# source /usr/local/opt/autoenv/activate.sh
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# alias rabbitmq="/usr/local/Cellar/rabbitmq/2.7.1/sbin/rabbitmq-server start"
alias kafka="kafka-server-start /usr/local/etc/kafka/server.properties"
alias zookeeper="zookeeper-server-start /usr/local/etc/kafka/zookeeper.properties"
# DEFAULT_USER=$USER

# 10ms for key sequences
KEYTIMEOUT=1
