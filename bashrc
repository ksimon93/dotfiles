# .bashrc
# User specific aliases and functions
if [ -f ~/.bash_aliases ]; then
      . ~/.bash_aliases
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
# Source Facebook definitions
if [ -f /mnt/vol/engshare/admin/scripts/master.bashrc ]; then
        . /mnt/vol/engshare/admin/scripts/master.bashrc
fi

# Make vim the default editor
export EDITOR=vim
export VISUAL=vim

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source $ADMIN_SCRIPTS/scm-prompt

PS1="[\$(_dotfiles_scm_info)|\u@\h \W] "
HISTSIZE=130000 HISTFILESIZE=-1
