# Antigravity RTL - One-Click Installer for Windows
[CmdletBinding()]
param (
    [string]$TargetWorkspace = ""
)

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$PyInstaller = Join-Path $ScriptDir "install-permanent.py"

if (Get-Command python -ErrorAction SilentlyContinue) {
    python $PyInstaller
} else {
    Write-Host "[!] Python not found in PATH, running direct copy..." -ForegroundColor Yellow
}

if ($TargetWorkspace -and (Test-Path $TargetWorkspace)) {
    $TargetRules = Join-Path $TargetWorkspace ".agents\rules"
    New-Item -ItemType Directory -Path $TargetRules -Force | Out-Null
    Copy-Item -Path (Join-Path $ScriptDir "..\agent-rules\persian-rtl.md") -Destination (Join-Path $TargetRules "persian-rtl.md") -Force
    Write-Host "[✓] Workspace rule copied to $TargetRules" -ForegroundColor Green
}
