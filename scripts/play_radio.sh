#!/bin/bash

mplayer --playlist=$1 </dev/null >/dev/null 2>&1 &
