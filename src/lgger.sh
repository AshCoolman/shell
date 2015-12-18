# ~/.bashrc
# Log
function lg() {
  echo $(date +"%Y-%d-%m %T"): $USER$ $@ >> ~/lgger.txt
}

# Log bullet level 1
function lgb() {
  echo $(date +"%Y-%d-%m %T"): $USER$ * $@ >> ~/lgger.txt
}

# Log bullet level 2
function lgbb() {
  echo $(date +"%Y-%d-%m %T"): $USER$   * $@ >> ~/lgger.txt
}

# Log bullet level 3
function lgbbb() {
  echo $(date +"%Y-%d-%m %T"): $USER$     * $@ >> ~/lgger.txt
}


# Log list item (auto increment number)
function lgl() {
  last=$(tail -n 1 ~/lgger.txt)
  msg=$(cut -d "$" -f 2 <<< $last)
  beforedot=$(cut -f1 -d"." <<< $msg)
  re='^[0-9]+$'
  if ! [[ $beforedot =~ $re ]] ; then
    echo $(date +"%Y-%d-%m %T"): $USER$ 1. $@ >> ~/lgger.txt
  else
    num=`expr $beforedot + 1`
    echo $(date +"%Y-%d-%m %T"): $USER$ $num. $@ >> ~/lgger.txt
  fi
}

# output log
function lgo() {
  tail -n ${1-10} ~/lgger.txt
}