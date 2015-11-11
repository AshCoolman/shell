#! /bin/bash

# Applications
alias subl="sublime"

code () {
    VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;
}

# Abstract applications
alias codeeditor="sublime"

# Edit bash
alias bashed="sublime ~/.bash_profile"