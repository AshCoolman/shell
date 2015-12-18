# ~/.bashrc
function jsoned {
  echo $(json -I -f ${1} -e "${2}")
}
