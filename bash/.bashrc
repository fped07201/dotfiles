# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -alFh'
#alias la='ls -A'
#alias l='ls -CF'
alias l='exa'
alias la='exa -a'
alias ll='exa -lah'
alias ls='exa --color=auto'
eval "$(zoxide init bash)"
alias cd=z

#Python alias
alias python=python3

# Copy the PWD to the Clipboard
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias cpwd="pwd | tr -d '\n' | pbcopy && echo 'pwd copied to clipboard'"

# Compress/Extract aliases
alias extract='tar -xvf'
alias compress='tar -cvf'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Configure alias for ultron
#alias ssh_PF_ultron='ssh -L8455:10.10.10.6:8455 -L8456:10.10.10.6:8456 -L3389:10.10.100.10:3389 -L22222:10.10.10.6:22 ultron'

# Configure alias to launch trace
alias t32ees='/home/fpedrera/t32/bin/pc_linux64/t32mppc -c /home/fpedrera/t32/config_usb.t32'
alias t32S32G='/home/fpedrera/t32_2022/bin/pc_linux64/t32marm -c /home/fpedrera/teb_projects/TraceConfigs/config_usb_s32g.t32'
alias t32S32G_2='/home/fpedrera/t32_2022/bin/pc_linux64/t32marm -c /home/fpedrera/teb_projects/TraceConfigs/config_usb_s32g_2.t32'
#alias t32zobasA='/home/fpedrera/t32_s32g/bin/pc_linux64/t32marm64 -c /home/fpedrera/t32_s32g/config_usb_A.t32'
alias t32zobasA='/opt/t32/bin/pc_linux64/t32marm -c /home/fpedrera/teb_projects/TraceConfigs/config_usb.t32'
alias t32remotezobasM='/home/fpedrera/t32_s32g/bin/pc_linux64/t32marm -c /home/fpedrera/teb_projects/Trace_remote/config_rem.t32'
alias t32remotezobasA='/home/fpedrera/t32_s32g/bin/pc_linux64/t32marm64 -c /home/fpedrera/teb_projects/Trace_remote/config_rem.t32'
alias t32remotezobasM2='/home/fpedrera/t32_s32g/bin/pc_linux64/t32marm -c /home/fpedrera/teb_projects/Trace_remote/config_rem_2.t32'
alias t32stellar='/home/fpedrera/t32_stellar/bin/pc_linux64/t32marm -c /home/fpedrera/t32_stellar/config_usb.t32'
alias t32FIR='/home/fpedrera/Desktop/test/T32S32G3/bin/pc_linux64/t32marm -c /home/fpedrera/Desktop/test/T32S32G3/config_usb_s32g.t32'

# Configure alias for SIP relay
export RELAY_SN="0005771676"
#export RELAY_SN="0005769484"
alias relay_flash='cd /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool;sudo /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool/flash.sh $RELAY_SN; cd -'
alias relay_run='cd /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool;sudo /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool/run.sh $RELAY_SN; cd -'
alias relay_debug_run='cd /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool;sudo /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool/run_debug.sh $RELAY_SN; cd -'
alias relay_stop='cd /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool;sudo /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool/stop.sh $RELAY_SN; cd -'

# Configure alias fur S32DS
alias S32DS='/home/fpedrera/NXP/S32DS.3.5/s32ds.sh'

# GIT branch in prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
#export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export PS1="\u \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export JDK_HOME=${JAVA_HOME}
export JRE_HOME=${JDK_HOME}/jre/
export PATH=$PATH:/home/fpedrera/.dotnet

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
