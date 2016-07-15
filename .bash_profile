[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
export PS1='$ \w $(__git_ps1 "(%s)")\$ '
export EDITOR="mvim -v"
alias vim="mvim -v"

alias tmuxjob=~/dotfiles/tmux_run.sh
