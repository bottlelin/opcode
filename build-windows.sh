#!/bin/bash

# Build Windows 64-bit Binary for Opcode
# This script sets up the cross-compilation environment and builds the Windows binary

set -e

echo "🚀 Building Windows 64-bit Binary for Opcode..."

# Check if we're in the right directory
if [ ! -f "package.json" ] || [ ! -d "src-tauri" ]; then
    echo "❌ Error: Please run this script from the project root directory"
    exit 1
fi

# Install Rust if not present
if ! command -v rustc &> /dev/null; then
    echo "📦 Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
fi

# Add Windows target
echo "🎯 Adding Windows target..."
rustup target add x86_64-pc-windows-gnu

# Install MinGW-w64 if not present
if ! command -v x86_64-w64-mingw32-gcc &> /dev/null; then
    echo "🔧 Installing MinGW-w64..."
    sudo apt update
    sudo apt install -y mingw-w64
fi

# Install Bun if not present
if ! command -v bun &> /dev/null; then
    echo "🥟 Installing Bun..."
    curl -fsSL https://bun.sh/install | bash
    export PATH="$HOME/.bun/bin:$PATH"
fi

# Install dependencies
echo "📚 Installing dependencies..."
bun install

# Build frontend
echo "🏗️ Building frontend..."
bun run build

# Build Windows binary
echo "🔨 Building Windows binary..."
cd src-tauri
cargo build --target x86_64-pc-windows-gnu --release

# Create output directory
cd ..
mkdir -p windows-x64-binary

# Copy binaries
echo "📦 Copying binaries to output directory..."
cp src-tauri/target/x86_64-pc-windows-gnu/release/opcode.exe windows-x64-binary/
cp src-tauri/target/x86_64-pc-windows-gnu/release/opcode-web.exe windows-x64-binary/
cp src-tauri/target/x86_64-pc-windows-gnu/release/WebView2Loader.dll windows-x64-binary/

# Verify files
echo "✅ Build completed successfully!"
echo ""
echo "📁 Output files in windows-x64-binary/:"
ls -lh windows-x64-binary/

echo ""
echo "🎉 Windows 64-bit binary build complete!"
echo "📖 See windows-x64-binary/README.md for usage instructions."
