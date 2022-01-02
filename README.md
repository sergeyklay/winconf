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
- [git](https://git-scm.com/)

## Getting Started

### Gpg4win

```powershell
winget install GnuPG.Gpg4win
```

### Windows Terminal

```poweshell
winget install Microsoft.WindowsTerminal
```

### Visual Studio Code

```powershell
winget install Microsoft.VisualStudioCode
```

## Reposutory Contents

- [Microsoft.PowerShell_profile.ps1](#microsoftpowershell_profileps1)
- [ohmyposhv3-v2.json](#ohmyposhv3-v2json)
- [WindowsTerminal.json](#windowsterminaljson)
- [gitconfig](#gitconfig)
- [global_gitignore](#global_gitignore)
- [gpg-agent.conf](#gpg-agentconf)
- [gpg.conf](#gpgconf)

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

### `gpg-agent.conf`

[GnuPG Agent configuration](https://www.gnupg.org/(de)/documentation/manuals/gnupg/Agent-Configuration.html)
file read by gpg-agent on startup.

Should be copied to `$env:APPDATA\gnupg\gpg-agent.conf`.

### `gpg.conf`

[GnuPG configuration](https://www.gnupg.org/documentation/manuals/gnupg/GPG-Configuration.html)
file read by gpg on startup.

Should be copied to `$env:APPDATA\gnupg\gpg.conf`.
