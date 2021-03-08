# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/rw21/.oh-my-zsh"

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="/home/rw21/Code/zsh-scripts:$PATH"
export PATH="/home/rw21/Code/wabt/build:$PATH"
export PATH="/usr/racket/bin:$PATH"
export PATH="/usr/bin/gcloud/completion.zsh.inc:$PATH"
export PATH=$PATH:~/.local/bin


ZSH_THEME=candy
plugins=(git z zsh-autosuggestions kubectl)

source $ZSH/oh-my-zsh.sh

alias oex="nautilus --browser"
alias bat="batcat" 
alias settings="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# Dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
