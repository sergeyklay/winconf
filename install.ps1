<#
.Synopsis
  Install Serghei's dotfiles.

.DESCRIPTION
  Used for one-line PC setup. Includes package installs, system setup, etc.

  Performs the following tasks, in order:
  1. Install and configure Chocolatey
  2. Install defined Chocolatey packages
  3. Install package to auto-update all Chocolately packages via Windows Scheduled Tasks
  4. Install PSDepend for package management
  5. Determine PowerShell modules to install and import
  6. Install and import modules based on list in #5

.PARAMETER ChocoPackages
 List of Chocolatey packages to install if missing
#>

# Windows 10/11 Setup Script.
# Run this script in PowerShell.

[CmdletBinding()]
param (
    [String[]]$ChocoPackages = @(
        'bonjour',
        'calibre',
        'curl',
        'SQLite',
        'totalcommander',
        'uninstalltool'
    )
)

# Package Management

Write-Host 'Configuring Chocolatey...' -ForegroundColor Magenta
if (-not (Get-Command -Name choco -ErrorAction SilentlyContinue)) {
    # Allow downloads
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force -Verbose

    # Install Chocolatey
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest 'https://chocolatey.org/install.ps1' -UseBasicParsing | Invoke-Expression -Verbose

    # Auto confirm package installations (no need to pass -y)
    choco feature enable -n allowGlobalConfirmation -y

    refreshenv
}

function Test-ChocolateyPackageInstalled {
  <#
  .LINK
    https://octopus.com/docs/runbooks/runbook-examples/routine/installing-software-chocolatey
  #>
  Param (
    [Parameter(Mandatory)]
    [string]$Package
  )

  Process {
    if (Test-Path -Path $env:ChocolateyInstall) {
      $packageInstalled = Test-Path -Path "$env:ChocolateyInstall\lib\$Package"
    } else {
      Write-Host "Can't find a chocolatey install directory..."
    }

    return $packageInstalled
  }
}

$missing_packages = [System.Collections.ArrayList]::new()
foreach ($package in $ChocoPackages) {
  if (-not (Test-ChocolateyPackageInstalled($package))) {
    $missing_packages.Add($package)
  }
}

if ($missing_packages) {
  & choco install $missing_packages
}

# Keep packages up to date
if (-not (Test-ChocolateyPackageInstalled('choco-upgrade-all-at'))) {
  & choco install choco-upgrade-all-at --params "'/WEEKLY:yes /DAY:SUN /TIME:01:00'" --force
}

# Add commonly used modules (this must be done first)

Install-Module PSDepend -Scope CurrentUser
Import-Module PSDepend

Write-Host 'Installing PowerShell modules...' -ForegroundColor Magenta
Invoke-PSDepend -Path "$PSScriptRoot\requirements.psd1" -Import -Force

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
    "Rufus.Rufus",
    "CPUID.CPU-Z")
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
