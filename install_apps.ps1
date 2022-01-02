Write-Host "Installing common..."

$common_apps = @(
    "Telegram.TelegramDesktop")
foreach ($app in $common_apps) {
    winget install $app --silent
}

Write-Host "Installing dev essentials..."

$dev_essentials = @(
    "Docker.DockerDesktopEdge",
    "Microsoft.WindowsTerminal",
    "Microsoft.VisualStudioCode",
    "Git.Git",
    "GnuPG.Gpg4win")
foreach ($app in $dev_essentials) {
    winget install $app --silent
}
