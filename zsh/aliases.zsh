# --- ALIASES --------------------------
alias refresh='source ~/.zshrc; echo "Reloaded .zshrc."'
alias artisan='php artisan'
alias oo='open .'

# Vagrant
alias vup="vagrant up"
alias vsus="vagrant suspend"
alias vhalt="vagrant halt"
alias vkill="vagrant destroy"
alias vssh="vagrant ssh"

# ---- FANCY DOTFILES-IMPORTED ALIASES ----------------

# Gzip-enabled `curl`
alias gurl='curl --compressed'

# Get week number
alias week='date +%V'

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install -g npm@latest; npm update -g; sudo gem update'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
alias plistbuddy="/usr/libexec/PlistBuddy"

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

# Redo as sudo
alias fuck='sudo $(fc -ln -1)'

# ----------------- FUNCTIONS ------------------- #
# toggle iTerm Dock icon
# add this to your .bash_profile or .zshrc
function toggleiTerm() {
	pb='/usr/libexec/PlistBuddy'
	iTerm='/Applications/iTerm.app/Contents/Info.plist'
	
	echo "Do you wish to hide iTerm in Dock?"
	select ync in "Hide" "Show" "Cancel"; do
	    case $ync in
	        'Hide' )
	        	$pb -c "Add :LSUIElement bool true" $iTerm
	        	echo "relaunch iTerm to take effectives"
	        	break
	        	;;
	        'Show' )
	        	$pb -c "Delete :LSUIElement" $iTerm
	        	echo "run killall 'iTerm' to exit, and then relaunch it"
	        	break
	        	;;
		'Cancel' )
			break
			;;
	    esac
	done
}
