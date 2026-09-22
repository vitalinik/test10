#!/bin/bash

echo "=== Rollback test: stopping application ==="

PID_FILE="/var/run/cmtr-app.pid"

if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    kill "$PID" 2>/dev/null || true
fi

pkill -f "/opt/cmtr-app/app.py" 2>/dev/null || true

echo "Application stopped. Waiting for ALBUnhealthy..."
sleep 180

echo "Rollback test hook finished"
exit 0