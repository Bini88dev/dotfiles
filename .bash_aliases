## System most used commands...
alias aliaslist='sudo nano ~/.bash_aliases'
alias cls='clear'
alias hardrestart='sudo reboot'
alias saferestart='sudo shutdown -r now'
alias forcerestart='sudo shutdown -r -n now'
alias disks='sudo lsblk'
alias disksstat='df -h -x squashfs -x tmpfs -x devtmpfs'
# alias repos='grep -r --include '*.list' '^deb ' /etc/apt/sources.list /etc/apt/sources.list.d/'

## Get top process eating memory
alias mem5='ps auxf | sort -nr -k 4 | head -5'
alias mem10='ps auxf | sort -nr -k 4 | head -10'

## Get top process eating cpu ##
alias cpu5='ps auxf | sort -nr -k 3 | head -5'
alias cpu10='ps auxf | sort -nr -k 3 | head -10'

## List largest directories (aka "ducks")
alias dir5='du -cksh * | sort -hr | head -n 5'
alias dir10='du -cksh * | sort -hr | head -n 10'
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

## Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

## Search files in the current folder
alias f="find . | grep "

## Chmod commands
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

## Services, network
alias services='sudo systemctl list-units --all --type=service --no-pager'
alias netports='sudo netstat -lntup'
alias mywip='curl ifconfig.me'
alias openports='netstat -nape --inet'

## Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

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

## Lists, grep, rm, cp, mv
alias l='ls -CF'
alias hm='cd ~/'
alias la='ls -Alh'                # show hidden files
#alias ls='ls -aFh --color=always' # add colors and file type extensions
alias lx='ls -lXBh'               # sort by extension
alias lk='ls -lSrh'               # sort by size
alias lc='ls -ltcrh'              # sort by change time
alias lu='ls -lturh'              # sort by access time
alias lr='ls -lRh'                # recursive ls
alias lt='ls -ltrh'               # sort by date
alias lm='ls -alh |more'          # pipe through 'more'
alias lw='ls -xAh'                # wide listing format
alias ll='ls -Fls'                # long listing format
alias labc='ls -lap'              # alphabetical sort
alias lf="ls -l | egrep -v '^d'"  # files only
alias ldir="ls -l | egrep '^d'"   # directories only
alias lla='ls -Al'                # List and Hidden Files
alias las='ls -A'                 # Hidden Files
alias lls='ls -l'                 # List

alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'

alias ..='cd ..'
alias back='cd $OLDPWD'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias rm='rm -irf'
alias rmd='/bin/rm  --recursive --force --verbose '
alias cp='cp -i'
alias mv='mv -i'
alias na='nano'
alias vi='vim'

##xsel
alias pbcopy='xsel --input --clipboard'
alias pbpaste='xsel --output --clipboard'

## tmux
alias tmuxk='tmux kill-ses -t'
alias tmuxat='tmux attach -t'
alias tmuxa='tmux a'
alias tmuxl='tmux list-sessions'

## yadm
alias yadmremo='yadm remote -v'
alias yadmrepo='yadm remote add origin'
alias yadma='yadm add'
alias yadmcom='yadm commit -s -m'
alias yadmdi='yadm diff'
alias yadmcl='yadm clone'
alias yadms='yadm status'
alias yadmls='yadm list -a'
alias yadmrm='yadm rm'
alias yadme='yadm encrypt'
alias yadmd='yadm decrypt'
alias yadmpush="yadm push -u origin"

## Docker
alias dockls="docker container ls | awk 'NR > 1 {print \$NF}'"                  # display names of running containers
alias dockrm='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'   # delete every containers / images
alias dockstats='docker stats $(docker ps -q)'                                  # stats on images
alias dockimg='docker images'                                                   # list images installed
alias dockprune='docker system prune -a'                                        # prune everything
alias dockup='docker compose up -d'                                             # run compose script
# alias dockceu='docker compose run --rm -u $(id -u):$(id -g)'                    # run as the host user
alias docker-clean=' \
  docker container prune -f ; \
  docker image prune -f ; \
  docker network prune -f ; \
  docker volume prune -f '

## Scripts and Functions...
# Reload shell
reloadsh () {
    exec "${SHELL}" "$@"
}

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

## Compress tar
compresstar() {
    local DATE="$(date +%Y%m%d-%H%M%S)"
    tar cvzf "$DATE.tar.gz" "$@"
}

## Copy file with a progress bar
cpp() {
    set -e
    strace -q -ewrite cp -- "${1}" "${2}" 2>&1 |
    awk '{
        count += $NF
        if (count % 10 == 0) {
            percent = count / total_size * 100
            printf "%3d%% [", percent
            for (i=0;i<=percent;i++)
                printf "="
            printf ">"
            for (i=percent;i<100;i++)
                printf " "
            printf "]\r"
        }
    }
    END { print "" }' total_size="$(stat -c '%s' "${1}")" count=0
}

