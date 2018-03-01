#!/usr/bin/env sh

# Kill existing instances and wait for shutdown
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch new bar
polybar default &
