# PowerShell profile file.
#
# Copy this file to `$PROFILE` path.

using namespace System.Management.Automation
using namespace System.Management.Automation.Language

if ($host.Name -eq 'ConsoleHost') {
    Import-Module PSReadLine
}

Import-Module -Name Terminal-Icons
oh-my-posh --init --shell pwsh --config $env:USERPROFILE\ohmyposhv3-v2.json | Invoke-Expression

# Searching for commands with up/down arrow is really handy.  The
# option "moves to end" is useful if you want the cursor at the end
# of the line while cycling through history like it does w/o searching,
# without that option, the cursor will remain at the position it was
# when you used up arrow, which can be useful if you forget the exact
# string you started the search on.
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# keep or reset to powershell default
Set-PSReadlineKeyHandler -Key Shift+Tab -Function TabCompletePrevious

# define Ctrl+Tab like default Tab behavior
Set-PSReadlineKeyHandler -Key Ctrl+Tab -Function TabCompleteNext

# make PowerShell tab completion work like Bash
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Window

# Setup PATHs

if (Test-Path -Path "$env:ProgramFiles\Vim\vim82") {
    $env:Path += ";$env:ProgramFiles\Vim\vim82"
}

# Setup virtualenvwrapper

# The variable WORKON_HOME tells virtualenvwrapper where to place
# your virtual environments. If the directory does not exist when
# virtualenvwrapper is loaded, it will be created automatically.
if ($null -eq $env:WORKON_HOME) {
    $env:WORKON_HOME = "$env:USERPROFILE\Envs"
}

# The variable PROJECT_HOME tells virtualenvwrapper where to place
# your project working directories.
if ($null -eq $env:PROJECT_HOME) {
    if (Test-Path -Path "$env:USERPROFILE\Work") {
        $env:PROJECT_HOME = "$env:USERPROFILE\Work"
    }
}