## Copy and go to the directory
cpg() {
	if [ -d "$2" ]; then
		cp "$1" "$2" && cd "$2"
	else
		cp "$1" "$2"
	fi
}

## Move and go to the directory
mvg() {
	if [ -d "$2" ]; then
		mv "$1" "$2" && cd "$2"
	else
		mv "$1" "$2"
	fi
}

## Make a directory, then go there
mkdirg() {
    test -n "$1" || return
    mkdir -p "$1" && cd "$1"
}

## "Path" shows current path, one element per line.
# If an argument is supplied, grep for it.
path() {
    test -n "$1" && {
        echo $PATH | perl -p -e "s/:/\n/g;" | grep -i "$1"
    } || {
        echo $PATH | perl -p -e "s/:/\n/g;"
    }
}

## Goes up a specified number of directories  (i.e. up 4)
up() {
	local d=""
	limit=$1
	for ((i = 1; i <= limit; i++)); do
		d=$d/..
	done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

## Automatically do an ls after each cd, z, or zoxide
cd ()
{
	if [ -n "$1" ]; then
		builtin cd "$@" && ls
	else
		builtin cd ~ && ls
	fi
}

## Git
gitpush() {
    git add .
    git commit -s -m "$*"
    git push
}
gitupdate() {
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/*.key
    ssh -T git@github.com
}
alias lazyg=gitpush
alias gu=gitupdate

## Git continue...
alias gs='git status'
alias gcl='git clone'
# alias gss='git status -s'
alias ga='git add'
alias gp='git push'
# alias gpraise='git blame'
# alias gpo='git push origin'
# alias gpt='git push --tag'
# alias gtd='git tag --delete'
# alias gtdr='git tag --delete origin'
# alias grb='git branch -r'                                                                           # display remote branch
# alias gplo='git pull origin'
# alias gb='git branch '
alias gc='git commit -s -m'
alias gd='git diff'
# alias gco='git checkout '
# alias gl='git log --pretty=oneline'
# alias gr='git remote'
# alias grs='git remote show'
# alias glol='git log --graph --abbrev-commit --oneline --decorate'
# alias gclean="git branch --merged | grep  -v '\\*\\|master\\|develop' | xargs -n 1 git branch -d" # Delete local branch merged with master
# alias gblog="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:red)%(refname:short)%(color:reset) - %(color:yellow)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:blue)%(committerdate:relative)%(color:reset))'"                                                             # git log for each branches
# alias gsub="git submodule update --remote"                                                        # pull submodules
# alias gj="git-jump"                                                                               # Open in vim quickfix list files of interest (git diff, merged...)
# alias gdif="git diff --no-index"                                                                   # Diff two files even if not in git repo! Can add -w (don't diff whitespaces)

## Nvim commands
alias nvimcomm='echo "\
Neovim Profile Commands
===========================
Esc - Normal mode, save, exit, navigate, etc.
v - visual mode, to select, copy, paste
i - insert mode, to edit and insert txt
SHIFT + . - to activate ":" command line
:q - quit vim, this fails when changes have been made
:q!- quit without writing
:qa! - quit and exit all without saving
:w - save without exiting
:wq - write the current file and exit.
:wq! - write the current file and exit always
CTRL + s - save file
CTRL + q - quite file and vim
Leader - is space " ", in combination with different keys, activate diffrent options
Leader + e - activate tree
h - move left
j - move down
k - move up
l - move right
- - move line upwards, on the first non-blank character
+ - move line downwards, on the first non-blank character
enter - move line downwards, on the first non-blank character
Up, Down, Left, Right - resize windows
CTRL + d - vertical down scroll
CTRL + u - vertical up scroll
H - move the cursor to the top of the screen
M - move the cursor to the middle of the screen
L - move the cursor to the bottom of the screen
w - jump by start of words (punctuation considered words)
W - jump by words (spaces separate words)
e - jump to end of words (punctuation considered words)
E - jump to end of words (no punctuation)
b - jump backward by words (punctuation considered words)
B - jump backward by words (no punctuation)
gg - jump to first line of the file
G - jump to last line of the file
0 - jump to beginning of line
$ - jum to end of line
10j - jump next 10 rows, can be any number
10k - jump back 10 rows, can be any number
d - delete line
x - delete first caracter
Leader + lw - line wraping
ALT + j - move text up
ALT + k - move text down
y - in visual mode, yank(copy) selected
yw - in visual mode, yank word
yy - in visual mode, yank (copy) a line
2yy - in visual mode, yank 2 lines
p - in visual mode, paste selected
> - in visual mode, to move forward selected
> - in visual mode to move backwards selected
Leader + v - split vertical
Leader + h - split horizontal
Leader + xs - close split
Leader + se - save dont close split
CTRL + h, j, k, l - navigate between splits
Leader + to - open new tab
Leader + tx - close tab
Leader + tn - next tab
Leader + tp - previus tab
Leader + x - close tab
==========================="'
