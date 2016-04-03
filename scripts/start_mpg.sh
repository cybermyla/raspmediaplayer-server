#!/bin/bash

if [ -e 'scripts/mediapipe' ]; then
  if [ $(`ps aux | grep -- '-R --fifo ' | grep -v 'color' | wc -l`) -ne 0 ]; then
    echo "$(date) Named pipe exists and mpg123 is already running" >> log.txt
  else
    echo "$(date) Deleting named pipe mediapipe" >> log.txt
    rm -f scripts/mediapipe
    mpg123 -R --fifo scripts/mediapipe &
    echo "$(date)Started mpg123" >> log.txt
  fi
else
  mpg123 -R --fifo scripts/mediapipe &
  echo "$(date) mpg123 is now running" >> log.txt
fi
echo "$(date) sleeping"
sleep 1
