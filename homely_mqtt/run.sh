#!/bin/bash
set -e

# Enable debugging
set -x

# Log start
echo "Starting Homely MQTT add-on"

# Log environment variables
echo "MQTT_PASSWORD=${MQTT_PASSWORD}"
echo "MQTT_HOST=${MQTT_HOST}"
echo "MQTT_USER=${MQTT_USER}"
echo "HOMELY_PASSWORD=${HOMELY_PASSWORD}"
echo "HOMELY_USER=${HOMELY_USER}"

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

# Log current directory
echo "Current directory: $(pwd)"

# List contents of the directory
ls -l

# Start the application
exec docker-entrypoint.sh node index.js
