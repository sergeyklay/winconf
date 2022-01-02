Write-Host "Installing common..."
Write-Host "------------------------------------" -ForegroundColor Green

$common_apps = @(
    "7zip.7zip",
    "DjVuLibre.DjView",
    "Telegram.TelegramDesktop")
foreach ($app in $common_apps) {
    winget install --exact --id $app
}

Write-Host "Installing dev essentials..."
Write-Host "------------------------------------" -ForegroundColor Green

$dev_essentials = @(
    "Docker.DockerDesktopEdge",
    "Microsoft.WindowsTerminal",
    "JanDeDobbeleer.OhMyPosh",
    "Microsoft.VisualStudioCode",
    "Git.Git",
    "GnuPG.Gpg4win",
    "Microsoft.dotnet",
    "Microsoft.dotNetFramework",
    "Microsoft.dotnetRuntime.6-x64")
foreach ($app in $dev_essentials) {
    winget install --exact --id $app
}


Write-Host "Installing GitHub.cli..."
Write-Host "------------------------------------" -ForegroundColor Green

winget install --exact --id GitHub.cli --source winget
