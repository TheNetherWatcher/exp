#!/bin/bash

# Navigate to the repository
REPO_DIR=$(dirname "$(realpath "$0")")
cd "$REPO_DIR"

# Pull the latest changes
echo "Pulling latest changes from the repository..."
git reset --hard  # Ensure no local changes cause conflicts
git pull origin main

# Kill the old server process if running
echo "Stopping the current running process (if any)..."
pkill -f "python3 main.py" || echo "No running process found."

# Start the server with nohup
echo "Starting the server..."
nohup python3 main.py > server.log 2>&1 &

echo "Deployment complete."
