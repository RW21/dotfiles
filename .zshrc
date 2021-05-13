
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="/home/$USER/Code/zsh-scripts:$PATH"
export PATH="/home/$USER/Code/wabt/build:$PATH"
export PATH="/usr/racket/bin:$PATH"
export PATH="/usr/bin/gcloud/completion.zsh.inc:$PATH"
export PATH="$(yarn global bin):$PATH" 
export PATH=$PATH:~/.local/bin


ZSH_THEME=dogenpunk
plugins=(git z zsh-autosuggestions kubectl docker-compose docker fzf)

source $ZSH/oh-my-zsh.sh

alias oex="nautilus --browser"
alias bat="batcat" 
alias settings="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"
alias clipboard="xsel --clipboard --input"

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
source <(minikube completion zsh)

# gcloud
alias gcloud-current-project="gcloud config get-value core/project"
alias gcloud-token="gcloud auth print-identity-token"

# Dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export FZF_DEFAULT_OPTS="--height 60% --preview 'batcat --color=always {}'"
export FZF_COMPLETION_TRIGGER=','

export TERM=xterm-256color

