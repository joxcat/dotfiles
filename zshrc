#!/bin/bash

export TERM="xterm-256color"

# --- ZSH ---
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)
export ZSH_HIGHLIGHT_PATTERNS=('rm *' 'fg=white,bold,bg=red')

# DISABLE_AUTO_UPDATE="true"
export DISABLE_UPDATE_PROMPT="true"
export ENABLE_CORRECTION="true"
export DISABLE_UNTRACKED_FILES_DIRTY="true"

# --- Cross platform management ---
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="emacs -nw"
  export VISUAL="$EDITOR"
fi

# Import env
platform=$(uname)
if [[ $platform = 'Darwin' ]]; then
  # Apple
  echo 1
else
  # Default
  echo 2
fi

# Imports bash utils
source "$DOTFILES_PATH/install-scripts/functions-utils.bash"

# --- Rebinds ---
# shortcuts
alias findfile="$HOME/.cargo/bin/fd"
alias sz="source ~/.zshrc"
function trust-ssh() { ssh -o UserKnownHostsFile=/dev/null -T "$1" /bin/bash -i }

# git
alias ga="git add"
alias gc="git commit"
alias gcm="gc -m"
alias gk="git checkout"
alias gm="git merge"
alias gb="git branch"
alias gf="git fetch"
alias gp="git pull"
alias gst="git status"
alias gsh="git show"
alias gl="git log"
alias gd="git diff --minimal -B -M -C --color-moved=zebra"
alias gsl="git stash list"
alias gsa="git-stash-apply"
alias gs="git stash"

# --- Sources ---

starship init bash | source
navi widget bash | source
