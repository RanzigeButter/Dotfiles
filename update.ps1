Write-Host -ForegroundColor Yellow @"

--------------------------------------------------

Updating dotfiles...

--------------------------------------------------

"@

# Preparations
# ==============================================================================

Write-Host "Preparing setup..." -NoNewline

# Download repository
$url = "https://github.com/RanzigeButter/dotfiles/archive/master.zip"
$dotfilesZip = "$env:USERPROFILE\Downloads\dotfiles.zip"
(New-Object System.Net.WebClient).DownloadFile($url, $dotfilesZip)

# Unpack & delete zip file
Expand-Archive $dotfilesZip "$env:USERPROFILE\Downloads" -Force
Remove-Item $dotfilesZip

# Set path
$dotfiles = "$env:USERPROFILE\Downloads\dotfiles-master"

Write-Host " Done"

# Update
# ==============================================================================

# PowerShell Profile
Write-Host "Updating PowerShell profile..." -NoNewline
Copy-Item "$dotfiles\powershell\profile.ps1" "$env:USERPROFILE\Documents\WindowsPowerShell"
Write-Host " Done"

# Windows Terminal
Write-Host "Updating Windows Terminal settings..." -NoNewline
$folderWT = Get-ChildItem "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_*" | Select-Object -First 1 -Expand FullName
Copy-Item "$dotfiles\terminal\settings.json" "$folderWT\LocalState"
Write-Host " Done"

# VS Code
Write-Host "Updating VS Code settings..." -NoNewline
Copy-Item "$dotfiles\vscode\settings.json" "$env:APPDATA\Code\User"
Write-Host " Done"

# SSH
Write-Host "Updating SSH config..." -NoNewline
Copy-Item "$dotfiles\ssh\config" "$env:USERPROFILE\.ssh"
Write-Host " Done"

# Git
Write-Host "Updating Git config..." -NoNewline
Copy-Item "$dotfiles\git\config" "$env:USERPROFILE\.config\git"
Write-Host " Done"

# Finalize
# ==============================================================================

Remove-Item $dotfiles -Recurse -Force
Write-Host -ForegroundColor Yellow @"

--------------------------------------------------

Congrats, you are now up to date!

--------------------------------------------------

"@
