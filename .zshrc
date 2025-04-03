# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# }}}

# History file {
HISTFILE="$HOME/.config/zsh/zsh_history"
HISTSIZE=10000
SAVEHIST=10000
# }

# Colors {{{
autoload -U compinit promptinit colors
compinit
promptinit
colors
# }}}

# Prompt {{{
PS1="%{$fg[magenta]%}%n%{$fg[green]%}@%{$fg[magenta]%}%M %{$fg[red]%}»%{$reset_color%} "
RPROMPT="%{$fg[blue]%}%~%{$reset_color%}"
# }}}

# User configuration {{{
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export TERMINAL="alacritty"
export BROWSER="firefox"
export XDG_CONFIG_HOME="$HOME/.config"
export TERM="xterm-256color"
export GPG_TTY=$(tty)
export HOSTNAME="siapentest1"
export ANSIBLE_VAULT_PASSWORD_FILE='/home/fpkmatthi/.config/.ansible-vault_pass'
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
# }}}

# Export path {{{
# export PATH="$PATH:$HOME/.local/bin:$HOME/.gem/ruby/2.6.0/bin:$HOME/Documents/blender-2.83.7-linux64"
export PATH="$PATH:$HOME/.local/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:$HOME/Documents/blender-2.83.7-linux64"
export PATH="$PATH:/home/fpkmatthi/.gem/ruby/3.0.0/bin"
export PATH="$PATH:/home/fpkmatthi/.bin"

export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin/
export PATH=$PATH:$ANDROID_HOME/platform-tools/
export PATH=$PATH:$ANDROID_HOME/emulator/
# }}}

# Aliases' {{{
# For a full list of active aliases, run `alias`.
source $HOME/.config/zsh/aliases.sh
source $HOME/.config/zsh/aliases/custom_aliases.zsh
# }}}

 #Correction {{{
setopt correct # spelling correction for commands
setopt correctall # spelling correction for arguments
# }}}

# Auto Completion {{{
setopt always_to_end # When completing from the middle of a word, move the cursor to the end of the word
setopt auto_menu # Show completion menu on successive tab press. needs unsetop menu_complete to work
setopt auto_name_dirs # Zny parameter that is set to the absolute name of a directory immediately becomes a name for that directory
setopt complete_in_word # Allow completion from within a word/phrase
unsetopt menu_complete # do not autoselect the first completion entry
# }}}

# zstyle stuff {{{
# man zshcontrib
zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:*' enable git #svn cvs

# Enable completion caching, use rehash to clear
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

# Fallback to built in ls colors
zstyle ':completion:*' list-colors ''

# Make the list prompt friendly
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'

# Make the selection prompt friendly when there are a lot of choices
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Add simple colors to kill
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select=1 _complete _ignored _approximate

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:scp:*' tag-order files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show
# }}}

# Set VI bindings {{{
set -o vi
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
# }}}

# Source plugins {{{
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh
source /usr/share/zsh/scripts/zplug/init.zsh
# }}}

# FZF {{{
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
# export FZF_DEFAULT_OPTS="--height 60% --reverse --preview='(bat --style=numbers --color=always --theme=TwoDark {} || cat {}) 2> /dev/null | head -500' --preview-window=down:10"
export FZF_DEFAULT_OPTS="
--height 60% --reverse --preview='(bat --style=numbers --color=always --theme=TwoDark {} || cat {}) 2> /dev/null | head -500' --preview-window=down:10"
	# --color=fg:#908caa,bg:#191724,hl:#ebbcba
	# --color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	# --color=border:#403d52,header:#31748f,gutter:#191724
	# --color=spinner:#f6c177,info:#9ccfd8
	# --color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
export FD_OPTS="--type f --type l --follow --exclude .git" 
export FZF_DEFAULT_COMMAND="fd $FD_OPTS"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# }}}

# Pyenv {{{
export PATH="$HOME/.pyenv/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# }}}

# zplug "dracula/zsh", as:theme
# zplug load --verbose


# Load Angular CLI autocompletion.
source <(ng completion script)
