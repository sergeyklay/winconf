# winconf

All my configuration files for Windows that I port around from system
to system with me. The purpose of this project is to organize my
PowerShell scripts and configs and sync them between machines.

## Shell support

These configuration files are meant to be used with PowerShell >= 7.0,
but some scripts may work with bundled PowerShell interpreter.

## Prerequisites

- [oh-my-posh](https://ohmyposh.dev/)
- [PowerShell](https://github.com/PowerShell/PowerShell)
- [Windows Terminal](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701)
- [git](https://git-scm.com/)

## Reposutory Contents

- [Microsoft.PowerShell_profile.ps1](#microsoftpowershell_profileps1)
- [ohmyposhv3-v2.json](#ohmyposhv3-v2json)
- [WindowsTerminal.json](#windowsterminaljson)
- [gitconfig](#gitconfig)
- [global_gitignore](#global_gitignore)

### `Microsoft.PowerShell_profile.ps1`

[PowerShell](https://github.com/PowerShell/PowerShell) profile file to
customize you environment and to add session-specific elements to every
PowerShell session that you start.

Should be copied to `$PROFILE.CurrentUserCurrentHost`.

### `ohmyposhv3-v2.json`

[Oh My Posh](https://ohmyposh.dev/) configuration file.

Should be copied to `$env:USERPROFILE\ohmyposhv3-v2.json`.

### `WindowsTerminal.json`

[Windows Terminal](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701)
settings JSON file.

Should be copied to `$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json`.

### `gitconfig`

Global [git](https://git-scm.com/) config.

Should be copied to `$env:USERPROFILE\.gitconfig`.

### `global_gitignore`

Global [git](https://git-scm.com/) [ignore file](https://git-scm.com/docs/gitignore).

Should be copied to `$env:USERPROFILE\.gitignore`.
