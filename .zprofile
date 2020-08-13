#!/bin/zsh

# zsh profile file. Runs on login. Environmental variables are set here

# Add ~/.local/bin to $PATH
export PATH=$HOME/.local/bin:$PATH

export SCREENSHOTDIR=~/pics/screenshots

# default programs
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st"
export BROWSER="brave"
export BROWSER_PRIVATE="brave --incognito"
export BROWSERCLI="w3m"
export READER="zathura"

# homepage for w3m
export WWW_HOME="https://ifconfig.me"

# Cleanup home directory
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export VIMWIKIDIR="$HOME/docs/vimwiki"
export GOPATH=$HOME/.local/bin/go
export ZDOTDIR="$HOME/.config/zsh"
#export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export HISTFILE="$XDG_DATA_HOME"/bash/history
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME"/android
export LESSHISTFILE=-
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export STACK_ROOT="$XDG_DATA_HOME"/stack
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME"/notmuch/notmuchrc
export NMBGIT="$XDG_DATA_HOME"/notmuch/nmbug
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export UNISON="${XDG_DATA_HOME:-$HOME/.local/share}/unison"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"
export XAUTHORITY="$XDG_RUNTIME_DIR:-/run/user/1000"/Xauthority
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker



# Program settings
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"

# fff file manager settings
export FFF_FILE_FORMAT="\t%f"
export FFF_MARK_FORMAT=">  %f*"
export FFF_KEY_HIDDEN="."
export FFF_FAV1=~/docs/projects
export FFF_FAV2=~/pics/screenshots
export FFF_FAV3=/
export FFF_FAV4=/usr/share

# start x on login if on tty1
if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep dwm || ssh-agent sx
fi

#source ~/.fehbg
#wal -R
