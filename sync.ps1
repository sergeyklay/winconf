Copy-Item -Path .\Microsoft.PowerShell_profile.ps1 -Destination $PROFILE.CurrentUserCurrentHost
Copy-Item -Path .\ohmyposhv3-v2.json -Destination $env:USERPROFILE\ohmyposhv3-v2.json
Copy-Item -Path .\WindowsTerminal.json -Destination $env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json

Copy-Item -Path .\gitconfig -Destination $env:USERPROFILE\.gitconfig
Copy-Item -Path .\global_gitignore -Destination $env:USERPROFILE\.gitignore
