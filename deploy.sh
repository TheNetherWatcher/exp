#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
APP_NAME="main.py"  # Replace with your FastAPI entry point
LOG_FILE="$SCRIPT_DIR/fastapi.log"  # Log file path relative to the script

echo "Stopping any existing instance of the FastAPI server..."

# Find the process ID (PID) of the running server and kill it
PIDS=$(ps aux | grep "$APP_NAME" | grep -v grep | awk '{print $2}')
if [ -n "$PIDS" ]; then
    echo "Found running server process(es): $PIDS"
    kill -9 $PIDS
    echo "Killed running process(es)."
else
    echo "No running server instance found."
fi

echo "Starting a new instance of the FastAPI server with nohup..."

# Start a new instance using nohup
nohup python3 "$SCRIPT_DIR/$APP_NAME" > "$LOG_FILE" 2>&1 &

echo "FastAPI server started successfully."
echo "Logs can be found in $LOG_FILE."