#!/bin/bash

# Restart coreaudiod first: a stale CoreAudio device state leaves squeezelite
# running but invisible in Lyrion. This briefly interrupts all system audio.
if sudo killall coreaudiod; then
    echo "coreaudiod restarted"
    sleep 2
else
    echo "Could not restart coreaudiod (sudo failed or not running)"
fi

# Kill any running squeezelite processes (using SIGKILL for forceful termination).
# Match the binary path, not just "squeezelite", or this script kills itself.
pkill -9 -i -f '\.local/bin/squeezelite-(arm64|amd64)'

if [ $? -eq 0 ]; then
    echo "Squeezelite process(es) killed successfully"
else
    echo "No squeezelite processes found"
fi
