Write-Host -ForegroundColor Yellow @"

          -------------------------------------------------------------

          Start updating dotfiles...

          -------------------------------------------------------------


"@

# Preparations
# ==============================================================================

Write-Host "Preparing setup..." -NoNewline

# Download repository
$url = "https://github.com/RanzigeButter/dotfiles/archive/master.zip"
$dotfilesZip = "$HOME\Downloads\dotfiles.zip"
(New-Object System.Net.WebClient).DownloadFile($url, $dotfilesZip)

# Unpack & delete zip file
Expand-Archive $dotfilesZip "$HOME\Downloads" -Force
Remove-Item $dotfilesZip

# Set path
$dotfiles = "$HOME\Downloads\dotfiles-master"

Write-Host " Done"

# Update
# ==============================================================================

# PowerShell Profile
Write-Host "Updating PowerShell profile..." -NoNewline
if (!(Test-Path "$HOME\Documents\WindowsPowerShell")) {
  New-Item "$HOME\Documents\WindowsPowerShell" -ItemType Directory -ea 0 | Out-Null
}
Copy-Item "$dotfiles\powershell\profile.ps1" "$HOME\Documents\WindowsPowerShell"
Write-Host " Done"

# Windows Terminal
$folderWT = Get-ChildItem "$HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_*" | Select-Object -First 1 -Expand FullName
if ($folderWT) {
  Write-Host "Updating Windows Terminal settings..." -NoNewline
  Copy-Item "$dotfiles\terminal\settings.json" "$folderWT\LocalState"
  Write-Host " Done"
}

# VS Code
if (Get-Command code -ea 0) {
  Write-Host "Updating VS Code settings..." -NoNewline
  Copy-Item "$dotfiles\vscode\settings.json" "$HOME\AppData\Roaming\Code\User"
  Write-Host " Done"

  Write-Host "Updating VS Code custom icons..." -NoNewline
  if (Test-Path "$HOME\AppData\Roaming\Code\User\vsicons-custom-icons") {
    Remove-Item "$HOME\AppData\Roaming\Code\User\vsicons-custom-icons" -Recurse -Force
  }
  Copy-Item "$dotfiles\vscode\vsicons-custom-icons" "$HOME\AppData\Roaming\Code\User" -Recurse
  Write-Host " Done"
}

# Finalize
# ==============================================================================

Remove-Item $dotfiles -Recurse -Force
Write-Host -ForegroundColor Yellow @"


          -------------------------------------------------------------

          Congrats, you are now up to date!

          -------------------------------------------------------------

"@
