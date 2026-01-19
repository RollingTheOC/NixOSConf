#!/usr/bin/env bash
set -euo pipefail

CONFIG_DIR="/etc/nixos"
cd "$CONFIG_DIR"

echo "Pulling latest configuration from GitHub..."
sudo git pull origin main

echo "Building and switching to latest generation..."
sudo nixos-rebuild switch

echo "✅ System updated successfully."
