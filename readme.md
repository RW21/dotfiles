# Dotfile Management

`alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`


## Migrating 

```
git clone --bare <git-repo-url> $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
echo ".dotfiles" >> $HOME/.gitignore
dotfiles checkout
```
