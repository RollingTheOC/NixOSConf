#!/usr/bin/env bash
set -euo pipefail

# ------------------------
# NixOS Config Deployment
# ------------------------

CONFIG_DIR="/etc/nixos"

cd "$CONFIG_DIR"

# 1. Build NixOS to ensure configuration is valid
echo "Building NixOS generation..."
if sudo nixos-rebuild build; then
    echo "✅ Build succeeded."
else
    echo "❌ Build failed! Aborting deployment."
    exit 1
fi

# 2. Activate the new generation
echo "Switching to new generation..."
sudo nixos-rebuild switch

# 3. Git: Add any changes
sudo git add .

# 4. Git: Commit with timestamp + generation hash
GEN_HASH=$(nix-store --query --requisites /run/current-system | head -n1 | xargs basename)
COMMIT_MSG="Update NixOS config: $(date '+%Y-%m-%d %H:%M:%S') (gen: $GEN_HASH)"
sudo git commit -m "$COMMIT_MSG" || echo "No changes to commit."

# 5. Git: Push to GitHub
sudo git push origin main

echo "✅ NixOS configuration built, activated, and pushed successfully."
