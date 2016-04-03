#!/bin/bash

if [ -e 'scripts/videopipe' ]; then
  echo -n q > scripts/videopipe
  exit 0
fi
exit 1
