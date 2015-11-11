#! /bin/bash
# http://stackoverflow.com/questions/25329241/edit-package-json-from-commandline

newnpm () {
    echo $(
mkdir -p src

cat <<EOF >src/index.js
require('coffee-script/register');
require('babel/register');
require('app');
EOF

cat <<EOF >src/app.coffee
console.log 'My body is ready'
EOF

mkdir -p test

cat <<EOF >test/index.js
require('coffee-script/register');
require('babel/register');
require('../src/app');
EOF


cat <<EOF >.gitignore
node_modules/
bower_components/
EOF



cat <<EOF >.babelrc
{
    "plugins": ["es2015"]
}
EOF

npm init --force

npm i babel-core coffee-script --save
npm i babel-preset-es2015 --save-dev

json -I -f package.json -e 'this.main="./src/index.js"'
json -I -f package.json -e 'this.version="0.0.0"'
json -I -f package.json -e 'this.scripts.test="node ./test/index.js"'
json -I -f package.json -e 'this.scripts.test="node ./src/index.js"'

git init

codeeditor .
)
}