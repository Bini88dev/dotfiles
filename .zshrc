# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Added locations to path variable
export PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin

# Set history file
HISTFILE=~/.zshistory

# Set history size
HISTSIZE=1000

# Set the number of lines in $HISTFILE
SAVEHIST="${HISTSIZE}"

# Enable history search with up and down arrows
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

# All terminal sessions append to the history file immediately as commands are entered
setopt inc_append_history

# save timestamp of command and duration
setopt extended_history

# when trimming history, lose oldest duplicates first
setopt hist_expire_dups_first

# When a duplicate command is entered, remove the oldest duplicate
setopt hist_ignore_all_dups

# remove command line from history list when first character on the line is a space
setopt hist_ignore_space

# Remove extra blanks from each command line being added to history
setopt hist_reduce_blanks

# Reads the history file every time history is called
# This means that the history command will show recent entries, even between terminal sessions
setopt share_history

# Fix Interop Error that randomly occurs in vscode terminal when using WSL2
fix_wsl2_interop() {
    for i in $(pstree -np -s $$ | grep -o -E '[0-9]+'); do
        if [[ -e "/run/WSL/${i}_interop" ]]; then
            export WSL_INTEROP=/run/WSL/${i}_interop
        fi
    done
}

# Vagrant config needed inside WSL2
export VAGRANT_DEFAULT_PROVIDER="hyperv"
export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"

# Goto
[[ -s "/usr/local/share/goto.sh" ]] && source /usr/local/share/goto.sh

# NVM directory
export NVM_DIR="$HOME/.nvm"

# NVM lazy load
if [ -s "$HOME/.nvm/nvm.sh" ]; then
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  alias nvm='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && nvm'
  alias node='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && node'
  alias npm='unalias nvm node npm && . "$NVM_DIR"/nvm.sh && npm'
fi

# Enable colors and change prompt:
# autoload -U colors && colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

## Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Aliases and functions
source ~/.bash_aliases

## Automate it...
#  zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

#  zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#  zsh-completions


#  zsh-history-substring-search


## Starship...disable eveything else before enabling this...just one Theme should be active at the time
# find out which distribution we are running on
#LFILE="/etc/*-release"
#MFILE="/System/Library/CoreServices/SystemVersion.plist"
#if [[ -f $LFILE ]]; then
#  _distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
#elif [[ -f $MFILE ]]; then
#  _distro="macos"
#fi
#
## set an icon based on the distro
## make sure your font is compatible with https://github.com/lukas-w/font-logos
#case $_distro in
#    *kali*)                  ICON="ﴣ";;
#    *arch*)                  ICON="";;
#    *debian*)                ICON="";;
#    *raspbian*)              ICON="";;
#    *ubuntu*)                ICON="";;
#    *elementary*)            ICON="";;
#    *fedora*)                ICON="";;
#    *coreos*)                ICON="";;
#    *gentoo*)                ICON="";;
#    *mageia*)                ICON="";;
#    *centos*)                ICON="";;
#    *opensuse*|*tumbleweed*) ICON="";;
#    *sabayon*)               ICON="";;
#    *slackware*)             ICON="";;
#    *linuxmint*)             ICON="";;
#    *alpine*)                ICON="";;
#    *aosc*)                  ICON="";;
#    *nixos*)                 ICON="";;
#    *devuan*)                ICON="";;
#    *manjaro*)               ICON="";;
#    *rhel*)                  ICON="";;
#    *macos*)                 ICON="";;
#    *)                       ICON="";;
#esac
#
#export STARSHIP_DISTRO="$ICON "
#
## Load Starship
#eval "$(starship init zsh)"

## Powerlevel10k
source ~/.powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
