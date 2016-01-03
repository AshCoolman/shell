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

function dbstart(){
    export DOCKER_TLS_VERIFY=
    export DOCKER_HOST=tcp://192.168.59.103:2376
    export DOCKER_CERT_PATH=/Users/ashleycoleman/.boot2docker/certs/boot2docker-vm
}
