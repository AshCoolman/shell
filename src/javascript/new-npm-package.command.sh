#! /bin/bash
# http://stackoverflow.com/questions/25329241/edit-package-json-from-commandline

newnpm () {
    # Initial steps
    echo $(
mkdir "$1"
cd "$1"
mkdir -p src
cat <<EOF > src/index.js
'use strict'
EOF

mkdir -p test
cat <<EOF >test/index.js
EOF

cat <<EOF >.gitignore
node_modules/
EOF

npm init --force
json -I -f package.json -e 'this.main="./src/index.js"'
json -I -f package.json -e 'this.version="0.0.0"'
json -I -f package.json -e 'this.scripts.start="node ./src/index.js"'
json -I -f package.json -e 'this.scripts.test="nodemon ./test/index.js --watch ./src"'
json -I -f package.json -e 'this.scripts.bugs={"url": "https://github.com/ashcoolman/$1/issues"}'
)

#     # Condition: babel
#     if [[ $1 == *"b"* ]]
#     then 
#         echo $(
# cat <<EOF >> src/index.js
# require('babel/register');
# EOF

# cat <<EOF >> test/index.js
# require('babel/register');
# EOF


# json -I -f package.json -e 'this.babelrc.plugins=["es2015"]'
# json -I -f package.json -e 'this.scripts.start="babel-node ./src/index.js"'
# json -I -f package.json -e 'this.scripts.test="babel-node ./test/index.js"'

# npm i babel-core --save
# npm i babel-preset-es2015 --save-dev
# )

#     # Condition: coffee
#     if [[ $1 == *"c"* ]]
#     then 
#         echo $(
# cat <<EOF >> src/index.js
# require('coffee/register');
# EOF

# cat <<EOF >> test/index.js
# require('coffee/register');
# EOF

# json -I -f package.json -e 'this.scripts.build="mkdir -p dist && coffee -c --output ./dist ./src"'
# json -I -f package.json -e 'this.scripts.start="npm run-script build"'

# npm i coffee-script --save-dev
# )


    # Last steps
    echo $(
cd "$1"
cat <<EOF >> src/index.js
console.log('Generated successfully');
EOF

cat <<EOF >> test/index.js
var module = require('../src/index');
EOF


git init

codeeditor .
)
    cd $1
    npm test
}