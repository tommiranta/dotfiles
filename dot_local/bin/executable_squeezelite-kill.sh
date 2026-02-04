#!/bin/bash

# Kill any running squeezelite processes (using SIGKILL for forceful termination)
pkill -9 -f squeezelite

if [ $? -eq 0 ]; then
    echo "Squeezelite process(es) killed successfully"
else
    echo "No squeezelite processes found"
fi
