# Einmalig: gh auth login -h github.com -p https -w
# Danach dieses Skript ausführen.

$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

gh auth status | Out-Null

if (-not (git remote get-url origin 2>$null)) {
    gh repo create clean-food-challenge --public --source=. --remote=origin --description "Clean Food Challenge - Ernährungs- und Kraft-Tracker"
}

git push -u origin main
gh api repos/AepliMicha/clean-food-challenge/pages -X POST -f "build_type=legacy" -f "source[branch]=main" -f "source[path]=/" 2>$null
Write-Host ""
Write-Host "Fertig: https://github.com/AepliMicha/clean-food-challenge"
Write-Host "App (Pages): https://aeplimicha.github.io/clean-food-challenge/"