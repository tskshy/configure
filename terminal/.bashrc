# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
# export LS_OPTIONS='--color=auto'
# eval "`dircolors`"
# alias ls='ls $LS_OPTIONS'
# alias ll='ls $LS_OPTIONS -l'
# alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
if [ -n "$WINDOWID" ]; then
	TRANSPARENCY_HEX=$(printf 0x%x $((0xffffffff * 100 / 100)))
	xprop -id "$WINDOWID" -f _NET_WM_WINDOW_OPACITY 32c -set _NET_WM_WINDOW_OPACITY "$TRANSPARENCY_HEX"
fi

export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export EDITOR=vim

#alias emacs="export LC_CTYPE=zh_CN.UTF-8;emacs";

alias grep='grep --color=auto'
alias ll='ls --color=auto'
alias :q='exit'
alias :sd='poweroff'

PATH=/root/.pyenv/bin:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

PATH=/root/bin:$PATH #my shell script directory
PATH=/opt/jdk1.8.0_121/bin:$PATH #ADD JDK8 BIN directory
PATH=/opt/sbt-launcher-packaging-0.13.13/bin:$PATH #sbt for scala tools
PATH=/opt/sbcl/bin:$PATH #sbcl for common lisp

export GOROOT=/opt/go-1.8
export GOPATH=/root/wisest/qa_search_dist/go_svr
PATH=$GOROOT/bin:$PATH #setting for golang

export JAVA_HOME=/opt/jdk1.8.0_121

