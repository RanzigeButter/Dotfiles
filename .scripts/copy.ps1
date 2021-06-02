<#  ========================================================================
    # Scripts - Copy
    ========================================================================  #>

# Fonts
# ==============================================================================

function installFont {
  param (
    [Parameter(Mandatory)]
    [string]$url,
    [Parameter(Mandatory)]
    [string]$filename
  )

  $folderZip = "$env:USERPROFILE\Downloads\$filename"

  # Download, unpack & delete zip file
  (New-Object System.Net.WebClient).DownloadFile($url, $folderZip)
  Expand-Archive $folderZip "$env:USERPROFILE\Downloads" -Force
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
if (!(Test-Path "$env:USERPROFILE\Documents\WindowsPowerShell")) {
  New-Item "$env:USERPROFILE\Documents\WindowsPowerShell" -ItemType Directory -ea 0 | Out-Null
}
Copy-Item "$dotfiles\powershell\profile.ps1" "$env:USERPROFILE\Documents\WindowsPowerShell"
Write-Host " Done"

# Windows Terminal
# ==============================================================================

$folderWT = Get-ChildItem "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_*" | Select-Object -First 1 -Expand FullName
if ($folderWT) {
  Write-Host "Installing Windows Terminal settings..." -NoNewline
  Copy-Item "$dotfiles\terminal\settings.json" "$folderWT\LocalState"
  Write-Host " Done"
}

# VS Code
# ==============================================================================

if (Get-Command code -ea 0) {
  # Settings
  Write-Host "Installing VS Code settings..." -NoNewline
  Copy-Item "$dotfiles\vscode\settings.json" "$env:APPDATA\Code\User"
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
}
