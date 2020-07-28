# dotfiles
## Install
### Initial configuration

    git init --bare ~/.dotfiles
    alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
    dotfiles config status.showUntrackedFiles no

Source: [archwiki](https://wiki.archlinux.org/index.php/Dotfiles#Tracking_dotfiles_directly_with_Git)

### Pull this repo

    dotfiles remote add origin https://github.com/ArthurBais/dotfiles.git
    dotfiles pull origin master
