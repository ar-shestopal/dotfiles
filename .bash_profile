
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export JAVA_HOME=$(/usr/libexec/java_home)
export TIGASE_HOME="/usr/local/tigase"
export RSENSE_HOME="$HOME/opt/rsense-0.3"
export WMS_HOME="/Library/WowzaStreamingEngine"
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
##

# Your previous /Users/zibaluski/.bash_profile file was backed up as /Users/zibaluski/.bash_profile.macports-saved_2014-02-28_at_22:24:07
##

# MacPorts Installer addition on 2014-02-28_at_22:24:07: adding an appropriate PATH variable for use with MacPorts.
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "


# Start the emacs daemon if not already running.
export EDITOR="mvim -v"


alias vim="mvim -v"

alias em="emacsclient -c"
alias emk="emacsclient -e '(kill-emacs)'"
alias ems="emacs --daemon"
