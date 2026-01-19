#!/usr/bin/env bash
set -euo pipefail

CONFIG_DIR="/etc/nixos"
cd "$CONFIG_DIR"

# Check if there are changes
CHANGES=$(sudo git status --porcelain)
if [ -z "$CHANGES" ]; then
    echo "No changes to deploy. Skipping build and commit."
    exit 0
fi

# Add changes
sudo git add .

# Prepare short summary
FILES_CHANGED=$(sudo git diff --cached --name-only | tr '\n' ',' | sed 's/,$//')

# Build and switch
echo "Building and switching NixOS generation..."
sudo nixos-rebuild switch

# Commit
GEN_HASH=$(nix-store --query --requisites /run/current-system | head -n1 | xargs basename)
COMMIT_MSG="Update NixOS config: $(date '+%Y-%m-%d %H:%M:%S') (gen: $GEN_HASH) | Changed: $FILES_CHANGED"
sudo git commit -m "$COMMIT_MSG"

# Push
sudo git push origin main

echo "✅ NixOS configuration built, activated, and pushed successfully."
