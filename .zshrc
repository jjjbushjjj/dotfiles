# Set up the prompt

fpath=(~/git/dotfiles/zsh_theme $fpath)
autoload -Uz promptinit
promptinit
# must be at /usr/share/zsh/functions/Prompts
prompt my_adam2 black

setopt histignorealldups sharehistory correctall autocd appendhistory sharehistory  hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups hist_find_no_dups

# Use vi keybindings even if our EDITOR is set to vi
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
# For this to work you need to install zsh-autosuggestions https://github.com/zsh-users/zsh-autosuggestions
bindkey '^ ' autosuggest-accept

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
HISTDUP=erase


# Use modern completion system
autoload -Uz compinit
compinit
autoload edit-command-line; zle -N edit-command-line

bindkey -M vicmd v edit-command-line

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
#alias v='vim'
alias v='nvim'
alias vo='nvim $(fzf -m --preview="cat {}")'
alias k='kubectl'
alias wk='watch kubectl'
alias lk='kubectl logs -f'
alias ycs3='aws s3 --endpoint-url=https://storage.yandexcloud.net'

# alias python=python3

# Functions
function virtualenv_info {
  [ $VIRTUAL_ENV ] && echo `basename $VIRTUAL_ENV`
}
function deleteEvictedPods() {
    environments=(
        argo-rollouts
        cert-manager
        default
        flagsmith
        foo
        istio-system
        keycloak
        kube-node-lease
        kube-public
        kube-system
        kubernetes-dashboard
        limitrange
        logging
        metallb-system
        monitoring
        monitoring2
        observability
        redis
        redis-bitnami
        redis-ha
        sentry
        sonarqube-community
        testing-a-0
        testing-a-1
        testing-a-2
        testing-a-3
        testing-a-4
        testing-a-5
        testing-a-6
        testing-app-0
        testing-app-1
        testing-biz-0
        testing-biz-1
        testing-bs-0
        testing-cia-1
        testing-d-0
        testing-d-1
        testing-d-2
        testing-k-0
        testing-k-1
        testing-k-2
        testing-k-3
        testing-mc-0
        testing-mc-1
        testing-mc-2
        testing-mc-3
        testing-mi-0
        testing-mi-1
        testing-mi-2
        testing-nobr-0
        testing-nobr-2
        testing-p-1
        testing-p-2
        testing-p-3
        testing-pn-0
        testing-pn-1
        testing-pn-2
        testing-pn-3
        testing-qa
        testing-qa-1
        testing-r-0
        testing-r-1
        testing-r-2
        testing-r-3
        testing-r-4
        testing-seo-0
        testing-seo-1
        testing-seo-2
        testing-x-0
        testing-x-1
        testing-x-2
        testing-z-0
        testing-z-1
        testing-z-2
        testing-z-3
        testing-z-4
        staging
        stable
    )

    for environment in "${environments[@]}"
    do
        echo "==================================================================================="
        echo "Removing evicted pods for namespace: \"${environment}\""
        echo "---------------------------------------------------"

        for each in $(kubectl get pods -n ${environment} | grep Evicted | awk '{print $1}');
        do
            kubectl delete pods $each -n ${environment}
        done
        echo "==================================================================================="
        echo "\n"
    done
}

# . /usr/share/powerline/bindings/zsh/powerline.zsh
#. /usr/local/bin/virtualenvwrapper.sh
# Adding path to completion scripts
fpath=(~/.zsh/completion $fpath)
source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh
path+=('/home/bushuev/.local/bin')
path+=('/usr/local/go/bin')
path+=('/home/bushuev/go/bin')
path+=('/home/bushuev/.krew/bin')
path+=('/home/bushuev/.local/scripts')
path+=('/home/bushuev/node-v18.17.0-linux-x64/bin')
export PATH
export EDITOR=nvim

export SSH_AUTH_SOCK="$HOME/.ssh/ssh-agent.socket"

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/home/bushuev/yandex-cloud/path.bash.inc' ]; then source '/home/bushuev/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/home/bushuev/yandex-cloud/completion.zsh.inc' ]; then source '/home/bushuev/yandex-cloud/completion.zsh.inc'; fi
source <(kubectl completion zsh)

# operator-sdk completion
source <(operator-sdk completion zsh)

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
autoload -U compinit; compinit

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

#compdef snaplet
###-begin-snaplet-completions-###
#
# yargs command completion script
#
# Installation: snaplet completion >> ~/.zshrc
#    or snaplet completion >> ~/.zprofile on OSX.
#
_snaplet_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" snaplet --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _snaplet_yargs_completions snaplet
###-end-snaplet-completions-###
#
# Nice stuff open tmux session with name from fzf search
bindkey -s ^f "tmux-sessionizer\n"
# Nice stuff open file in editor with name from fzf search
bindkey -s ^e "vim-open\n"

complete -o nospace -C /usr/bin/packer packer


# autosuggestions in cmd
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source "$HOME/.cargo/env"
