#! /bin/bash

# Applications
alias subl="sublime"
alias stree='open -a SourceTree'

code () {
    VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;
}

# Abstract applications
alias codeeditor="sublime"

# Edit bash files
alias bashed="sublime ~/.bash_profile"
alias bashit=". ~/.bash_profile"

alias profed="sublime ~/.profile"
alias profit=". ~/.profile"

alias barced="sublime ~/.bashrc"
alias barcit=". ~/.bashrc"