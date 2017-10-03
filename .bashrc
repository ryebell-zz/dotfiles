# standard

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


####################################################
## External Sources ################################
####################################################

# git prompt for console prompt
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi

# aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi
####################################################
## Global Variables ################################
####################################################

# set vim as editor
export EDITOR=/usr/bin/vim

# date variables
export now=$(date +"%m_%d_%Y");
export week_of_year=$(date +%W);
export year=$(date +%Y);

# scripts dir
if [ -d $HOME/scripts ]; then
  export SCRIPTS_DIR=$HOME/scripts;
fi

####################################################
## Other ###########################################
####################################################

export PS1="\[\e[00;37m\][\[\e[0m\]\[\e[01;37m\]\u\[\e[0m\]\[\e[00;37m\]@\[\e[0m\]\[\e[01;37m\]\h\[\e[0m\]\[\e[00;37m\] - \[\e[0m\]\[\e[01;31m\]\t\[\e[0m\]\[\e[00;37m\]] \[\e[0m\]\[\e[01;37m\]\W\[\e[0m\]\[\e[00;37m\] \\$\[\e[0m\] "
# messages
echo "Security news:";
echo "$(dig +short -t txt istheinternetonfire.com)";
echo "--------------";
$SCRIPTS_DIR/dash_init.php
