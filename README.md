# winconf

All my configuration files for Windows that I port around from system
to system with me. The purpose of this project is to organize my
PowerShell scripts and configs and sync them between machines.

## Shell support

These configuration files are meant to be used with PowerShell >= 7.0,
but some scripts may work with bundled PowerShell interpreter.

## Prerequisites

- [PowerShell](https://github.com/PowerShell/PowerShell)
- [benpye/wsl-ssh-pageant](https://github.com/benpye/wsl-ssh-pageant)
- [Caskaydia Cove Nerd Font](https://www.nerdfonts.com/font-downloads)

## Install

Below are the commands you can run to get started.

To install apps run the following command in PowerShell as administrator:

```powershell
Invoke-Expression -Command ".\install.ps1"
```

To configure system run the following command in PowerShell as administrator:

```powershell
Invoke-Expression -Command ".\config.ps1"
```

**Note: Be sure to review the code before executing random scripts on the internet.**

## Repository Contents


### Configurations

These files are located in `configs/` directory.

- [Microsoft.PowerShell_profile.ps1](#microsoftpowershell_profileps1)
- [ohmyposhv3-v2.json](#ohmyposhv3-v2json)
- [WindowsTerminal.json](#windowsterminaljson)
- [gitconfig](#gitconfig)
- [global_gitignore](#global_gitignore)
- [gpg-agent.conf](#gpg-agentconf)
- [gpg-agnet.vbs](#gpg-agnetvbs)
- [gpg.conf](#gpgconf)
- [sshcontrol](#sshcontrol)
- [vimfiles](#vimfiles)

#### `Microsoft.PowerShell_profile.ps1`

[PowerShell](https://github.com/PowerShell/PowerShell) profile file to
customize you environment and to add session-specific elements to every
PowerShell session that you start.

Should be copied to `$PROFILE.CurrentUserCurrentHost`.

#### `ohmyposhv3-v2.json`

[Oh My Posh](https://ohmyposh.dev/) configuration file.

Should be copied to `$env:USERPROFILE\ohmyposhv3-v2.json`.

#### `WindowsTerminal.json`

[Windows Terminal](https://www.microsoft.com/en-us/p/windows-terminal/9n0dx20hk701)
settings JSON file.

Should be copied to `$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json`.

#### `gitconfig`

Global [git](https://git-scm.com/) config.

Should be copied to `$env:USERPROFILE\.gitconfig`.

#### `global_gitignore`

Global [git](https://git-scm.com/) [ignore file](https://git-scm.com/docs/gitignore).

Should be copied to `$env:USERPROFILE\.gitignore`.

#### `gpg-agent.conf`

[GnuPG Agent configuration](https://www.gnupg.org/(de)/documentation/manuals/gnupg/Agent-Configuration.html)
file read by gpg-agent on startup.

Should be copied to `$env:APPDATA\gnupg\gpg-agent.conf`.

#### `gpg-agnet.vbs`

By default the Gpg4Win does not work with OpenSSH out of the box. It works with Putty,
but if you want to use ssh command from your terminal, or use Visual Studio Code
remote connection, you must do this step.

This script start the GnuPG Agent on system startup and then starts
[benpye/wsl-ssh-pageant](https://github.com/benpye/wsl-ssh-pageant).


Should be copied to `$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\gpg-agnet.vbs`.

#### `gpg.conf`

[GnuPG configuration](https://www.gnupg.org/documentation/manuals/gnupg/GPG-Configuration.html)
file read by gpg on startup.

Should be copied to `$env:APPDATA\gnupg\gpg.conf`.

#### `sshcontrol`

List of allowed ssh keys. This file is used when support for the secure shell
GnuPG Agent protocol has been enabled. For more see
[GnuPG Agent Configuration page](https://www.gnupg.org/documentation/manuals/gnupg/Agent-Configuration.html).

Should be copied to `$env:APPDATA\gnupg\sshcontrol`

#### `vimfiles`

Local [Vim](https://www.vim.org/) configuration directory.

Should be copied to `$env:USERPROFILE\vimfiles`.
