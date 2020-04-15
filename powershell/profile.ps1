#  ____                        ____  _          _ _   ____             __ _ _
# |  _ \ _____      _____ _ __/ ___|| |__   ___| | | |  _ \ _ __ ___  / _(_) | ___
# | |_) / _ \ \ /\ / / _ \ '__\___ \| '_ \ / _ \ | | | |_) | '__/ _ \| |_| | |/ _ \
# |  __/ (_) \ V  V /  __/ |   ___) | | | |  __/ | | |  __/| | | (_) |  _| | |  __/
# |_|   \___/ \_/\_/ \___|_|  |____/|_| |_|\___|_|_| |_|   |_|  \___/|_| |_|_|\___|

<#  ========================================================================
    # Generic
    ========================================================================  #>

# Title
# ==============================================================================

# Check Administrator
function checkAdmin {
  $user = [Security.Principal.WindowsIdentity]::GetCurrent();
  (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

# Set Title
$Host.UI.RawUI.WindowTitle = "PowerShell - Admin: $((checkAdmin))"

# Promt
# ==============================================================================

function global:prompt {
  $location = Write-Host "$(Get-Location)" -ForegroundColor Blue -NoNewline
  $ending = [char]0x276F

  "$($location) $($ending) "
}

<#  ========================================================================
    # Commands
    ========================================================================  #>

# General
# ==============================================================================

# Clear PowerShell
Set-Alias "c" "Clear-Host"

# Close PowerShell
function x {
  exit
}

# Open new PowerShell
function openPowerShell {
  Start-Process PowerShell
}
Set-Alias "op" "openPowerShell"

# Open new PowerShell as admin
function openPowerShellAdmin {
  Start-Process PowerShell -Verb RunAs
}
Set-Alias "opa" "openPowerShellAdmin"

# File System
# ==============================================================================

# Create new file
function touch {
  param (
    [Parameter(Mandatory)]
    [string] $file
  )

  New-Item $file -ItemType File | Out-Null
}
Set-Alias "t" "touch"

# One folder up
function .. {
  Set-Location ".."
}

# Two folders up
function ... {
  Set-Location "..\.."
}

# Three folders up
function .... {
  Set-Location "..\..\.."
}

# Change directory to Home
function dirHome {
  Set-Location "$HOME"
}
Set-Alias "~" "dirHome"

# Change directory to Desktop
function dirDesktop {
  Set-Location "$HOME\Desktop"
}
Set-Alias "dd" "dirDesktop"

# Change directory to Downloads
function dirDownloads {
  Set-Location "$HOME\Downloads"
}
Set-Alias "ddl" "dirDownloads"

# Change directory to Dropbox
function dirDropbox {
  Set-Location "$HOME\Dropbox"
}
Set-Alias "ddb" "dirDropbox"

# Prints the directory contents
function dirPrint {
  Get-ChildItem -Force -Name -Exclude "dir_content.csv" | Out-File "dir_content.csv"
}
Set-Alias "dprint" "dirPrint"

# Visual Studio Code
# ==============================================================================

# Open current folder in a new VS Code window
function vscodeNew {
  code -n .
}
Set-Alias "cn" "vscodeNew"

# Open current folder in an already opened VS Code window
function vscodeReuse {
  code -r .
}
Set-Alias "cr" "vscodeReuse"

# Git
# ==============================================================================

# Add and commit files with message
function gitAddCommit([String]$message) {
  git add .
  git commit -m $message
}
Set-Alias "gac" "gitAddCommit"

# Amend to the last commit without editing the message
function gitAddCommitAmend {
  git add .
  git commit --amend --no-edit
}
Set-Alias "gaca" "gitAddCommitAmend"

# Push files to remote repository
function gitPush([String]$branch) {
  git push origin $branch
}
Set-Alias "gsh" "gitPush"

# Pull files from remote repository
function gitPull([String]$branch) {
  git pull --rebase origin $branch
}
Set-Alias "gll" "gitPull"

# Clone repository into directory
function gitClone([String]$repository) {
  git clone $repository
}
Set-Alias "gcl" "gitClone"

# Shows the commit history
function gitLog {
  git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
}
Set-Alias "glog" "gitLog"

# Node Package Manager (NPM)
# ==============================================================================

# Install package in dependencies
function npmInstallDependencies([String]$package) {
  npm install --save-prod $package
}
Set-Alias "nid" "npmInstallDependencies"

# Install package in devDependencies
function npmInstallDevDependencies([String]$package) {
  npm install --save-dev $package
}
Set-Alias "nidd" "npmInstallDevDependencies"

# Delete "node_modules", "package-lock.json" and reinstall all packages
function npmReset {
  Remove-Item node_modules/ -Recurse -Force
  Remove-Item package-lock.json -Force
  npm install
}
Set-Alias "nreset" "npmReset"

# Outdated packages
function npmOutdated {
  npm outdated
}
Set-Alias "no" "npmOutdated"

# Update packages
function npmUpdate {
  npm update
}
Set-Alias "nu" "npmUpdate"

# Audit packages
function npmAudit {
  npm audit fix
}
Set-Alias "na" "npmAudit"

# Run development script
function npmDevelopment {
  npm run dev
}
Set-Alias "nd" "npmDevelopment"

# Run production script
function npmProduction {
  npm run prod
}
Set-Alias "np" "npmProduction"

# SSH
# ==============================================================================

# Generate SSH key
function sshGenerateKey([String]$email, [String]$name) {
  ssh-keygen -t rsa -b 4096 -C $email -f $HOME\.ssh\$name
}
Set-Alias "sshg" "sshGenerateKey"

# Add SSH key
function sshAddKey([String]$name) {
  ssh-add $HOME\.ssh\$name
}
Set-Alias "ssha" "sshAddKey"

# List all SSH keys
function sshListKeys {
  ssh-add -l
}
Set-Alias "sshl" "sshListKeys"

# Delete all SSH keys
function sshDeleteKeys {
  ssh-add -D
}
Set-Alias "sshd" "sshDeleteKeys"

# SSH to RanzigeButter
function sshRanzigeButter {
  ssh ranzigebutter
}
Set-Alias "rb" "sshRanzigeButter"

# Miscellaneous
# ==============================================================================

# Shutdown timer
function shutdownTimer {
  param (
    [Parameter(Mandatory)]
    [Int] $timeInMinutes
  )

  $timeInSeconds = $timeInMinutes * 60
  shutdown -s -t $timeInSeconds
  Write-Host "The Computer will shut down in $timeInMinutes minutes."
}
Set-Alias "st" "shutdownTimer"

# Shutdown abort
function shutdownAbort {
  shutdown -a
}
Set-Alias "sa" "shutdownAbort"

# Print unicode
function printUnicode {
  param (
    [Parameter(Mandatory)]
    [String] $unicode
  )

  $unicodeStripped = $unicode -replace 'U\+', ''
  $unicodeInt = [System.Convert]::toInt32($unicodeStripped, 16)
  [System.Char]::ConvertFromUtf32($unicodeInt)
}
Set-Alias "pu" "printUnicode"

<#  ========================================================================
    # Clear Host
    ========================================================================  #>

Clear-Host
