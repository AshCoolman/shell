#! /bin/bash

alias docker="docker --tls"

docker-ip() {
    boot2docker ip 2> /dev/null
}

alias dm="docker-machine"
function dockerinit() {
    bash --login '/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'
    eval $(docker-machine env default)

}