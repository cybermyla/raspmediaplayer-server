#!/bin/bash
echo "$(date) Play $1 request received"
echo "$(date) Starting start_mpg.sh script" >> log.txt
source scripts/start_mpg.sh

if [ -z "$1" ]; then
  echo 'Missing song path'
else
  echo "$(date) playing $1" >> log.txt
  echo "LOAD $1" > scripts/mediapipe
fi

