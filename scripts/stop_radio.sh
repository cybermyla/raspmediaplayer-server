#!/bin/bash

ps aux | grep mplayer | grep -v grep | tr -s ' ' | cut -d ' ' -f 2 | head -1 | xargs kill
