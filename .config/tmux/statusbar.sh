#!/bin/sh


# Dracula Color Pallette
white='#f8f8f2'
gray='#44475a'
dark_gray='#282a36'
light_purple='#bd93f9'
dark_purple='#6272a4'
cyan='#8be9fd'
green='#50fa7b'
orange='#ffb86c'
red='#ff5555'
pink='#ff79c6'
yellow='#f1fa8c'

current_dir=~/.config/tmux/statusbar-scripts

# set status bar to top
tmux set-option -g status-position top

# Symbol    Meaning ================================
#      *    Denotes the current window.
#      -    Marks the last window (previously selected).
#      #    Window is monitored and activity has been detected.
#      !    A bell has occurred in the window.
#      ~    The window has been silent for the monitor-silence interval.
#      M    The window contains the marked pane.
#      Z    The window's active pane is zoomed.

# monitor changes on non-focus window (activity symbol = #)
# (e.g 1:zsh  2:zsh  3:torr# 4:im- 5:chat# 6:fm# 7:conf*)
tmux set-window-option -g monitor-activity on

# displays a message at the bottom when activity is detected (e.g Activity in Window 5)
# requires: monitor-activity on
# set-option -g visual-activity off

# bell colors (bell symbol = !)
# to simulate a bell alert use: sleep 3 && echo -e "\a"
tmux set-window-option -g window-status-bell-style 'fg=black,bg=colour5,bright'

# centre status bar
tmux set-option -g status-justify centre
# sets refresh interval to every second
tmux set-option -g status-interval 1

# set clock to 12 hour by default
# tmux set-option -g clock-mode-style 12

# set length 
tmux set-option -g status-left-length 100
tmux set-option -g status-right-length 100

# pane border styling
tmux set-option -g pane-active-border-style "fg=${light_purple}"
# tmux set-option -g pane-active-border-style "fg=${dark_purple}"
tmux set-option -g pane-border-style "fg=${gray}"

# message styling
tmux set-option -g message-style "bg=${gray},fg=${white}"

# status bar
tmux set-option -g status-style "bg=${gray},fg=${white}"

tmux set-option -g status-left "#[bg=${dark_purple}]#{?client_prefix,#[bg=${red}],}#[fg=${white}]Session: #S #[fg=${yellow}]#I #[fg=${cyan}]#P"

tmux set-option -g  status-right ""

# mpd
if [ "$(tmux showw -v @mpd)" -eq 1 ]; then
    tmux set-option -ga status-right "#[fg=${white},bg=${dark_purple}]#(${current_dir}/mpd.sh) "
fi

# battery
# tmux set-option -ga  status-right "#[fg=${white},bg=${dark_purple}] #(${current_dir}/battery.sh) "

# newsboat
# tmux set-option -ga status-right "#[fg=${white},bg=${dark_purple}] #(${current_dir}/rss.sh) "

  # redshift
  # tmux set-option -ga status-right "#[fg=${white},bg=${light_purple}] #(${current_dir}/redshift.sh) "

#show ram usage
# tmux set-option -ga status-right "#[fg=${white},bg=${dark_purple}] #(${current_dir}/ram_info.sh) "

# show cpu usage
# tmux set-option -ga status-right "#[fg=${white},bg=${dark_purple}] #(${current_dir}/cpu_info.sh) "

# show gpu usage
# tmux set-option -ga status-right "#[fg=${white},bg=${dark_purple}] #(${current_dir}/gpu_usage.sh) "

# volume
# tmux set-option -ga status-right "#[fg=${white},bg=${dark_purple}] #(${current_dir}/volume.sh) "

# network
if [ "$(tmux showw -v @netw)" -eq 1 ]; then
    tmux set-option -ga status-right "#[fg=${white},bg=${dark_purple}]#(${current_dir}/network.sh) "
fi
# traffic
if [ "$(tmux showw -v @nettraf)" -eq 1 ]; then
    tmux set-option -ga status-right "#[fg=${white},bg=${dark_purple}]#(${current_dir}/nettraf.sh) "
fi

 # show time
tmux set-option -ga status-right "#[fg=${white},bg=${dark_purple}]%R %d/%m/%y"

# window status format
tmux set-window-option -g window-status-current-format "#[fg=${white},bg=${dark_purple}] #I #W#F"
tmux set-window-option -g window-status-format " #I #W#F"
