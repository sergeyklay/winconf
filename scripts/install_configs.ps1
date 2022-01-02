# Windows 10/11 Setup Script.
# Run this script in PowerShell.

$ProjectRoot = "${PSScriptRoot}\.." | Resolve-Path
$ConfigRoot = "${ProjectRoot}\configs"

Copy-Item -Path "${ConfigRoot}\Microsoft.PowerShell_profile.ps1" -Destination $PROFILE.CurrentUserCurrentHost
Copy-Item -Path "${ConfigRoot}\ohmyposhv3-v2.json" -Destination $env:USERPROFILE\ohmyposhv3-v2.json
Copy-Item -Path "${ConfigRoot}\WindowsTerminal.json" -Destination $env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json

Copy-Item -Path "${ConfigRoot}\gitconfig" -Destination $env:USERPROFILE\.gitconfig
Copy-Item -Path "${ConfigRoot}\global_gitignore" -Destination $env:USERPROFILE\.gitignore

New-Item -ItemType Directory -Force -Path $env:APPDATA\gnupg | Out-Null
Copy-Item -Path "${ConfigRoot}\gpg.conf" -Destination $env:APPDATA\gnupg\gpg.conf
Copy-Item -Path "${ConfigRoot}\gpg-agent.conf" -Destination $env:APPDATA\gnupg\gpg-agent.conf

New-Item -ItemType Directory -Force -Path "${env:USERPROFILE}\vimfiles" | Out-Null
Robocopy "${ConfigRoot}\vimfiles" "${env:USERPROFILE}\vimfiles" /Z /W:5 /E /NFL /NDL /NJH /NJS /NP /NS /NC
