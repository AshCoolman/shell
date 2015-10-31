#! /bin/bash
newnpm () {
    echo $(
mkdir src

cat <<EOF >src/index.js
require('coffee-script/register');
require('babel/register');
require('app');
EOF

cat <<EOF >src/app.coffee
console.log 'My body is ready'
EOF
)
}