# ~/.bashrc
bower () {
    if [[ $1 == ln ]]; then
        set -- link "${@:2}"
        echo "replacing $FUNCNAME $@"
    fi
    command "$FUNCNAME" "$@"
}