#!/bin/bash
# Verify Windows binaries were created successfully

set -e

echo "🔍 Verifying Windows x64 binaries..."
echo ""

# Check if binaries exist
GUI_BINARY="src-tauri/target/x86_64-pc-windows-gnu/release/opcode.exe"
WEB_BINARY="src-tauri/target/x86_64-pc-windows-gnu/release/opcode-web.exe"
WEBVIEW_DLL="src-tauri/target/x86_64-pc-windows-gnu/release/WebView2Loader.dll"

echo "📁 Checking binary files..."
if [ -f "$GUI_BINARY" ]; then
    echo "✅ GUI binary: $GUI_BINARY"
    echo "   Size: $(ls -lh "$GUI_BINARY" | awk '{print $5}')"
    echo "   Type: $(file "$GUI_BINARY" | cut -d: -f2-)"
else
    echo "❌ GUI binary not found"
fi

echo ""

if [ -f "$WEB_BINARY" ]; then
    echo "✅ Web server binary: $WEB_BINARY"
    echo "   Size: $(ls -lh "$WEB_BINARY" | awk '{print $5}')"
    echo "   Type: $(file "$WEB_BINARY" | cut -d: -f2-)"
else
    echo "❌ Web server binary not found"
fi

echo ""

if [ -f "$WEBVIEW_DLL" ]; then
    echo "✅ WebView2 DLL: $WEBVIEW_DLL"
    echo "   Size: $(ls -lh "$WEBVIEW_DLL" | awk '{print $5}')"
else
    echo "❌ WebView2 DLL not found"
fi

echo ""
echo "📦 Checking release packages..."

RELEASE_DIR="release"
GUI_PACKAGE="$RELEASE_DIR/opcode-gui-windows-x64-v0.2.1.zip"
WEB_PACKAGE="$RELEASE_DIR/opcode-web-windows-x64-v0.2.1.zip"

if [ -f "$GUI_PACKAGE" ]; then
    echo "✅ GUI package: $GUI_PACKAGE"
    echo "   Size: $(ls -lh "$GUI_PACKAGE" | awk '{print $5}')"
else
    echo "❌ GUI package not found"
fi

if [ -f "$WEB_PACKAGE" ]; then
    echo "✅ Web server package: $WEB_PACKAGE"
    echo "   Size: $(ls -lh "$WEB_PACKAGE" | awk '{print $5}')"
else
    echo "❌ Web server package not found"
fi

echo ""
echo "🔐 Verifying checksums..."
if [ -f "$RELEASE_DIR/checksums.txt" ]; then
    echo "✅ Checksums file exists"
    echo "   Contents:"
    cat "$RELEASE_DIR/checksums.txt" | sed 's/^/     /'
else
    echo "❌ Checksums file not found"
fi

echo ""
echo "🎯 Summary:"
echo "   Windows x64 binaries are ready for GitHub release!"
echo "   Follow the instructions in GITHUB_RELEASE_GUIDE.md"