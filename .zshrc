# Set up the prompt

fpath=(~/git/dotfiles/zsh_theme $fpath)
autoload -Uz promptinit
promptinit
# must be at /usr/share/zsh/functions/Prompts
prompt my_adam2 black

setopt histignorealldups sharehistory correctall autocd

# Use vi keybindings even if our EDITOR is set to vi
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


#Aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls --color=auto -l'
alias la='ls --color=auto -la'
alias l='ls --color=auto -CF'
alias v='vim'

# alias python=python3

# Functions
function virtualenv_info {
  [ $VIRTUAL_ENV ] && echo `basename $VIRTUAL_ENV`
}

# . /usr/share/powerline/bindings/zsh/powerline.zsh
. /usr/local/bin/virtualenvwrapper.sh
# Adding path to completion scripts
fpath=(~/.zsh/completion $fpath)
