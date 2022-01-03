# Windows 10/11 Setup Script.
# Run this script in PowerShell.

[CmdletBinding()]
param (
    [String[]]$Packages = @(
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
foreach ($package in $Packages) {
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

Write-Host "Installing PowerShell modules..."
Write-Host "------------------------------------" -ForegroundColor Green

Install-Module -Name Terminal-Icons -Repository PSGallery -Scope CurrentUser
Install-Module -Name PSReadLine -Repository PSGallery -Scope CurrentUser -RequiredVersion 2.2.0-beta4 -AllowPreRelease
Install-Module -Name z -Repository PSGallery -AllowClobber -Scope CurrentUser
