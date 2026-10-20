#!/bin/bash
set -e

DEST_DIR="/usr/share/backgrounds/macos"
PROP_DIR="/usr/share/gnome-background-properties"

echo "🖼️ Instalando colección de fondos de pantalla macOS para Pulsar OS..."
sudo mkdir -p "$DEST_DIR" "$PROP_DIR"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for img in "$SCRIPT_DIR"/*.png "$SCRIPT_DIR"/*.jpg; do
    if [ -f "$img" ]; then
        echo "  -> Copiando $(basename "$img")..."
        sudo cp -f "$img" "$DEST_DIR/"
    fi
done

if [ -f "$SCRIPT_DIR/pulsar-macos-wallpapers.xml" ]; then
    sudo cp -f "$SCRIPT_DIR/pulsar-macos-wallpapers.xml" "$PROP_DIR/"
fi

# Ensure read access for sddm and all users
sudo chmod -R 755 "$DEST_DIR"
sudo chmod 644 "$PROP_DIR/pulsar-macos-wallpapers.xml" 2>/dev/null || true

echo "✅ Colección de fondos de pantalla macOS instalada con éxito en $DEST_DIR."
