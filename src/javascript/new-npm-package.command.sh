#! /bin/bash
# http://stackoverflow.com/questions/25329241/edit-package-json-from-commandline

newnpm () {
    echo $(
mkdir src -p

cat <<EOF >src/index.js
require('coffee-script/register');
require('babel/register');
require('app');
EOF

cat <<EOF >src/app.coffee
console.log 'My body is ready'
EOF

mkdir test -p

cat <<EOF >src/test.js
require('coffee-script/register');
require('babel/register');
require('../src/app');
EOF

npm init --force

json -I -f package.json -e 'this.scripts.test="node ./src/index.js"'

git init

git add -A

git commit -m "Initial commit"
}