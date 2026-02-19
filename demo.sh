#!/bin/bash

# Script Name: check_service_status.sh
# Usage: ./check_service_status.sh nginx

SERVICE_NAME=$1

# Check if service name is provided
if [ -z "$SERVICE_NAME" ]; then
    echo "Usage: $0 <service-name>"
    exit 1
fi

# Check if service exists
if systemctl list-uni
