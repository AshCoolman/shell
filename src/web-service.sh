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

alias gitio="curl -i https://git.io -F \"url=$1\"  -s   -F \"code=t\" | grep Location:"
https://github.com/AshCoolman/docs

# foo.job
type=command
command=echo "curl -i https://git.io -F"

# https://news.ycombinator.com/item?id=13065670
#    $ jq --version
#    jq-1.5
#    $ function acp() { curl -sS "https://www.google.com/complete/search?client=hp&hl=en&xhr=t&q=$1" | jq -r '.[1] | .[][0] | sub("</?b>"; ""; "gi")'; }
#    $ acp dropkick
#    dropkick murphys
#    dropkick
#    dropkick murphys songs
#    dropkick murphys tour
#    dropkick murphys lyrics
#    dropkick murphys tessie
#    dropkick murphys setlist
#    dropkick murphys albums
#    dropkick murphys new album
#    dropkick murphys tickets

# curl -sS 'https://www.google.com/complete/search?client=hp&hl=en&xhr=t&q=aurora' | jq -r '.[1] | .[][0] | sub("</?b>"; ""; "gi")'

function acp() { curl -sS "https://www.google.com/complete/search?client=hp&hl=en&xhr=t&q=$1" | jq -r '.[1] | .[][0] | sub("</?b>"; ""; "gi")'; }
