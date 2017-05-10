#!/bin/zsh
start_time="$(date +%s)"

# Antigen — A zsh plugin manager
source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo declared above.
antigen bundles <<EOBUNDLES

brew
lein
pip
node

# Guess what to install when running an unknown command.
command-not-found

# Helper for extracting different types of archives.
extract

# Help working with version control systems.
git
gitfast

# nicoulaj's moar completion files for zsh
zsh-users/zsh-completions src

# ZSH port of Fish shell's history search feature.
zsh-users/zsh-history-substring-search

# Syntax highlighting bundle.
zsh-users/zsh-syntax-highlighting

# Auto update Antigen.
unixorn/autoupdate-antigen.zshplugin

# Auto Python Environment.
kennethreitz/autoenv

EOBUNDLES

# Load the prompt theme.
# antigen theme prose
antigen theme caiogondim/bullet-train-oh-my-zsh-theme bullet-train

# Vim like bindings plugin. Need to run after theme, so mode indicator
# can be set, if the theme didn't already set it.
# antigen-bundle sharat87/zsh-vim-mode
# ZSH_VIM_MODE_NORMAL_MAP=^k
# antigen bundle ~/labs/zsh-vim-mode --no-local-clone

# Tell Antigen that we're done.
antigen apply

end_time="$(date +%s)"
echo Loading Antigen: $((end_time - start_time)) seconds
echo Complete!
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Setting PATH for brew
PATH="/usr/bin:/bin:/usr/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/opt:/usr/local/share:$PATH"

eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
source /usr/local/opt/autoenv/activate.sh
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
