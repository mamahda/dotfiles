# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
export PATH="/home/mamahda/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/mamahda/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

export EDITOR=nvim
export VISUAL=nvim
export SUDO_EDITOR=nvim

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gianu"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting history zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration
alias v=nvim
alias vim=nvim
alias vpnits="sudo openvpn --config ~/vpn/myits.ovpn"
alias vi="nvim \"\$(fzf --preview 'batcat --style=numbers --color=always {}' --preview-window=up:60%:wrap)\""
alias ll="la -F --group-directories-first -l"
alias java="javac ./**/*.java && java"
alias venv="source venv/bin/activate"
alias pwn="ssh -i /home/mamahda/key hacker@dojo.pwn.college."
alias hx=helix
alias yz=yazi
alias cchef="/opt/zen/zen-bin Downloads/cyberchef/CyberChef_v10.22.1.html"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init --cmd cd zsh)"

# Atur supaya completion tidak case sensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*'

ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLOCK
ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_UNDERLINE
