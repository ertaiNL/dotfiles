# .bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
elif [ -f /etc/bash.bashrc ]; then
  . /etc/bash.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  export PATH="$HOME/bin:$PATH"
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# FUNCTIONS
if [ -d ~/.bash_functions.d ];then
  for FUNCTION in ~/.bash_functions.d/*;do
    source ${FUNCTION}
  done
fi

# get colours
[ -f ~/.bash_colours ] && . ~/.bash_colours

PROMPT_COMMAND=prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors 2>/dev/null)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

# Set options
HOSTCONTROL=ignoredups:ignorespace	# no spaces or doubles
shopt -s histappend			# append to historyfile
HISTSIZE=10000
HISTFILESIZE=200000
shopt -s autocd 2>/dev/null		# cd into dir if it was typed without cd
shopt -s cdspell 2>/dev/null		# allow small typo's in cd
shopt -s dirspell 2>/dev/null		# dir means a ls
shopt -s checkjobs 2>/dev/null		# check for background jobs
shopt -u mailwarn 2>/dev/null		# ignore mails
unset MAILCHECK				# ignore mails

# Change the enviroment-variables
unset LS_COLORS                        # Ik gebruik een zwart scherm dus kleuren moeten licht
export HISTTIMEFORMAT="%F %H:%M:%S: "  # uitgebreide tekst bij history

# Add aliases
alias ll='ls -halF'		       # ll is a extended list, in KB,MB,GB
alias la='ls -a'		       # list all files
alias l='ls -lah'		       # yust lazy

alias top='top -d1'		      # refresh each second
alias df='df -TH'		      # print type and human readable
alias du='du -h'		      # human readable

alias hgrep='history|grep'	      # search in history
alias sus='sudo -sE'		      # sudo, but keep own enviroment
alias tailf='tail -fn 50'	      # display last 50 lines and follow
alias tail='tail -n 50'		      # display last 50 lines

alias ..='cd  ..'
alias ...='cd  ../..'
alias ....='cd ../../..'

alias top='xtitle Processes on $HOST && top' # set title for using top
alias make='xtitle Making $(basename $PWD) ; make' # set title for make

# Add an "alert" alias for long running commands (send to desktop).  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]        \s*alert$//'\'')"'

# setup my favorite editor
export EDITOR=/usr/bin/vim
export TERM=xterm-256color

display-stat
