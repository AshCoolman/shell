# ~/.bashrc
function lg() {
  echo "$(date +"%Y-%d-%m %T"): $@" >> ~/my-log.txt
}

function lgout() {
  tail -n $1 ~/my-log.txt
}