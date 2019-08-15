# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/anzhihe/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# 左侧显示
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable vcs) 

# 右側显示
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)

# icon
POWERLEVEL9K_MODE='nerdfont-complete'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
export FZF_BASE="$HOME/.fzf"

plugins=(
	git
    autojump
    fzf
    pyenv
	zsh-autosuggestions
    zsh-syntax-highlighting
)


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export GOPATH="/Users/anzhihe/golang"
export GOROOT="/usr/local/Cellar/go/1.12.7/libexec"
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

#[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

#if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
#export PYENV_ROOT=/usr/local/var/pyenv

# iterm2背景设置
# 配置方法：Preferences -> Profiles -> Window -> Background Image 选择一个你喜欢的背景，然后通过Blending调整图片背景的透明度。
# Zsh use powerlevel9k/powerlevel9k: https://medium.com/statementdog-engineering/prettify-your-zsh-command-line-prompt-3ca2acc967f

# Use Ctrl -z back to Vim
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

alias che='ssh anzhihe@xxxxx'
alias egrep='egrep --color'
alias fgrep='fgrep --color'
alias vi='vim'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias mysqlstart='/usr/local/Cellar/mysql/5.7.20/bin/mysql.server start'
alias mysqlstop='/usr/local/Cellar/mysql/5.7.20/bin/mysql.server stop'
alias mysqlrestart='/usr/local/Cellar/mysql/5.7.20/bin/mysql.server restart'
alias wl='ll | wc -l'
alias lh='ls -lah'
alias c='clear'  # 快速清屏
alias p='pwd'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias python3='/usr/local/Cellar/python/3.7.3/bin/python3'
# 进入目录并列出文件，如 cdl ../conf.d/
cdl() { cd "$@" && pwd ; ls -alF; }
alias ..="cdl .."
alias ...="cd ../.."   # 快速进入上上层目录
alias .3="cd ../../.."
alias cd..='cdl ..'
# alias cp="cp -iv"      # interactive, verbose
# alias mv="mv -iv"       # interactive, verbose
alias psg='ps aux | grep -v grep | grep --color' # 查看进程信息
alias hg='history|grep'
alias netp='netstat -tulanp'  # 查看服务器端口连接信息
alias lvim="vim -c \"normal '0\""  # 编辑vim最近打开的文件
alias tf='tail -f '  # 快速查看文件末尾输出
alias mtr=/usr/local/sbin/mtr
# 自动在文件末尾加上 .bak-日期 来备份文件，如 bu nginx.conf
bak() { cp -rp "$@" "$@.bak"-`date +%Y%m%d`; echo "`date +%Y-%m-%d` backed up $PWD/$@"; }
# 级联创建目录并进入，如 mcd a/b/c
mcd() { mkdir -p $1 && cd $1 && pwd ; }
# 查看去掉#注释和空行的配置文件，如 nocomm /etc/squid/squid.conf
alias nocomm='grep -Ev '\''^(#|$)'\'''
# 快速根据进程号pid杀死进程，如 psid tomcat， 然后 kill9 两个tab键提示要kill的进程号
alias kill9='kill -9';
psid() {
  [[ ! -n ${1} ]] && return;   # bail if no argument
  pro="[${1:0:1}]${1:1}";      # process-name –> [p]rocess-name (makes grep better)
  ps axo pid,user,command | grep -v grep |grep -i --color ${pro};   # show matching processes
  pids="$(ps axo pid,user,command | grep -v grep | grep -i ${pro} | awk '{print $1}')";   # get pids
  complete -W "${pids}" kill9     # make a completion list for kk
}
# 解压所有归档文件工具
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.tar.xz)    tar xvJf $1    ;;
          *.lzma)      unlzma $1      ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       unrar x -ad $1 ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *.xz)        unxz $1        ;;
          *.exe)       cabextract $1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}


file-to-clipboard() {
    /usr/bin/osascript \
        -e 'on run args' \
        -e 'set the clipboard to POSIX file (first item of args)' \
        -e end \
        "$@"
}

fc(){
   file-to-clipboard `echo $PWD/$1`
}

function fpath() {
    echo $PWD/$1 | pbcopy
}

openf() {
   open -a Finder ./
}

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh


# Setup fzf Searching tool {
    # Import binary execution to PATH
   # if [[ ! "$PATH" == *~/.fzf/bin* ]]; then export PATH="$PATH:$HOME/.fzf/bin"; fi
    # Import key bindings for auto completion
   # [[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null
    # Import specific key bindings
  #  source "$HOME/.fzf/shell/key-bindings.zsh"
    export FZF_DEFAULT_OPTS='--height 50% --reverse --border'
# }

#alias fzf="~/.fzf/bin/fzf"
#alias vfzf="vim $(fzf)"
vf(){
    vim $(fzf)
}

#alias dfzf='cd $(find * -type d | fzf)'
dfzf(){
    cd $(find "$1" -type d | fzf)
}

cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

fzfp() {
fzf --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (rougify {}  || highlight -O ansi -l {} || coderay {} || cat {}) 2> /dev/null | head -500'
}

fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}
