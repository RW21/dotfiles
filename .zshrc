### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Skip ubuntu global compinit
skip_global_compinit=1

autoload -Uz compinit
compinit


export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="/home/rw21/Code/zsh-scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/home/rw21/.yarn/bin:$PATH"

zinit wait lucid for \
        OMZL::git.zsh \
  atload"unalias grv" \
        OMZP::git

# Theme
PS1="READY >"
zinit wait'!' lucid for \
    OMZL::prompt_info_functions.zsh \
    OMZT::gnzh


if [[ "$(uname)" == "Darwin" ]]; then
    alias love="/Applications/love.app/Contents/MacOS/love"
fi


if [[ "$(uname)" == "Darwin" ]]; then
    export FZF_BASE="$HOME/.local/share/zinit/plugins/junegunn---fzf/fzf"
fi

# FZF

zinit ice from"gh-r" as"program"
zinit light junegunn/fzf

zinit snippet https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh

zinit snippet https://github.com/junegunn/fzf/blob/master/shell/completion.zsh

zinit ice lucid wait'0'
zinit light joshskidmore/zsh-fzf-history-search

zinit ice wait lucid
zinit light Aloxaf/fzf-tab

export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export FZF_DEFAULT_OPTS="--ansi --height 60%"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_COMPLETION_TRIGGER=','

zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh
zinit snippet OMZ::plugins/docker-compose/docker-compose.plugin.zsh
# zinit snippet OMZ::plugins/fzf/fzf.plugin.zsh
zinit snippet OMZ::plugins/kubectl/kubectl.plugin.zsh
zinit snippet OMZ::plugins/gcloud/gcloud.plugin.zsh

zinit ice wait lucid
zinit light zsh-users/zsh-completions 
zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions 

zinit ice wait lucid
zinit load agkozak/zsh-z


alias oex="nautilus --browser"
alias bat="batcat"
# alias vim="nvim"
alias settings="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"
alias clipboard="xsel --clipboard --input"
alias globalip="dig +short myip.opendns.com @resolver1.opendns.com"

cheat() {
   curl cht.sh/"$@"
}

# gcloud
alias gcloud-current-project="gcloud config get-value core/project"
alias gcloud-token="gcloud auth print-identity-token"
export CLOUDSDK_PYTHON=/usr/bin/python3
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'



ZSH_TMUX_AUTOSTART=true
export TERM=xterm-256color

# export EDITOR=nvim
export GIT_EDITOR=$EDITOR

export ANSIBLE_COW_SELECTION=random

export HISTFILE=~/.zsh_history
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

export HISTTIMEFORMAT="[%F %T] "

zshaddhistory() {
   setopt LOCAL_OPTIONS
   setopt EXTENDED_GLOB
   print -sr -- "${1%%$'\n'##}"
   fc -p "$HISTFILE"
   return 1
}

bracketed-paste() {
  zle .$WIDGET && LBUFFER=${LBUFFER%$'\n'}
}
zle -N bracketed-paste

export NVM_COMPLETION=true
export NVM_SYMLINK_CURRENT="true"
# zinit wait lucid  for lukechilds/zsh-nvm
zinit ice wait"1" lucid
zinit load lukechilds/zsh-nvm

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^H' backward-kill-word

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"

zinit ice id-as="kubectl" as"command" # atload"kubectl completion zsh > _kubectl"
zinit snippet "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/arm64/kubectl"
# zinit light-mode lucid wait has"kubectl" for \
#     id-as"kubectl-completion" \
#     as"completion" \
#     atclone"kubectl completion zsh > _kubectl" \
#     atpull"%atclone" \
#     zdharma/null
source <(kubectl completion zsh)
alias k="kubectl"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/rw21/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/rw21/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/rw21/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/rw21/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

