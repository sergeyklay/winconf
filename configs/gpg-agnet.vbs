With CreateObject("Wscript.Shell")
    .Run """C:\Program Files (x86)\GnuPG\bin\gpg-connect-agent.exe"" /bye"
    .Run "C:\tools\wsl-ssh-pageant\wsl-ssh-pageant-amd64-gui.exe --force --wsl C:\tools\wsl-ssh-pageant\ssh-agent.sock --winssh ssh-pageant --systray"
End With
