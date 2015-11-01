# ~/.bashrc
function gh(){
  cd ~/github/$1
}

function yy(){
  cd ~/yieldify/$1
}

function cxm(){
  cd ~/yieldify/cxm/$1
}

alias memcachestart="launchctl load /usr/local/opt/postgresql/homebrew.mxcl.postgresql.plist"