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

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="/home/rw21/code/zsh-scripts:$PATH"

setopt promptsubst

zinit wait lucid for \
        OMZL::git.zsh \
  atload"unalias grv" \
        OMZP::git

zinit wait'!' lucid for \
    OMZL::prompt_info_functions.zsh \
    OMZT::gnzh

zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh
zinit snippet OMZ::plugins/docker-compose/docker-compose.plugin.zsh
zinit snippet OMZ::plugins/fzf/fzf.plugin.zsh
zinit snippet OMZ::plugins/kubectl/kubectl.plugin.zsh
zinit snippet OMZ::plugins/gcloud/gcloud.plugin.zsh

zinit ice wait lucid
zinit light zsh-users/zsh-completions 
zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions 
zinit ice wait lucid
zinit light rupa/z

alias oex="nautilus --browser"
alias bat="batcat"
alias vim="nvim"
alias settings="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"
alias clipboard="xsel --clipboard --input"

# gcloud
alias gcloud-current-project="gcloud config get-value core/project"
alias gcloud-token="gcloud auth print-identity-token"
export CLOUDSDK_PYTHON=python2

# Dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export FZF_DEFAULT_OPTS="--ansi --height 60% --preview 'batcat --color=always {}'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_COMPLETION_TRIGGER=','

ZSH_TMUX_AUTOSTART=true
export TERM=xterm-256color

export EDITOR=nvim
export GIT_EDITOR=$EDITOR

export ANSIBLE_COW_SELECTION=random

export HISTFILE=~/.zsh_history
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

# complete -F __start_kubectl k

export NVM_COMPLETION=true
export NVM_SYMLINK_CURRENT="true"
zinit wait lucid light-mode for lukechilds/zsh-nvm

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^H' backward-kill-word

