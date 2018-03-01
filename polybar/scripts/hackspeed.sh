#!/bin/sh

hackspeed_cache="$HOME/.config/polybar/scripts/hackspeed.cache"
interval=5
multiplier=60/$interval

echo "" > $hackspeed_cache
xinput test "AT Translated Set 2 keyboard" | grep --line-buffered -o "key press" >> $hackspeed_cache &

while true; do
    sleep $interval 

    lines=$(cat $hackspeed_cache | wc -l)
    lines=$((($lines - 1) * $multiplier))

    echo "" > $hackspeed_cache
    echo "$lines"
done
