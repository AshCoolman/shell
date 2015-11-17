#! /bin/bash
# http://stackoverflow.com/questions/25329241/edit-package-json-from-commandline
echo "yes"
newnpm () {
    # Initial steps
    
    mkdir "$1"
    cd "$1"
    mkdir -p dist
    mkdir -p src
    mkdir -p test
    mkdir -p sh
    echo "" > src/index.js
    echo "" > test/index.js
    echo "node_modules/" > .gitignore
    npm init --force
    json -I -f package.json -e 'this.main="./src/index.js"'
    json -I -f package.json -e 'this.version="0.0.0"'
    json -I -f package.json -e 'this.scripts.start="node ./src/index.js"'
    json -I -f package.json -e 'this.scripts.copy="sh ./sh/copy-to-dist.sh"'
    json -I -f package.json -e 'this.scripts.test="nodemon ./test/index.js --watch ./src"'
    json -I -f package.json -e 'this.scripts.bugs={"url": "https://github.com/ashcoolman/'${1}'/issues"}'
    json -I -f package.json -e 'this.dependencies={}'

    # Condition: babel
    if [[ $2 == *"b"* ]]
    then 
        printf "${COLOR_YELLOW}** USING BABEL **${COLOR_NC}\n"
        echo "require('babel/register');" > src/index.js
        echo "require('babel/register');" > test/index.js
        json -I -f package.json -e 'this.babelrc={}'
        json -I -f package.json -e 'this.babelrc.plugins=["es2015"]'
        json -I -f package.json -e 'this.scripts.start="babel-node ./src/index.js"'
        json -I -f package.json -e 'this.scripts.test="babel-node ./test/index.js"'
        npm i babel-core --save
        npm i babel-preset-es2015 --save-dev
    fi

    # Condition: coffee
    if [[ $2 == *"c"* ]]
    then 
        printf "${COLOR_BROWN}** USING COFFEE-SCRIPT **${COLOR_NC}\n"
        echo "require('coffee-script/register');" >> src/index.js
        echo "require(__dirname+'/app');" >> src/index.js
        echo "console.log 'Generated successfully'" > src/app.coffee
        echo "require('coffee-script/register');" >> test/index.js
        json -I -f package.json -e 'this.scripts["coffee-watch"]="mkdir -p dist && coffee --watch --compile --output ./dist ./src"'
        json -I -f package.json -e 'this.scripts.coffee="mkdir -p dist && coffee --compile --output ./dist ./src"'
        npm i coffee-script --save-dev
    fi

    # Condition: typescript
    if [[ $2 == *"t"* ]]
    then 
        printf "${COLOR_LIGHT_BLUE}** USING TYPESCRIPT ** ${COLOR_NC}\n"
        echo "src/**/*.js" >> .gitignore
        echo "src/**/*.js.map" >> .gitignore
        json -I -f package.json -e 'this.scripts.tsc="tsc -p src -w"'
        npm i typescript --save-dev
        cat > tsconfig.json << EOF
{
  "compilerOptions": {
    "target": "ES5",
    "module": "commonjs",
    "sourceMap": true,
    "emitDecoratorMetadata": true,
    "experimentalDecorators": true,
    "removeComments": false,
    "noImplicitAny": true
  },
  "exclude": [
    "node_modules",
    "test/e2e/pageObjects"
  ]
}
EOF
    fi

    # Last steps
    npm i onchange --save-dev
    echo "#! /bin/bash" > sh/copy-to-dist.sh
    echo "cpy 'src/**/*.html' 'src/**/*.css' dev/src" >> sh/copy-to-dist.sh
    json -I -f package.json -e 'this.scripts.watch="onchange \"src/**/*.{js,ts,coffee,styl,jade,html}\" -- npm run copy"'
    npm i live-server --save-dev
    json -I -f package.json -e 'this.scripts.start="live-server --open=src && "+this.scripts.start'
    echo "var module = require('../src/index');" >> test/index.js

    # # Last steps : typescript
    if [[ $2 == *"t"* ]]
    then 
        mv "src/index.js" "src/index.ts"
        mv "test/index.js" "test/index.ts"
        echo "" > src/index.ts
        echo "" > test/index.ts
    fi

    cd ..
    # git init
    # codeeditor $1
    # npm test
}