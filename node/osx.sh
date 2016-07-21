#!/bin/bash

    # Check for npm
    which -s npm
    if [[ $? != 0 ]] ; then

        printf "Aborting (no npm found)...\n"
        exit

    else
       printf "Installing Node.js packages..."

        # Install packages globally and quietly
        npm install bower cordova eclint editorconfig-tools eslint gify grunt-cli gulp ionic ios-deploy ios-sim js-beautify jshint ngrok yo --global --quiet

        printf "Done"
    fi
