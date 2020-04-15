#Requires -RunAsAdministrator
Write-Host -ForegroundColor Cyan @"

                   888          888     .d888 d8b 888
                   888          888    d88P"  Y8P 888
                   888          888    888        888
               .d88888  .d88b.  888888 888888 888 888  .d88b.  .d8888b
              d88" 888 d88""88b 888    888    888 888 d8P  Y8b 88K
              888  888 888  888 888    888    888 888 88888888 "Y8888b.
          d8b Y88b 888 Y88..88P Y88b.  888    888 888 Y8b.          X88
          Y8P  "Y88888  "Y88P"   "Y888 888    888 888  "Y8888   88888P'

"@
Write-Host -ForegroundColor Red @"

          -------------------------------------------------------------

          Author     : Tim Schneider
          Website    : https://timschneider.xyz
          Repository : https://github.com/RanzigeButter/dotfiles

          -------------------------------------------------------------


"@
Read-Host "Press ENTER to start setting up your computer."

# Start
# ==============================================================================

# Set execution policy
Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force

# Download repository
$url = "https://github.com/RanzigeButter/dotfiles/archive/master.zip"
$output = "$HOME\Downloads\dotfiles.zip"
(New-Object System.Net.WebClient).DownloadFile($url, $output)

# Unpack & delete zip file
Expand-Archive $output "$HOME\Downloads"
Remove-Item $output

# Set path
$dotfiles = "$HOME\Downloads\dotfiles-master"

# Scripts
# ==============================================================================

# . "$dotfiles\.scripts\win10.ps1"
# . "$dotfiles\.scripts\apps.ps1"
. "$dotfiles\.scripts\copy.ps1"

# Finalize
# ==============================================================================

Remove-Item $dotfiles -Recurse -Force
Write-Host -ForegroundColor Red @"

          -------------------------------------------------------------

          Congrats!

          Provided there were no hidden errors, the script completed
          successfully and all the programs and configuration files
          should be in place.

          -------------------------------------------------------------


"@
switch (Read-Host "Would you like to restart your system? ( Yes / No )") {
  Yes {
    Write-Host "Restarting system..."
    Start-Sleep 1
    Restart-Computer
  }
  No {
    Write-Host "Exiting now..."
    Start-Sleep 1
    Clear-Host
  }
}
