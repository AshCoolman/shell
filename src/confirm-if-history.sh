# ~/.bashrc
# To avoid accidents, if these commands are invoked from history they require confirmation
# 
# http://stackoverflow.com/questions/33402687/when-using-the-terminal-history-can-i-force-confirmation-when-executing-dangero
echo "commit if history"

rm () {
    echo "wrapped"
    local regex='[Yy]'
    if history |  sed '$d' | pcregrep -q "^\s+\d+\s+${FUNCNAME} $*"; then
        read -p 'Are you sure? '
        [[ "$REPLY" =~ $regex ]] || return 1
    fi
    command "$FUNCNAME" "$@"
}

git () {
    local regex='[Yy]'
    UNSAFE=("push" "pop" "stash" "commit" "add")
    if [[ " ${UNSAFE[*]} " != *" $1 "* ]]; then
        echo "safe $1"
    elif history |  sed '$d' | pcregrep -q "^\s+\d+\s+${FUNCNAME} $*"; then
        read -p 'Are you sure? '
        [[ "$REPLY" =~ $regex ]] || return 1
    fi
    command "$FUNCNAME" "$@"
}