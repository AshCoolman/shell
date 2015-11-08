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