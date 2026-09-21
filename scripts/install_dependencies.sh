#!/bin/bash
set -e

APP_DIR="/opt/cmtr-app"

mkdir -p "$APP_DIR"
cd "$APP_DIR"

python3 -m pip install --no-cache-dir -r requirements.txt
