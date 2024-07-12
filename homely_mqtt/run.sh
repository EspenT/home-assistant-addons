#!/bin/sh
set -e
set -x

echo "Starting Homely MQTT add-on"

# Log environment variables before using them
echo "MQTT_PASSWORD=${MQTT_PASSWORD}"
echo "MQTT_HOST=${MQTT_HOST}"
echo "MQTT_USER=${MQTT_USER}"
echo "HOMELY_PASSWORD=${HOMELY_PASSWORD}"
echo "HOMELY_USER=${HOMELY_USER}"
echo "DB_USERNAME=${DB_USERNAME}"
echo "DB_PASSWORD=${DB_PASSWORD}"

# Replace placeholders in the local.yml file with environment variables
sed -i "s|\${MQTT_HOST}|${MQTT_HOST}|g" /app/dist/config/local.yml
sed -i "s|\${MQTT_USER}|${MQTT_USER}|g" /app/dist/config/local.yml
sed -i "s|\${DB_USERNAME}|${DB_USERNAME}|g" /app/dist/config/local.yml
sed -i "s|\${DB_PASSWORD}|${DB_PASSWORD}|g" /app/dist/config/local.yml

# Set environment variables
export MQTT_PASSWORD="${MQTT_PASSWORD}"
export MQTT_HOST="${MQTT_HOST}"
export MQTT_USER="${MQTT_USER}"
export HOMELY_PASSWORD="${HOMELY_PASSWORD}"
export HOMELY_USER="${HOMELY_USER}"
export DB_USERNAME="${DB_USERNAME}"
export DB_PASSWORD="${DB_PASSWORD}"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export NODE_VERSION="18.20.0"
export YARN_VERSION="1.22.19"
export PYTHONUNBUFFERED="1"

# Change to the working directory
cd /app/dist
echo "Current directory: $(pwd)"
ls -l

# Start the application
exec docker-entrypoint.sh node index.js
