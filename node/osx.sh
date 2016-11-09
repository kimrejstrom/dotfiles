#!/bin/bash

    # Check for npm
    which -s npm
    if [[ $? != 0 ]] ; then

        printf "Aborting (no npm found)...\n"
        exit

    else
       printf "Installing Node.js packages..."

        # Install packages globally and quietly
        npm install bower eclint editorconfig-tools eslint gify grunt-cli gulp ngrok yo --global --quiet

        printf "Done"
    fi
