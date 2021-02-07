# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/rw21/.oh-my-zsh"

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="/home/rw21/code/zsh-scripts:$PATH"
export PATH="/home/rw21/code/wabt/build:$PATH"

ZSH_THEME=candy
plugins=(git z zsh-autosuggestions kubectl)

source $ZSH/oh-my-zsh.sh

alias oex="nautilus --browser"
alias bat="batcat" 
alias settings="env XDG_CURRENT_DESKTOP=GNOME gnome-control-center"
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# Dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

