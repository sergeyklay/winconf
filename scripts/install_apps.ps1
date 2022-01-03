# Windows 10/11 Setup Script.
# Run this script in PowerShell.

# Package Management
Write-Host 'Configuring Chocolatey...' -ForegroundColor Magenta
if (-not (Get-Command -Name choco2 -ErrorAction SilentlyContinue)) {
    # Allow downloads
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force -Verbose

    # Install Chocolatey
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest 'https://chocolatey.org/install.ps1' -UseBasicParsing | Invoke-Expression -Verbose

    # Auto confirm package installations (no need to pass -y)
    choco feature enable -n allowGlobalConfirmation -y

    refreshenv
}

Write-Host "Installing common..."
Write-Host "------------------------------------" -ForegroundColor Green

$common_apps = @(
    "7zip.7zip",
    "DjVuLibre.DjView",
    "Telegram.TelegramDesktop",
    "Zoom.Zoom",
    "SlackTechnologies.Slack",
    "VideoLAN.VLC",
    "clsid2.mpc-hc",
    "qBittorrent.qBittorrent",
    "Rufus.Rufus",
    "CPUID.CPU-Z")
foreach ($app in $common_apps) {
    winget install --exact --id $app
}

Write-Host "Installing terminal support..."
Write-Host "------------------------------------" -ForegroundColor Green
$terminal_apps = @(
    "Microsoft.WindowsTerminal",
    "JanDeDobbeleer.OhMyPosh")
foreach ($app in $terminal_apps) {
    winget install --exact --id $app
}

Write-Host "Installing dotnet support..."
Write-Host "------------------------------------" -ForegroundColor Green
$dotnet_apps = @(
    "Microsoft.dotnet",
    "Microsoft.dotNetFramework",
    "Microsoft.dotnetRuntime.6-x64")
foreach ($app in $dotnet_apps) {
    winget install --exact --id $app
}

Write-Host "Installing dev essentials..."
Write-Host "------------------------------------" -ForegroundColor Green

$dev_essentials = @(
    "Docker.DockerDesktopEdge",
    "Microsoft.VisualStudioCode",
    "vim.vim",
    "Git.Git",
    "GitHub.cli",
    "GnuPG.Gpg4win",
    "DBBrowserForSQLite.DBBrowserForSQLite")
foreach ($app in $dev_essentials) {
    winget install --exact --id $app
}

Write-Host "Installing languages..."
Write-Host "------------------------------------" -ForegroundColor Green

$languages = @(
    "Python.Python.3",
    "GoLang.Go")
foreach ($app in $languages) {
    winget install --exact --id $app
}

Write-Host "Installing PowerShell modules..."
Write-Host "------------------------------------" -ForegroundColor Green

Install-Module -Name Terminal-Icons -Repository PSGallery -Scope CurrentUser
Install-Module -Name PSReadLine -Repository PSGallery -Scope CurrentUser -RequiredVersion 2.2.0-beta4 -AllowPreRelease
Install-Module -Name z -Repository PSGallery -AllowClobber -Scope CurrentUser
