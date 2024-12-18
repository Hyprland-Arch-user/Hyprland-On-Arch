#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"

export EDITOR=nano

# Run Pywal and hide all output
(cat ~/.cache/wal/sequences &)

#uncomment to say welcome back and you name
#echo "Welcome back, $(whoami)!"

export PATH=$HOME/.local/bin:$PATH

