alias cls='clear'
alias netports='sudo netstat -lntup'
alias restartvm='sudo shutdown -r now'
alias installed='sudo apt list --installed'
alias services='sudo systemctl list-units --all --type=service --no-pager'
alias allinone='sudo apt update && sudo apt upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y && sudo apt autopurge -y'
alias aliaslist='sudo nano ~/.bash_aliases'
#alias repos='grep -r --include '*.list' '^deb ' /etc/apt/sources.list /etc/apt/sources.list.d/'
alias mywip='curl ifconfig.me'
alias disks='sudo lsblk'
# # ex - archive extractor
# # usage: ex <file>
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

gitpush() {
    git add .
    git commit -m "$*"
    git pull
    git push
}
gitupdate() {
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/github
    ssh -T git@github.com
}
alias gp=gitpush
alias gu=gitupdate
