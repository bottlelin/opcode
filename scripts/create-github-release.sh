#!/bin/bash
# Create GitHub Release for Windows x64 Binaries

set -e

VERSION="v0.2.1"
REPO_NAME="opcode"  # Change this to your actual repo name

echo "🚀 Creating GitHub release for $VERSION..."

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI (gh) not found. Please install it first:"
    echo "   sudo apt install gh"
    echo "   Then authenticate: gh auth login"
    exit 1
fi

# Check if authenticated
if ! gh auth status &> /dev/null; then
    echo "❌ Not authenticated with GitHub. Run 'gh auth login' first."
    exit 1
fi

# Create release
echo "📝 Creating release..."
gh release create "$VERSION" \
    --title "Opcode $VERSION - Windows x64 Binaries" \
    --notes "## Opcode $VERSION - Windows x64 Release

### 📦 Downloads

#### GUI Application
- **opcode-gui-windows-x64-v0.2.1.zip** (6.6MB)
  - Portable GUI application for Windows x64
  - Includes opcode.exe and WebView2Loader.dll
  - No installation required

#### Web Server
- **opcode-web-windows-x64-v0.2.1.zip** (1.3MB)  
  - Console web server for Windows x64
  - Run \`opcode-web.exe\` and access at http://localhost:8080
  - Perfect for remote access and mobile devices

### ✨ What's New

- Cross-compiled Windows x64 binaries from Linux
- Optimized release builds with full stripping
- Includes all necessary dependencies
- Portable applications - no installation required

### 🔧 System Requirements

- Windows 10/11 (x64)
- WebView2 Runtime (for GUI app, usually pre-installed)
- Network access (for web server remote access)

### 📋 Installation

1. Download the appropriate ZIP file
2. Extract to a folder of your choice
3. Run the executable:
   - GUI: Double-click \`opcode.exe\`
   - Web Server: Run \`opcode-web.exe\` from command line

### 🔐 Verification

Checksums for verification:
\`\`\`
$(cat checksums.txt)
\`\`\`

### 📚 Documentation

- Full documentation available in the repository
- Issues and support via GitHub Issues

---
Built with ❤️ using Tauri + Rust" \
    opcode-gui-windows-x64-v0.2.1.zip \
    opcode-web-windows-x64-v0.2.1.zip \
    checksums.txt

echo "✅ Release created successfully!"
echo "🌐 View release at: https://github.com/$(gh api user --jq '.login')/$REPO_NAME/releases/tag/$VERSION"