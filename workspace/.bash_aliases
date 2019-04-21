alias fk='ssh -p xxx root@119'
alias sjhd='ssh  root@110'
alias egrep='egrep --color'
alias fgrep='fgrep --color'
alias vi='vim'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias glg='git lg'
alias mysqlstart='/usr/local/Cellar/mysql/5.7.20/bin/mysql.server start'
alias mysqlstop='/usr/local/Cellar/mysql/5.7.20/bin/mysql.server stop'
alias mysqlrestart='/usr/local/Cellar/mysql/5.7.20/bin/mysql.server restart'
alias wl='ll | wc -l'
alias lh='ls -lah'
alias c='clear'  # 快速清屏
alias p='pwd'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias python3='/usr/local/Cellar/python/3.7.1/bin/python3'
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
# 自动在文件末尾加上 .bak-日期 来备份文件，如 bak nginx.conf
bak() { cp -rp "$@" "$@.bak"-`date +%Y%m%d`; echo "`date +%Y-%m-%d` backed up $PWD/$@"; }
# 去掉文件末尾所加上的.bak*的内容，如nbak nginx.conf.bak.2099xxx
nbak() { local tmp="$@"; echo ${tmp%.bak*} | xargs -t -I _ mv $tmp _;}
# mv 文件
mov() { mv "$@"{,.bak-`date +%Y%m%d`}; echo "`date +%Y-%m-%d` moved at $PWD/$@"; }
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

# A bash function to display a growl notification using iTerm's magic
# escape sequence. This version will work under screen.
growl() {
      local msg="\\e]9;\n\n${*}\\007"
      case $TERM in
        screen*)
          echo -ne '\eP'${msg}'\e\\' ;;
        *)
          echo -ne ${msg} ;;
      esac
      return
}

#use hsdb
alias jhsdb='java -classpath  /Library/Java/JavaVirtualMachines/jdk1.8.0_172.jdk/Contents/Home/lib/sa-jdi.jar sun.jvm.hotspot.HSDB'

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

export RABBITMQ_HOME=/usr/local/Cellar/rabbitmq/3.7.7_1
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_172.jdk/Contents/Home
PATH=$JAVA_HOME/bin:$PATH:$RABBITMQ_HOME/sbin:.
CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar:.
export JAVA_HOME
export PATH
export CLASSPATH
