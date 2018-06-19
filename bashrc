## By default, create files/folder as 640/750 (rw-r-----/rwxr-x---)
umask 027;

## Autostart TMUX in every terminal
if test -z ${TMUX+x}; then
  tmux && exit;
fi


# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace;

# append to the history file, don't overwrite it
shopt -s histappend;

## For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#  negative -> infinite history
HISTSIZE=-1;
HISTFILESIZE=-1;

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize;

# make less more friendly for non-text input files, see lesspipe(1)
test -x /usr/bin/lesspipe && eval "$(SHELL=/bin/sh lesspipe)";

if test -n "${force_color_prompt}"; then
  if test -x /usr/bin/tput && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	  color_prompt=yes;
  else
	  color_prompt=;
  fi
fi

## Anonymous prompt when recording an asciicast
if test ! -z ${ASCIINEMA_REC:+x}; then
  PS1='\[\e[1;31m\]user\[\e[m\]\[\e[1;34m\]@machine:\[\e[m\]\[\e[m\]~\[\e[m\]\[\e[1;32m\]\n\$\[\e[m\] ';
else
  PS1='\[\e[1;31m\]\D{%T} \u\[\e[m\]\[\e[1;34m\]@\h:\[\e[m\]\[\e[m\]\w\[\e[m\]\[\e[1;32m\]\n\$\[\e[m\] ';
fi

## Colored 'ls' output by default
if test -x /usr/bin/dircolors; then
  eval "$(dircolors -b)";
else
  export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:ow=1:or=31:mi=0:ex=94:*.rpm=90';
fi
alias ls='ls --color=auto --quoting-style=literal';

if test -f ~/.bash_aliases; then
  . ~/.bash_aliases;
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if test -f /etc/bash_completion; then
  . /etc/bash_completion;
fi

## Test if shell is interactive
case $- in
  *i*) 
    ## Up/down autocompletes from history
    bind '"\e[A": history-search-backward';
    bind '"\e[B": history-search-forward';
    ## Disable software flow control via Ctrl-S/-Q
    stty -ixon;
    ;;
esac

# some more ls aliases
alias ll='ls -alFh';
alias l='ls -CBF';
