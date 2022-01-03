@{
    PSDependOptions = @{
      Target = 'CurrentUser'
      Import = $true
    }

    PowerShellGet = 'latest'

    PSReadLine = @{
      DependsOn = 'PowerShellGet'
      Parameters = @{
        AllowPrerelease = $true
      }
    }

    'Terminal-Icons' = @{
        DependsOn = 'PowerShellGet'
    }

    z = @{
        DependsOn = 'PowerShellGet'
        Parameters = @{
          AllowClobber = $true
        }
    }
}
