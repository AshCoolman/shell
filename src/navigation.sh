# ~/.bashrc

function mkcd {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}

alias catt="cat <<EOF > "


function loc {
    find . -name "*.${1}" | xargs wc -l
}

alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
# Find process by...name?
lsoff () { lsof -t -c "$@" ; }
# Find process by port
lsoftcp () { lsof -wni tcp:"$@" ; }

alias pwdd="pwd | tr -d '\n' | pbcopy"

# Ripped from https://gist.github.com/natelandau/10654137
# ------------------------------------------------------------
# alias cp='cp -iv'                           # Preferred 'cp' implementation
# alias mv='mv -iv'                           # Preferred 'mv' implementation
# alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation

 # LSCOLORS        The value of this variable describes what color to use for which attribute when colors are enabled with CLICOLOR.  This string is a concatenation of pairs of the format fb, where f is the foreground color and b is the background color.

 #                 The color designators are as follows:

 #                       a     black
 #                       b     red
 #                       c     green
 #                       d     brown
 #                       e     blue
 #                       f     magenta
 #                       g     cyan
 #                       h     light grey
 #                       A     bold black, usually shows up as dark grey
 #                       B     bold red
 #                       C     bold green
 #                       D     bold brown, usually shows up as yellow
 #                       E     bold blue
 #                       F     bold magenta
 #                       G     bold cyan
 #                       H     bold light grey; looks like bright white
 #                       x     default foreground or background

 #                 Note that the above are standard ANSI colors.  The actual display may differ depending on the color capabilities of the terminal in use.

 #                 The order of the attributes are as follows:

 #                       1.   directory
 #                       2.   symbolic link
 #                       3.   socket
 #                       4.   pipe
 #                       5.   executable
 #                       6.   block special
 #                       7.   character special
 #                       8.   executable with setuid bit set
 #                       9.   executable with setgid bit set
 #                       10.  directory writable to others, with sticky bit
 #                       11.  directory writable to others, without sticky bit

 #                 The default is "exfxcxdxbxegedabagacad", i.e. blue foreground and default background for regular directories, black foreground and red background for setuid executables, etc.

export LSCOLORS="agag"
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
# alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
# alias edit='subl'                           # edit:         Opens any file in sublime editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
# alias which='type -all'                     # which:        Find executables
# alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
# alias show_options='shopt'                  # Show_options: display bash options settings
# alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
# alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
# trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
# ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
# alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop



#   ---------------------------
#   6.  NETWORKING
#   ---------------------------
#   
alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs


#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
ii() {
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Current network location :$NC " ; scselect
    echo -e "\n${RED}Public facing IP Address :$NC " ;myip
    #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
    echo
}
