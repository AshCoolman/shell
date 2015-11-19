# ~/.bashrc
function lg() {
  echo $(date +"%Y-%d-%m %T"): $USER$ $@ >> ~/my-log.txt
}

function lgl() {
  echo "log list not implemented"
}

function lgout() {
  tail -n ${1-10} ~/my-log.txt
}