# ==============================================================================
# Antigravity RTL - Uninstaller
# ==============================================================================

[CmdletBinding()]
param (
    [string]$TargetWorkspace = "."
)

$ResolvedPath = Resolve-Path $TargetWorkspace
Write-Host "[*] Removing Antigravity RTL configurations from: $ResolvedPath" -ForegroundColor Yellow

$RuleFile = Join-Path $ResolvedPath ".agents\rules\persian-rtl.md"
if (Test-Path $RuleFile) {
    Remove-Item $RuleFile -Force
    Write-Host "[-] Removed: $RuleFile" -ForegroundColor Green
}

Write-Host "[✓] Uninstalled Antigravity RTL rules." -ForegroundColor Green
