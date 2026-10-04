# Antigravity RTL - Uninstaller
Write-Host "Restoring Antigravity IDE backup stylesheets..." -ForegroundColor Cyan

$AppData = $env:LOCALAPPDATA
$IdeDir = Join-Path $AppData "Programs\Antigravity IDE\resources\app\out"

$CssTargets = @(
    (Join-Path $IdeDir "jetskiAgent\main.css"),
    (Join-Path $IdeDir "jetskiMain.tailwind.css"),
    (Join-Path $IdeDir "vs\workbench\workbench.desktop.main.css")
)

foreach ($target in $CssTargets) {
    $bak = $target + ".bak"
    if (Test-Path $bak) {
        Copy-Item -Path $bak -Destination $target -Force
        Write-Host "[✓] Restored: $target" -ForegroundColor Green
    }
}

Write-Host "Uninstallation completed. Please reload Antigravity IDE." -ForegroundColor Green
