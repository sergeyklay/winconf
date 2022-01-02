Write-Host "Installing common..."
Write-Host "------------------------------------" -ForegroundColor Green

$common_apps = @(
    "Telegram.TelegramDesktop")
foreach ($app in $common_apps) {
    winget install $app --silent
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
    winget install $app --silent
}


Write-Host "Installing GitHub.cli..."
Write-Host "------------------------------------" -ForegroundColor Green

winget install GitHub.cli  --source winget --silent
