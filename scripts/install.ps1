# ==============================================================================
# Antigravity RTL - One-Click Installer for Windows
# ==============================================================================

[CmdletBinding()]
param (
    [string]$TargetWorkspace = "."
)

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "   Antigravity RTL - Installer for Google Antigravity IDE " -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host ""

$ResolvedPath = Resolve-Path $TargetWorkspace
Write-Host "[*] Target workspace: $ResolvedPath" -ForegroundColor Yellow

# 1. Create .agents/rules directory in target workspace
$RulesDir = Join-Path $ResolvedPath ".agents\rules"
if (-not (Test-Path $RulesDir)) {
    New-Item -ItemType Directory -Path $RulesDir -Force | Out-Null
    Write-Host "[+] Created directory: $RulesDir" -ForegroundColor Green
}

# 2. Copy persian-rtl.md
$SourceRule = Join-Path $PSScriptRoot "..\agent-rules\persian-rtl.md"
$DestRule = Join-Path $RulesDir "persian-rtl.md"

if (Test-Path $SourceRule) {
    Copy-Item -Path $SourceRule -Destination $DestRule -Force
    Write-Host "[+] Installed Agent Rule to: $DestRule" -ForegroundColor Green
}

# 3. Copy GEMINI.md template
$SourceGemini = Join-Path $PSScriptRoot "..\agent-rules\GEMINI.md"
$DestGemini = Join-Path $ResolvedPath "GEMINI.md"

if (Test-Path $SourceGemini) {
    if (-not (Test-Path $DestGemini)) {
        Copy-Item -Path $SourceGemini -Destination $DestGemini -Force
        Write-Host "[+] Installed GEMINI.md template to: $DestGemini" -ForegroundColor Green
    } else {
        Write-Host "[!] GEMINI.md already exists, skipping overwrite." -ForegroundColor Yellow
    }
}

# 4. Copy CSS snippet to clipboard if possible
$SnippetFile = Join-Path $PSScriptRoot "devtools-snippet.js"
if (Test-Path $SnippetFile) {
    $SnippetContent = Get-Content $SnippetFile -Raw
    try {
        Set-Clipboard -Value $SnippetContent
        Write-Host ""
        Write-Host "[+] The DevTools CSS snippet has been copied to your clipboard!" -ForegroundColor Magenta
        Write-Host "    In Antigravity IDE: Press Ctrl + Shift + I -> Console -> Paste & Press Enter." -ForegroundColor Cyan
    } catch {
        Write-Host "[*] Snippet available at: $SnippetFile" -ForegroundColor Gray
    }
}

Write-Host ""
Write-Host "[✓] Antigravity RTL successfully configured for this workspace!" -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Cyan
