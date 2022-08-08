## System most used commands...
alias aliaslist='sudo nano ~/.bash_aliases'
alias cls='clear'
alias restartvm='sudo shutdown -r now'
alias restart='sudo reboot'
alias disks='sudo lsblk'
alias disksstat='df -h -x squashfs -x tmpfs -x devtmpfs'
alias mem5='ps auxf | sort -nr -k 4 | head -5'
alias cpu5='ps auxf | sort -nr -k 3 | head -5'
# alias repos='grep -r --include '*.list' '^deb ' /etc/apt/sources.list /etc/apt/sources.list.d/'

## Services, network
alias services='sudo systemctl list-units --all --type=service --no-pager'
alias netports='sudo netstat -lntup'
alias mywip='curl ifconfig.me'

## SSH
alias ssha='eval $(ssh-agent) && ssh-add'

## Install, installed, update, upgrade, remove...
alias installed='sudo apt list --installed'
alias allinone='sudo apt update && sudo apt upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y && sudo apt autopurge -y'
alias inst='sudo apt install'
alias pur='sudo apt purge'
alias upd='sudo apt update'
alias upg='sudo apt upgrade'
alias ac='sudo apt autoclean'
alias ar='sudo apt autoremove'
alias ap='sudo apt autopurge'

## ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.tar.xz)    tar xJf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

## Lists, grep, rm, cp, mv
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias hm='cd ~/'

alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias na='nano'
alias vi='vim'

## tmux
alias tmuxk='tmux kill-session -a'
alias tmuxa='tmux attach -t'
alias tmuxl='tmux list-sessions'

## Git
gitpush() {
    git add .
    git commit -m "$*"
    git pull
    git push
}
gitupdate() {
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/*.key
    ssh -T git@github.com
}
alias gp=gitpush
alias gu=gitupdate

# alias gs='git status'
# alias gss='git status -s'
# alias ga='git add'
# alias gp='git push'
# alias gpraise='git blame'
# alias gpo='git push origin'
# alias gpt='git push --tag'
# alias gtd='git tag --delete'
# alias gtdr='git tag --delete origin'
# alias grb='git branch -r'                                                                           # display remote branch
# alias gplo='git pull origin'
# alias gb='git branch '
# alias gc='git commit'
# alias gd='git diff'
# alias gco='git checkout '
# alias gl='git log --pretty=oneline'
# alias gr='git remote'
# alias grs='git remote show'
# alias glol='git log --graph --abbrev-commit --oneline --decorate'
# alias gclean="git branch --merged | grep  -v '\\*\\|master\\|develop' | xargs -n 1 git branch -d" # Delete local branch merged with master
# alias gblog="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:red)%(refname:short)%(color:reset) - %(color:yellow)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:blue)%(committerdate:relative)%(color:reset))'"                                                             # git log for each branches
# alias gsub="git submodule update --remote"                                                        # pull submodules
# alias gj="git-jump"                                                                               # Open in vim quickfix list files of interest (git diff, merged...)
# 
# alias dif="git diff --no-index"                                                                   # Diff two files even if not in git repo! Can add -w (don't diff whitespaces)

## yadm
alias yadmco='export GPG_TTY=$(tty)'
alias yadmcom='yadm commit -m'
alias yadmcl='yadm clone'
alias yadms='yadm status'
alias yadmls='yadm list -a'
alias yadme='yadm encrypt'
alias yadmd='yadm decrypt'
alias yadmpush="yadm push -u origin"

## Docker
alias dockls="docker container ls | awk 'NR > 1 {print \$NF}'"                  # display names of running containers
alias dockrm='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'   # delete every containers / images
alias dockstats='docker stats $(docker ps -q)'                                  # stats on images
alias dockimg='docker images'                                                   # list images installed
alias dockprune='docker system prune -a'                                        # prune everything
alias dockco='docker compose up -d'                                             # run compose script
# alias dockceu='docker compose run --rm -u $(id -u):$(id -g)'                    # run as the host user
