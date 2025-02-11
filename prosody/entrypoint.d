#!/bin/sh
# 10-custom.sh
# This script is executed automatically during container startup.
# It can be used to perform custom initialization tasks.

echo "Running custom Prosody entrypoint script..."

# Example: Check if a custom configuration file exists and log its presence.
if [ -f /etc/prosody/conf.d/custom.cfg.lua ]; then
  echo "Custom Lua configuration found in conf.d."
else
  echo "No custom Lua configuration detected."
fi

# You can add additional commands below.
# For example, modifying configuration files based on environment variables:
# envsubst < /etc/prosody/prosody.cfg.lua > /etc/prosody/prosody.cfg.lua.tmp && mv /etc/prosody/prosody.cfg.lua.tmp /etc/prosody/prosody.cfg.lua

echo "Custom entrypoint script completed."
