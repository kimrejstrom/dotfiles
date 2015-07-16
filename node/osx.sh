#!/bin/bash

    # Check for npm
    if test ! $(which npm)
	then
        e_header "Installing Node.js packages..."

        # List of npm packages
        local packages="bower csslint grunt-cli gulp gify jshint yo"

        # Install packages globally and quietly
        npm install $packages --global --quiet

        [[ $? ]] && e_success "Done"
    else
        printf "\n"
        e_error "Error: npm not found."
        printf "Aborting...\n"
        exit
    fi
