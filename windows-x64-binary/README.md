# Opcode - Windows 64-bit Binary

This directory contains the Windows 64-bit builds of Opcode, a GUI application and toolkit for Claude Code.

## Files

- **opcode.exe** (13.4 MB) - Main GUI application
- **opcode-web.exe** (3.2 MB) - Web server mode for remote access  
- **WebView2Loader.dll** (159 KB) - Required WebView2 runtime library

## System Requirements

- Windows 10 or later (x64)
- WebView2 Runtime (usually pre-installed on modern Windows)

## Usage

### Desktop Application
Run `opcode.exe` to launch the desktop GUI application.

### Web Server Mode
Run `opcode-web.exe` to start the web server mode, which allows you to access Opcode from other devices on your network:
- Default port: 8080
- Access via: http://localhost:8080
- For remote access: http://YOUR_PC_IP:8080

## Build Information

- **Target**: x86_64-pc-windows-gnu
- **Build Type**: Release (optimized)
- **Version**: 0.2.1
- **Build Date**: 2025-11-19

## Dependencies

The application includes all necessary dependencies bundled, except for:
- WebView2 Runtime (Microsoft Edge WebView2)
- Windows system libraries (standard Windows installation)

## Troubleshooting

If you encounter issues:
1. Ensure WebView2 Runtime is installed
2. Run as Administrator if permission issues occur
3. Check Windows Event Viewer for detailed error logs

## Security

This binary is unsigned. Windows may show a security warning when running for the first time. Click "More info" and "Run anyway" to proceed.

For production use, consider building with code signing certificates.
