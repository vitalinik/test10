#!/bin/bash

PID_FILE="/var/run/cmtr-app.pid"

if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")

    if kill -0 "$PID" 2>/dev/null; then
        kill "$PID"

        for i in {1..10}; do
            if ! kill -0 "$PID" 2>/dev/null; then
                break
            fi
            sleep 1
        done
    fi

    rm -f "$PID_FILE"
fi

pkill -f "/opt/cmtr-app/app.py" 2>/dev/null || true