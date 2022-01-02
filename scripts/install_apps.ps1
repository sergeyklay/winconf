# Windows 10/11 Setup Script.
# Run this script in PowerShell.

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
    "Rufus.Rufus")
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
