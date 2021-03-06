source ~/.bash_prompt



# https://github.com/huyng/bashmarks
source ~/.local/bin/bashmarks.sh

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && source "$file"
done
unset file

# nvm

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#   -------------------------------------------------------------------
    alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
    alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

alias ls="ls -G"
cd() { builtin cd "$@"; ls; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias f='open -a Finder ./'                 # f: Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~: o Home

# https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias dotfiles='/usr/local/bin/git --git-dir=/Users/jchung/.cfg/ --work-tree=/Users/jchung'

#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#   ---------------------------
#   6. NETWORKING
#   ---------------------------

alias myip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'                " # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs

#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
    ii() {
        echo -e "\nYou are logged on ${RED}$HOST"
        echo -e "\nAdditionnal information:$NC " ; uname -a
        echo -e "\n${RED}Users logged on:$NC " ; w -h
        echo -e "\n${RED}Current date :$NC " ; date
        echo -e "\n${RED}Machine stats :$NC " ; uptime
        echo -e "\n${RED}Current network location :$NC " ; scselect
        echo -e "\n${RED}Public facing IP Address :$NC " ;myip
        #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
        echo
    }


# Git Aliases
createBranch(){
	git checkout -b $1 origin/master;
}

function gmb {
  curr_branch_name=$(git branch | grep \* | cut -c 3-);
  if [ -z $(git branch | cut -c 3- | grep -x $1) ]; then
    git branch -m $curr_branch_name $1
  else
    temp_branch_name=$1-old-$RANDOM;
    echo target branch name already exists, renaming to $temp_branch_name
    git branch -m $1 $temp_branch_name
    git branch -m $curr_branch_name $1
  fi
}

alias gs='git status'
alias gb='git branch'
alias gcm='git commit -am'
alias gco=createBranch

# Git Autocomplete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# store config and dot files
alias config='/usr/bin/git --git-dir=/Users/jchung/.cfg/ --work-tree=/Users/jchung'
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Trello Testing Vars
# export MAILINATOR_TOKEN="44aefebe6937472388b8ded2b63a870d"
