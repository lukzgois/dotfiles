#!/bin/sh

# Launch kmonad

killall -q kmonad
kmonad ~/.config/kmonad/home-row.kbd > /dev/null 2>&1 &
