git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.shuk 'stash -u -k' # stash only untracked files
git config --global alias.last 'log -1 HEAD'

gitinit () {

    echo "# New project" >> README.md
    git init
    git add README.md
    echo ".DS_Store
npm-debug.log
dist/
doc/
node_modules/
bower_components/
jspm_packages/
*.sublime-*
*.nogit.*
**/*.nogit.*" >> .gitignore
}