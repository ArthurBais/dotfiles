#!/bin/sh
# echo "$(mpc | grep paused > /dev/null && printf '▶️' || printf '⏸️') $(mpc current)" | skroll -d 0.5 -l
mpc | grep "volume: n/a" 2> /dev/null && echo "⏹️" && exit
mpc | grep paused > /dev/null && echo "⏸️ paused" && exit
mpc current | skroll -d 1
	# echo "$(mpc | grep - | tr ';' '+' | sed 's/+/ + /g') - $(mpc | grep % | sed 's/   /_/g' | cut -d_ -f2 | sed 's/repeat/ /g' | sed 's/off/ /g' | sed 's/on/ /g' | sed 's/ :/ /g' | awk 'NF > 0')"
