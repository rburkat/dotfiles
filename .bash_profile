#enables color in the terminal bash shell export

#sets up the prompt color (currently a green similar to linux terminal)
export PS1='${debian_chroot:+($debian_chroot)}\[\e[33;1m\]\u\[\e[0m\]\[\e[31;1m\]@\[\e[35;1m\]\h\[\e[0m\]:\[\033[01;36m\]\w\[\033[00m\]# '
#enables color for iTerm
export TERM=xterm-color
#sets up proper alias commands when called




case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


export LSCOLORS=ExFxCxDxBxegedabagacad

alias ll='ls -l'
alias ls='ls -G'
alias l='ls $LS_OPTIONS -lA'
alias cdva='cd ~/dev/va/pbwos2-va'
alias cdc='cd ~'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

export EC2_HOME=~/ec2
export PATH=$PATH:$EC2_HOME/bin;
export PATH="/usr/local/bin:$PATH"




