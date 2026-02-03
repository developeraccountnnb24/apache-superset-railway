#!/bin/bash
set -e

# Default values for admin user
ADMIN_USERNAME="${ADMIN_USERNAME:-admin}"
ADMIN_FIRSTNAME="${ADMIN_FIRSTNAME:-Superset}"
ADMIN_LASTNAME="${ADMIN_LASTNAME:-Admin}"
ADMIN_EMAIL="${ADMIN_EMAIL:-admin@superset.local}"
ADMIN_PASSWORD="${ADMIN_PASSWORD:-admin}"

echo "Initializing Superset..."

# Create admin user (will skip if exists)
superset fab create-admin \
    --username "$ADMIN_USERNAME" \
    --firstname "$ADMIN_FIRSTNAME" \
    --lastname "$ADMIN_LASTNAME" \
    --email "$ADMIN_EMAIL" \
    --password "$ADMIN_PASSWORD" || true

# Upgrade database
echo "Upgrading database..."
superset db upgrade

# Initialize Superset (roles, permissions)
echo "Initializing roles and permissions..."
superset init

# Start server
echo "Starting Superset server..."
/bin/sh -c /usr/bin/run-server.sh
