#!/bin/bash
if [ ! -e scripts/videopipe ]; then
  mkfifo scripts/videopipe
fi
omxplayer -b -o local --font-size 50 --align center $1 < scripts/videopipe > /dev/null &
echo . > scripts/videopipe &
