# Voraussetzung (einmalig): gh auth login -h github.com -p https -w

$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

$repoName = "clean-food-challenge"
$owner = "AepliMicha"

try {
    gh auth status 2>$null | Out-Null
    if ($LASTEXITCODE -ne 0) { throw "not logged in" }
} catch {
    Write-Host ""
    Write-Host "Bitte zuerst bei GitHub anmelden:" -ForegroundColor Yellow
    Write-Host "  gh auth login -h github.com -p https -w" -ForegroundColor Cyan
    Write-Host ""
    exit 1
}

$repoExists = $false
try {
    gh repo view "$owner/$repoName" 2>$null | Out-Null
    if ($LASTEXITCODE -eq 0) { $repoExists = $true }
} catch {}

if (-not $repoExists) {
    Write-Host "Erstelle GitHub-Repo $owner/$repoName ..."
    if (git remote get-url origin 2>$null) {
        git remote remove origin
    }
    gh repo create $repoName --public --source=. --remote=origin --description "Clean Food Challenge - Ernährungs- und Kraft-Tracker"
} elseif (-not (git remote get-url origin 2>$null)) {
    git remote add origin "https://github.com/$owner/$repoName.git"
}

Write-Host "Pushe nach GitHub ..."
git push -u origin main

Write-Host "Aktiviere GitHub Pages ..."
gh api "repos/$owner/$repoName/pages" -X POST -f "build_type=legacy" -f "source[branch]=main" -f "source[path]=/" 2>$null

Write-Host ""
Write-Host "Fertig!" -ForegroundColor Green
Write-Host "  Repo:  https://github.com/$owner/$repoName"
Write-Host "  App:   https://$($owner.ToLower()).github.io/$repoName/"
Write-Host "  (Pages kann 1-2 Minuten brauchen)"