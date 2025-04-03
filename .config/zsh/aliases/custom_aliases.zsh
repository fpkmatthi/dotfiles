# Zsh shell aliases
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias optirun-nvidia-settings='optirun -b none nvidia-settings -c :8'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias vim="nvim"
alias vi="nvim"
alias rm="rm -i"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias ll='ls -alF --color=auto'
alias la='ls -lA --color=auto'
alias l='ls -lCF --color=auto'
alias vi='vim'
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='grep -F --color=auto'
alias egrep='grep -E --color=auto'
alias tf='terraform'
alias gst='git status'
alias ga='git add'
alias gc='git commit -m'
alias gc='git commit -S -m'
alias secnetvpn="sudo openvpn $HOME/Repos/sopra-steria/az-secnet/ansible/certificates/azsecnet-vpn/ovpn/fpkmatthi@azsecnet-vpn.ovpn"
alias testnetvpn="sudo openvpn $HOME/Repos/sopra-steria/az-testnet/ansible/certificates/azsecnet-vpn/ovpn/fpkmatthi@azsecnet-vpn.ovpn"
alias vbox="$HOME/.bin/vbox.sh"

# Functions
function open() { xdg-open $1 &> /dev/null &disown; }
function lt() { ls -ltrsa "$@" | tail; }
function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
function fname() { find . -iname "*$@*"; }
function conf() {
  case $1 in
    bspwm)      vim ~/.config/bspwm/bspwmrc ;;
    sxhkd)      vim ~/.config/sxhkd/sxhkdrc ;;
    pacman)     svim /etc/pacman.conf ;;
    tmux)       vim ~/.tmux.conf ;;
    vim)        vim ~/.vim/vimrc ;;
    xinit)      vim ~/.xinitrc ;;
    xresources) vim ~/.Xresources && xrdb ~/.Xresources ;;
    zathura)    vim ~/.config/zathura/zathurarc ;;
    zsh)        vim ~/.zshrc && source ~/.zshrc ;;
    hosts)      sudoedit /etc/hosts ;;
    httpd)      sudoedit /etc/httpd/conf/httpd.conf ;;
    *)          echo "Unknown application: $1" ;;
  esac
}

