#!/bin/bash
set -e

# Set environment variables
export MQTT_PASSWORD="${MQTT_PASSWORD}"
export MQTT_HOST="${MQTT_HOST}"
export MQTT_USER="${MQTT_USER}"
export HOMELY_PASSWORD="${HOMELY_PASSWORD}"
export HOMELY_USER="${HOMELY_USER}"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export NODE_VERSION="18.20.0"
export YARN_VERSION="1.22.19"
export PYTHONUNBUFFERED="1"

# Change to the working directory
cd /app/dist

# Start the application
exec docker-entrypoint.sh node index.js

