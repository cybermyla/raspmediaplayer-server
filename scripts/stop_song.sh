#!/bin/bash

if [ -e 'scripts/mediapipe' ]; then
  echo "$(date) Stopping playback" >> log.txt
  echo 'STOP' > scripts/mediapipe
else
  echo 'Named pipe does not exist'
fi

./scripts/stop_mpg.sh
