#! /bin/bash
# http://stackoverflow.com/questions/25329241/edit-package-json-from-commandline

newnpm () {
    # Initial steps
    
    mkdir "$1"
    cd "$1"
    mkdir -p src
    mkdir -p test
    echo "'use strict';" > src/index.js
    echo "'use strict';" > test/index.js
    echo "node_modules/" > .gitignore

    npm init --force
    json -I -f package.json -e 'this.main="./src/index.js"'
    json -I -f package.json -e 'this.version="0.0.0"'
    json -I -f package.json -e 'this.scripts.start="node ./src/index.js"'
    json -I -f package.json -e 'this.scripts.test="nodemon ./test/index.js --watch ./src"'
    json -I -f package.json -e 'this.scripts.bugs={"url": "https://github.com/ashcoolman/$1/issues"}'
    json -I -f package.json -e 'this.dependencies={}'

    # Condition: babel
    if [[ $2 == *"b"* ]]
    then 
        echo "** USING BABEL **"

        echo "require('babel/register');" > src/index.js
        echo "require('babel/register');" > test/index.js

        json -I -f package.json -e 'this.babelrc={}'
        json -I -f package.json -e 'this.babelrc.plugins=["es2015"]'
        json -I -f package.json -e 'this.scripts.start="babel-node ./src/index.js"'
        json -I -f package.json -e 'this.scripts.test="babel-node ./test/index.js"'

        echo "Installing babel, please wait..."

        npm i babel-core --save
        npm i babel-preset-es2015 --save-dev
    fi

    # Condition: coffee
    if [[ $2 == *"c"* ]]
    then 
        echo "** USING COFFEE-SCRIPT **"

        echo "require('coffee-script/register');" >> src/index.js
        echo "require(__dirname+'/app');" >> src/index.js
        echo "console.log 'Generated successfully'" > src/app.coffee
        echo "require('coffee-script/register');" >> test/index.js

        json -I -f package.json -e 'this.scripts["coffee-watch"]="mkdir -p dist && coffee --watch --compile --output ./dist ./src"'
        json -I -f package.json -e 'this.scripts.coffee="mkdir -p dist && coffee --compile --output ./dist ./src"'

        echo "Installing coffee-script, please wait..."

        npm i coffee-script --save-dev
    fi

    # Last steps
    cd "$1"
    echo "var module = require('../src/index');" >> test/index.js

    git init
    codeeditor .
    cd $1
    npm test
}