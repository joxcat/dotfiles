#  _____    _
# |__  /___| |__  _ __ ___
#   / // __| '_ \| '__/ __|
#  / /_\__ \ | | | | | (__
# /____|___/_| |_|_|  \___|

source .profile
source .zprofile

# Syntax highlighting and tab completion
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh

autoload -Uz compinit

# Show OS info when opening a new terminal
neofetch

# Font mode for powerlevel9k
P9K_MODE="nerdfont-complete"

# Prompt elements
P9K_LEFT_PROMPT_ELEMENTS=(custom_user dir vcs)
P9K_RIGHT_PROMPT_ELEMENTS=(background_jobs go_version rbenv)

# Set name of the theme to load.
ZSH_THEME="powerlevel9k"

# Prompt settings
P9K_PROMPT_ON_NEWLINE=true
P9K_RPROMPT_ON_NEWLINE=true
P9K_MULTILINE_FIRST_PROMPT_PREFIX_ICON=$'%K{white}%k'
P9K_MULTILINE_LAST_PROMPT_PREFIX_ICON=$'%K{green}%F{black} \uf155 %f%F{green}%k\ue0b0%f '

# Separators
P9K_LEFT_SEGMENT_SEPARATOR_ICON=$'\ue0b0'
P9K_LEFT_SUBSEGMENT_SEPARATOR_ICON=$'\ue0b1'
P9K_RIGHT_SEGMENT_SEPARATOR_ICON=$'\ue0b2'
P9K_RIGHT_SUBSEGMENT_SEPARATOR_ICON=$'\ue0b7'

# Dir colours
P9K_DIR_HOME_BACKGROUND='black'
P9K_DIR_HOME_FOREGROUND='white'
P9K_DIR_HOME_SUBFOLDER_BACKGROUND='black'
P9K_DIR_HOME_SUBFOLDER_FOREGROUND='white'
P9K_DIR_DEFAULT_BACKGROUND='yellow'
P9K_DIR_DEFAULT_FOREGROUND='black'
P9K_DIR_SHORTEN_LENGTH=2
P9K_DIR_SHORTEN_STRATEGY="truncate_from_right"

# OS segment
P9K_OS_ICON_BACKGROUND='black'
P9K_LINUX_ICON='%F{cyan} \uf303 %F{white} arch %F{cyan}linux%f'

# VCS icons
P9K_VCS_GIT_ICON=$'\uf1d2 '
P9K_VCS_GIT_GITHUB_ICON=$'\uf113 '
P9K_VCS_GIT_GITLAB_ICON=$'\uf296 '
P9K_VCS_BRANCH_ICON=$''
P9K_VCS_STAGED_ICON=$'\uf055'
P9K_VCS_UNSTAGED_ICON=$'\uf421'
P9K_VCS_UNTRACKED_ICON=$'\uf00d'
P9K_VCS_INCOMING_CHANGES_ICON=$'\uf0ab '
P9K_VCS_OUTGOING_CHANGES_ICON=$'\uf0aa '

# VCS colours
P9K_VCS_MODIFIED_BACKGROUND='blue'
P9K_VCS_MODIFIED_FOREGROUND='black'
P9K_VCS_UNTRACKED_BACKGROUND='green'
P9K_VCS_UNTRACKED_FOREGROUND='black'
P9K_VCS_CLEAN_BACKGROUND='green'
P9K_VCS_CLEAN_FOREGROUND='black'

# VCS CONFIG
P9K_VCS_SHOW_CHANGESET=false

# Status
P9K_STATUS_OK_ICON=$'\uf164'
P9K_STATUS_ERROR_ICON=$'\uf165'
P9K_STATUS_ERROR_CR_ICON=$'\uf165'

# Battery
P9K_BATTERY_LOW_FOREGROUND='red'
P9K_BATTERY_CHARGING_FOREGROUND='blue'
P9K_BATTERY_CHARGED_FOREGROUND='green'
P9K_BATTERY_DISCONNECTED_FOREGROUND='blue'
P9K_BATTERY_VERBOSE=true

# Programming languages
P9K_RBENV_PROMPT_ALWAYS_SHOW=true
P9K_GO_VERSION_PROMPT_ALWAYS_SHOW=true

# User with skull
user_with_skull() {
    echo -n "\ufb8a $(whoami)"
}
P9K_CUSTOM_USER="user_with_skull"

# Command auto-correction.
ENABLE_CORRECTION="true"

# Command execution time stamp shown in the history command output.
HIST_STAMPS="yyyy/mm/dd"

# Plugins to load
plugins=(git
         gitfast
         golang
         cargo
	     rust
         history-substring-search
         zsh-autosuggestions
         zsh-completions
         zsh-syntax-highlighting
	     wd
         dotenv)

# OPAM (ocaml builder)
# eval $(opam env)
         
autoload -U compinit && compinit
source /usr/share/oh-my-zsh/oh-my-zsh.sh

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.luarocks/bin"
export PATH="$PATH:$HOME/.gem/ruby/2.6.0/bin"
export PATH="$PATH:$HOME/.opam/default/bin"

# Aliases for a few useful commands
alias mirrorUpdate="sudo pacman-mirrors -f"
alias pacmanGhost="~/.pacman.sh"
alias rmPacmanOrphans="sudo pacman -Rns $(pacman -Qtdq)"
alias cat="bat"
alias ls="lsd"
alias ip="ip -c"
alias rm="trash" # before it was rm="rm -i" 
alias x="ranger"
alias c="cmus"
alias h="htop"
alias vim="nvim"
alias ssh-setup="eval \"`ssh-agent`\" ssh-add"
alias clean="clear"
alias pdf="epdfview"
alias explore-dir="godu"
# alias emacs="emacsclient -c -a emacs"

## Fun aliases
alias please="sudo"
alias update="pacman -Syyu"
alias install="pacman -S"

# Scripts to run on cli start
$HOME/.local/bin/trash --auto-clean

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
