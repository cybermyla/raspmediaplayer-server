#!/bin/bash

if [ -e 'scripts/mediapipe' ]; then
  echo 'PAUSE' > scripts/mediapipe
else
  echo 'Named pipe does not exist'
fi
