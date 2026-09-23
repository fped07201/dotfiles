############## Oh My Zsh installation ##############
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="dracula"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting extract sudo history-substring-search fzf zsh-interactive-cd tmuxinator)
source $ZSH/oh-my-zsh.sh
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
####################################################

export EDITOR='nvim'
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

##################### Aliases #####################

# Navigation aliases
alias l='eza'
alias la='eza -a'
alias ll='eza -lah --icons --git'
alias ls='eza --color=auto'
alias tree='eza --tree --icons'
export PATH=$PATH:/home/fpedrera/.local/bin
eval "$(zoxide init zsh)"
alias cd=z
alias du=ncdu
# Copy the PWD to the Clipboard
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias cpwd="pwd | tr -d '\n' | pbcopy && echo 'pwd copied to clipboard'"
# Configure alias to launch trace
alias t32ees='/home/fpedrera/t32_2022/bin/pc_linux64/t32mppc -c /home/fpedrera/teb_projects/TraceConfigs/config_usb_2022_ees.t32'
alias t32S32G='/home/fpedrera/t32_2022/bin/pc_linux64/t32marm -c /home/fpedrera/teb_projects/TraceConfigs/config_usb_s32g.t32'
alias t32S32G_2='/home/fpedrera/t32_2022/bin/pc_linux64/t32marm -c /home/fpedrera/teb_projects/TraceConfigs/config_usb_s32g_2.t32'
alias t32FIR='/home/fpedrera/Desktop/test/T32S32G3/bin/pc_linux64/t32marm -c /home/fpedrera/Desktop/test/T32S32G3/config_usb_s32g.t32'
alias t32_2023='/home/fpedrera/t32_2023/bin/pc_linux64/t32mppc -c /home/fpedrera/teb_projects/TraceConfigs/config_usb_2023.t32'
alias t32_2024='/home/fpedrera/t32_2024/bin/pc_linux64/t32marm -c /home/fpedrera/teb_projects/TraceConfigs/config_usb_2024.t32'
alias t32_2024_2='/home/fpedrera/t32_2024/bin/pc_linux64/t32marm -c /home/fpedrera/teb_projects/TraceConfigs/config_usb_2024_2.t32'
alias t32_riscv='/home/fpedrera/t32_2024/bin/pc_linux64/t32mriscv -c /home/fpedrera/teb_projects/TraceConfigs/config_usb_2024.t32'
alias t32_cresec='/home/fpedrera/t32_2024/bin/pc_linux64/t32mriscv -c /home/fpedrera/teb_projects/TraceConfigs/config_rem_cresec.t32'
# Configure alias for SIP relay
export RELAY_SN="0005771676"
#export RELAY_SN="0005769484"
alias relay_flash='cd /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool;sudo /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool/flash.sh $RELAY_SN; cd -'
alias relay_run='cd /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool;sudo /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool/run.sh $RELAY_SN; cd -'
alias relay_debug_run='cd /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool;sudo /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool/run_debug.sh $RELAY_SN; cd -'
alias relay_stop='cd /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool;sudo /home/fpedrera/Documents/RelaySip/DenkoviRelayCommandLineTool/stop.sh $RELAY_SN; cd -'
# FZF Alias
alias fzf="fzf --preview 'batcat --style=numbers --color=always --line-range=:500 {}'"
alias fzf_vim="fzf --preview 'batcat --style=numbers --color=always --line-range=:500 {}' --bind 'enter:execute(nvim {})'"
alias fzfc="fzf | xargs realpath | xclip -selection clipboard"
# Lazygit
alias lg="lazygit"
# Termshark
alias termshark='TERM=xterm-256color termshark'
# Tmux related
alias tn='tmux new-session -A -s "$(basename "$PWD")"'
# alias ts='sesh connect "$(sesh list -i | command fzf --ansi)"'
alias ts='sesh picker -i'
###################################################
