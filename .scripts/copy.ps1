<#  ========================================================================
    # Scripts - Copy
    ========================================================================  #>

# Fonts
# ==============================================================================

function installFont {
  param (
    [Parameter(Mandatory)]
    [string] $url,

    [Parameter(Mandatory)]
    [string] $filename
  )

  $folderZip = "$HOME\Downloads\$filename"

  # Download, unpack & delete zip file
  (New-Object System.Net.WebClient).DownloadFile($url, $folderZip)
  Expand-Archive $folderZip "$HOME\Downloads" -Force
  Remove-Item $folderZip

  $folder = $folderZip.TrimEnd(".zip")

  # Get files & install them
  $fonts = Get-ChildItem $folder -Include ("*.otf") -Recurse
  foreach ($font in $fonts) {
    Copy-Item $font "C:\Windows\Fonts"
    New-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" -Name $font.BaseName -Value $font.name -ea 0 | Out-Null
  }

  Remove-Item $folder -Recurse -Force
}

# Fira Code
Write-Host "Installing 'Fira Code' font..." -NoNewline
installFont "https://github.com/tonsky/FiraCode/archive/master.zip" "FiraCode-master.zip"
Write-Host " Done"

# PowerShell Profile
# ==============================================================================

Write-Host "Installing PowerShell profile..." -NoNewline
if (!(Test-Path "$HOME\Documents\WindowsPowerShell")) {
  New-Item "$HOME\Documents\WindowsPowerShell" -ItemType Directory -ea 0 | Out-Null
}
Copy-Item "$dotfiles\powershell\profile.ps1" "$HOME\Documents\WindowsPowerShell"
Write-Host " Done"

# Windows Terminal
# ==============================================================================

if (Test-Path "$HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_*") {
  Write-Host "Installing Windows Terminal settings..." -NoNewline
  Copy-Item "$dotfiles\terminal\settings.json" "$HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_*\LocalState"
  Write-Host " Done"
}

# VS Code
# ==============================================================================

if (Get-Command code -ea 0) {

  # Settings
  Write-Host "Installing VS Code settings..." -NoNewline
  Copy-Item "$dotfiles\vscode\settings.json" "$HOME\AppData\Roaming\Code\User"
  Write-Host " Done"

  # Extensions
  Write-Host "Installing VS Code extensions..."
  foreach ($extension in @(
      Get-Content "$dotfiles\vscode\extensions.md" |
      Where-Object { $_ -notmatch "^#" } |
      Where-Object { $_.trim() -ne "" } |
      ForEach-Object { $_.trimStart("- ") }
    )) {
    Write-Host ">>> $extension"
    code --install-extension $extension | Out-Null
  }

  # Custom icons
  Write-Host "Installing VS Code custom icons..." -NoNewline
  if (Test-Path "$HOME\AppData\Roaming\Code\User\vsicons-custom-icons") {
    Remove-Item "$HOME\AppData\Roaming\Code\User\vsicons-custom-icons" -Recurse -Force
  }
  Copy-Item "$dotfiles\vscode\vsicons-custom-icons" "$HOME\AppData\Roaming\Code\User" -Recurse
  Write-Host " Done"

}
