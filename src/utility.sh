# ~/.bashrc

# Source:
#    http://stackoverflow.com/questions/14366390/bash-if-condition-check-if-element-is-present-in-array
#
# Usage:
#   arr=(a b c "d e" f g)
#   array_contains2 arr "a b"
#
array_contains () {
    local array="$1[@]"
    local seeking=$2
    local in=1
    for element in "${!array}"; do
        if [[ $element == $seeking ]]; then
            in=0
            break
        fi
    done
    return $in
}


# Source:
#   http://www.kfirlavi.com/blog/2012/11/14/defensive-bash-programming
#
is_empty() {
    local var=$1
    [[ -z $var ]]
}

is_not_empty() {
    local var=$1
    [[ -n $var ]]
}

is_file() {
    local file=$1
    [[ -f $file ]]
}

is_dir() {
    local dir=$1
    [[ -d $dir ]]
}
