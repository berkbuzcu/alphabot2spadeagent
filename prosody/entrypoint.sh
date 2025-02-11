#!/bin/bash
set -e

# ------------------------------------------------------------------------------
# Prosody Docker Entrypoint Script
#
# This script is executed when the container starts. It performs any necessary
# initialization (e.g., environment variable substitution in configuration files
# or running custom scripts) and finally executes the main command.
# ------------------------------------------------------------------------------

# Optional: Substitute environment variables in configuration template if present.
if [ -f /etc/prosody/prosody.cfg.lua.template ]; then
  echo "Processing environment variable substitutions in prosody.cfg.lua..."
  envsubst < /etc/prosody/prosody.cfg.lua.template > /etc/prosody/prosody.cfg.lua
fi

# Optional: Run any initialization scripts placed in /docker-entrypoint.d/.
if [ -d "/docker-entrypoint.d" ]; then
  for script in /docker-entrypoint.d/*; do
    if [ -x "$script" ]; then
      echo "Running initialization script: $script"
      "$script"
    fi
  done
fi

# If no command is provided, default to starting the prosody server.
if [ "$#" -eq 0 ]; then
  echo "No command specified, starting Prosody..."
  exec prosody
else
  # Otherwise, execute the command passed to the container.
  exec "$@"
fi
