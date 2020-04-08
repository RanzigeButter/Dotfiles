Write-Output ""
Write-Output "*** Setting up your computer! ***"
Write-Output ""
Write-Output ""

# PowerShell Profile
# ==============================================================================

Write-Output "Copying PowerShell profile..."
$psProfileFolder = "$HOME\Documents\WindowsPowerShell"
if (!(Test-Path $psProfileFolder)) {
  New-Item -Path $psProfileFolder -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
}
Copy-Item -force ".\powershell\profile.ps1" $psProfileFolder
Write-Output ""

# Terminal
# ==============================================================================



# VS Code
# ==============================================================================

if (Get-Command code -ErrorAction SilentlyContinue) {
  Invoke-Expression ".\vscode\vscode.ps1"
}
else {
  Write-Output "Please install VS Code."
  Write-Output ""
}
