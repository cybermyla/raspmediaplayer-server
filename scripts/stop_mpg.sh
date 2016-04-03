#!/bin/bash

echo "$(date) Killing mpg123 process" >> log.txt
for process in $(ps aux | grep 'mpg123 -R' | grep -v 'color=auto' | tr -s ' ' | cut -d ' ' -f2); do
  echo "$(date) Killing process $process" >> log.txt
  kill "$process"
done
echo "$(date) Deleting mediapipe"
rm -f scripts/mediapipe
