#!/bin/bash
set -e

APP_DIR="/opt/cmtr-app"
PID_FILE="/var/run/cmtr-app.pid"
LOG_FILE="/var/log/cmtr-app.log"

cd "$APP_DIR"

nohup python3 app.py > "$LOG_FILE" 2>&1 &

echo $! > "$PID_FILE"

sleep 2

if ! kill -0 "$(cat "$PID_FILE")" 2>/dev/null; then
    echo "Application failed to start"
    cat "$LOG_FILE"
    exit 1
fi

echo "Application started, PID $(cat "$PID_FILE")"