# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="dracula"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting tmux extract sudo history-substring-search fzf zsh-interactive-cd tmuxinator)

source $ZSH/oh-my-zsh.sh

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH="$PATH:/opt/nvim-linux64/bin"

# Navigation aliases
alias l='exa'
alias la='exa -a'
alias ll='exa -lah'
alias ls='exa --color=auto'
export PATH=$PATH:/home/fpedrera/.local/bin
eval "$(zoxide init zsh)"
alias cd=z
alias du=ncdu

# Copy the PWD to the Clipboard
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias cpwd="pwd | tr -d '\n' | pbcopy && echo 'pwd copied to clipboard'"

# Configure alias to launch trace
alias t32ees='/home/fpedrera/t32/bin/pc_linux64/t32mppc -c /home/fpedrera/t32/config_usb.t32'
alias t32S32G='/home/fpedrera/t32_2022/bin/pc_linux64/t32marm -c /home/fpedrera/teb_projects/TraceConfigs/config_usb_s32g.t32'
alias t32S32G_2='/home/fpedrera/t32_2022/bin/pc_linux64/t32marm -c /home/fpedrera/teb_projects/TraceConfigs/config_usb_s32g_2.t32'
alias t32FIR='/home/fpedrera/Desktop/test/T32S32G3/bin/pc_linux64/t32marm -c /home/fpedrera/Desktop/test/T32S32G3/config_usb_s32g.t32'
alias t32_2023='/home/fpedrera/t32_2023/bin/pc_linux64/t32mppc -c /home/fpedrera/teb_projects/TraceConfigs/config_usb_2023.t32'
alias t32_2024='/home/fpedrera/t32_2024/bin/pc_linux64/t32marm -c /home/fpedrera/teb_projects/TraceConfigs/config_usb_2024.t32'
alias t32_2024_2='/home/fpedrera/t32_2024/bin/pc_linux64/t32marm -c /home/fpedrera/teb_projects/TraceConfigs/config_usb_2024_2.t32'

# Configure alias for SIP relay
export RELAY_SN="0005771676"
#export RELAY_SN="0005769484"
alias relay_flash='cd /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool;sudo /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool/flash.sh $RELAY_SN; cd -'
alias relay_run='cd /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool;sudo /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool/run.sh $RELAY_SN; cd -'
alias relay_debug_run='cd /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool;sudo /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool/run_debug.sh $RELAY_SN; cd -'
alias relay_stop='cd /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool;sudo /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool/stop.sh $RELAY_SN; cd -'

# Configure alias fur S32DS
alias S32DS_G2='/home/fpedrera/NXP/S32DS.3.5/s32ds.sh'

# FZF Alias
alias fzf="fzf --preview 'batcat --style=numbers --color=always --line-range=:500 {}'"
alias fzf_vim="fzf --preview 'batcat --style=numbers --color=always --line-range=:500 {}' --bind 'enter:execute(nvim {})'"
alias fzfc="fzf | xargs realpath | xclip -selection clipboard"

# Lazygit
alias lg="lazygit"

alias termshark='TERM=xterm-256color termshark'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
