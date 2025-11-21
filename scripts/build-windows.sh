#!/bin/bash
# Build Windows x64 binaries for Opcode

set -e

echo "🚀 Building Windows x64 binaries for Opcode..."

# Check if Windows target is installed
if ! rustup target list --installed | grep -q "x86_64-pc-windows-gnu"; then
    echo "📦 Installing Windows target..."
    rustup target add x86_64-pc-windows-gnu
fi

# Check if MinGW is installed
if ! command -v x86_64-w64-mingw32-gcc &> /dev/null; then
    echo "⚠️  MinGW not found. Installing..."
    sudo apt update
    sudo apt install -y mingw-w64
fi

# Build frontend
echo "🔨 Building frontend..."
npm run build

# Build Windows binaries
echo "🔨 Building Windows binaries..."
npm run tauri build -- --target x86_64-pc-windows-gnu

echo "✅ Build completed!"
echo ""
echo "📦 Binaries created:"
echo "  - GUI app: src-tauri/target/x86_64-pc-windows-gnu/release/opcode.exe"
echo "  - Web server: src-tauri/target/x86_64-pc-windows-gnu/release/opcode-web.exe"
echo ""
echo "💾 Binary sizes:"
ls -lh src-tauri/target/x86_64-pc-windows-gnu/release/opcode.exe
ls -lh src-tauri/target/x86_64-pc-windows-gnu/release/opcode-web.exe