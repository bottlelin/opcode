# GitHub Release Instructions for Windows x64 Binaries

## 📦 Release Artifacts Created

### ✅ Ready for Release
```
release/
├── opcode-gui-windows-x64-v0.2.1.zip    (6.6MB)
├── opcode-web-windows-x64-v0.2.1.zip    (1.3MB)
└── checksums.txt                        (SHA256 hashes)
```

### 📋 Package Contents

#### GUI Application Package (`opcode-gui-windows-x64-v0.2.1.zip`)
- `opcode.exe` - Main GUI application (13.4MB)
- `WebView2Loader.dll` - WebView2 dependency (159KB)
- `README.md` - Installation and usage instructions

#### Web Server Package (`opcode-web-windows-x64-v0.2.1.zip`)
- `opcode-web.exe` - Web server application (3.2MB)
- `README.md` - Installation and usage instructions

### 🔐 Checksums
```
344576ab9bb5a04ec66482a9f08f7e5cc400f11e315b88049c1d7563656d9f9a  opcode-gui-windows-x64-v0.2.1.zip
0a0beba12527ec7bea063f06521f2695c2890cd2b6b014ba40605d798462442b  opcode-web-windows-x64-v0.2.1.zip
```

## 🚀 Manual GitHub Release Steps

Since GitHub CLI requires authentication, you can create the release manually:

### Option 1: Using GitHub Web Interface
1. Go to your repository on GitHub
2. Click "Releases" → "Create a new release"
3. Tag version: `v0.2.1`
4. Release title: `Opcode v0.2.1 - Windows x64 Binaries`
5. Release notes (copy from below)
6. Upload the two ZIP files and checksums.txt
7. Click "Publish release"

### Option 2: Using GitHub CLI (requires authentication)
```bash
# Authenticate first
gh auth login

# Then run the script
cd /home/engine/project
./scripts/create-github-release.sh
```

## 📝 Release Notes Template

```
## Opcode v0.2.1 - Windows x64 Release

### 📦 Downloads

#### GUI Application
- **opcode-gui-windows-x64-v0.2.1.zip** (6.6MB)
  - Portable GUI application for Windows x64
  - Includes opcode.exe and WebView2Loader.dll
  - No installation required

#### Web Server
- **opcode-web-windows-x64-v0.2.1.zip** (1.3MB)  
  - Console web server for Windows x64
  - Run `opcode-web.exe` and access at http://localhost:8080
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
   - GUI: Double-click `opcode.exe`
   - Web Server: Run `opcode-web.exe` from command line

### 🔐 Verification

Checksums for verification:
```
344576ab9bb5a04ec66482a9f08f7e5cc400f11e315b88049c1d7563656d9f9a  opcode-gui-windows-x64-v0.2.1.zip
0a0beba12527ec7bea063f06521f2695c2890cd2b6b014ba40605d798462442b  opcode-web-windows-x64-v0.2.1.zip
```

### 📚 Documentation

- Full documentation available in the repository
- Issues and support via GitHub Issues

---
Built with ❤️ using Tauri + Rust
```

## 🎯 Build Summary

- **Build Environment**: Ubuntu Linux cross-compilation
- **Target**: Windows x64 (x86_64-pc-windows-gnu)
- **Toolchain**: MinGW-w64 + Rust cross-compilation
- **Build Type**: Release (optimized, stripped)
- **Version**: 0.2.1

## 📂 File Locations

All release artifacts are located in:
```
/home/engine/project/release/
```

The original binaries are located at:
```
/home/engine/project/src-tauri/target/x86_64-pc-windows-gnu/release/
├── opcode.exe           (13.4MB - GUI application)
├── opcode-web.exe       (3.2MB - Web server)
└── WebView2Loader.dll   (159KB - GUI dependency)
```