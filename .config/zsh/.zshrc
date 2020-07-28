autoload -U colors && colors
autoload -Uz compinit && compinit
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{magenta}[%F{cyan}%b%F{magenta}]'

NEWLINE=$'\n '
PS1="%B %{$fg[blue]%}%n@%M %{$fg[magenta]%}%~${NEWLINE}%(!.%{$fg[red]%}#.%{$fg[green]%}->)%b%{$reset_color%} "
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "


HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt COMPLETE_ALIASES
setopt autocd

source $HOME/.config/aliasrc

zstyle ':completion:*' menu select
zmodload zsh/complist

# Include hidden files in autocomplete:
_comp_options+=(globdots)

# Set window title to command just before running it.
#preexec() { printf "\e]2;%n@%m %~\a" "$1"; }

# Set window title to current working directory after returning from a command.
#precmd() { printf "\x1b]0;%s\x07" "$PWD" }
# autoload -Uz add-zsh-hook

# function xterm_title_precmd () {
# 	print -Pn -- '\e]2;%n@%m %~\a'
# 	[[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
# }

# function xterm_title_preexec () {
# 	print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
# 	[[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
# }

# if [[ "$TERM" == (screen*|xterm*|rxvt*|tmux*|putty*|konsole*|gnome*|st*) ]]; then
# 	add-zsh-hook -Uz precmd xterm_title_precmd
# 	add-zsh-hook -Uz preexec xterm_title_preexec
# fi

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# Use beam shape cursor on startup.
echo -ne '\e[5 q'
# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;}

# autocomplete surfraw bookmarks
# usage: srb <bookmark_name>
_cmpl_surfraw() { reply=($(awk 'NF != 0 && !/^#/ {print $1}' ~/.config/surfraw/bookmarks | grep -v '^-' | grep -v '^}' | grep -v '^/' | sort -n)) ;}
compctl -K _cmpl_surfraw srb srg
alias srb='surfraw -browser=$BROWSERCLI'          # use for surfraw bookmarks (CLI)
alias srg='surfraw -browser=$BROWSER'             # use for surfraw bookmarks (GUI)


source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
