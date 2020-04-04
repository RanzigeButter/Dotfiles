#  ____                        ____  _          _ _   ____             __ _ _
# |  _ \ _____      _____ _ __/ ___|| |__   ___| | | |  _ \ _ __ ___  / _(_) | ___
# | |_) / _ \ \ /\ / / _ \ '__\___ \| '_ \ / _ \ | | | |_) | '__/ _ \| |_| | |/ _ \
# |  __/ (_) \ V  V /  __/ |   ___) | | | |  __/ | | |  __/| | | (_) |  _| | |  __/
# |_|   \___/ \_/\_/ \___|_|  |____/|_| |_|\___|_|_| |_|   |_|  \___/|_| |_|_|\___|

<#  ========================================================================
    # General
    ========================================================================  #>

<#  Title
    ========================================================================  #>

# Check Administrator
Function CheckAdministrator {
  $User = [Security.Principal.WindowsIdentity]::GetCurrent();
  (New-Object Security.Principal.WindowsPrincipal $User).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

# Set Title
$Host.UI.RawUI.WindowTitle = "PowerShell - Admin: $((CheckAdministrator))"

<#  Promt
    ========================================================================  #>

Function Prompt {
  $UserComputer = Write-Host "${env:UserName}@$(HostName)" -NoNewline -ForegroundColor Green
  $Separator = Write-Host " - " -NoNewline
  $CurrentLocation = Write-Host "$(Get-Location)" -NoNewline -ForegroundColor Blue
  $Ending = Write-Host ">" -NoNewline

  "$($UserComputer)$($Separator)$($CurrentLocation)$($Ending) "
}

<#  ========================================================================
    # Functions
    ========================================================================  #>

<#  General
    ========================================================================  #>

# Clear PowerShell
Function C {
  Clear-Host
}

# Close PowerShell
Function X {
  exit
}

# Open new PowerShell window
Function Open_PowerShell {
  Start-Process PowerShell
}

# Open new PowerShell window as admin
Function Open_PowerShell_Admin {
  Start-Process PowerShell -verb RunAs
}

# Shutdown with timer
Function Shutdown_Timer([Int]$TimeInMinutes) {
  $TimeInSeconds = $TimeInMinutes * 60
  shutdown -s -t $TimeInSeconds
  Write-Host "The Computer will shut down in $TimeInMinutes minutes."
}

# Abort Shutdown
Function Shutdown_Abort {
  shutdown -a
}

<#  File System
    ========================================================================  #>

# Create new empty file
Function Touch([String]$File) {
  New-Item -ItemType file $File
}

# One folder up
Function .. {
  Set-Location ".."
}

# Two folders up
Function ... {
  Set-Location "..\.."
}

# Three folders up
Function .... {
  Set-Location "..\..\.."
}

# Change directory to Home
Function Dir_Home {
  Set-Location "$HOME"
}

# Change directory to Desktop
Function Dir_Desktop {
  Set-Location "$HOME\Desktop"
}

# Change directory to Downloads
Function Dir_Downloads {
  Set-Location "$HOME\Downloads"
}

# Change directory to Dropbox
Function Dir_Dropbox {
  Set-Location "$HOME\Dropbox"
}

# Change directory to Projects
Function Dir_Projects {
  Set-Location "$HOME\Documents\Projects"
}

# Prints the directory contents
Function Dir_Print {
  Get-ChildItem -force -name -exclude "dir_content.csv" | Out-File "dir_content.csv"
}

<#  Visual Studio Code
    ========================================================================  #>

# Open current folder in a new VS Code window
Function VSCode_New {
  code -n .
}

# Open current folder in an already opened VS Code window
Function VSCode_Reuse {
  code -r .
}

# Compare two files with each other in a new VS Code window
Function VSCode_Compare([String]$FileOne, [String]$FileTwo) {
  code -n -d $FileOne $FileTwo
}

<#  Git
    ========================================================================  #>

# Add and commit files with message
Function Git_AddAndCommit([String]$Message) {
  git add .
  git commit -m $Message
}

# Amend to the last commit without editing the message
Function Git_AddAndCommit_Amend {
  git add .
  git commit --amend --no-edit
}

# Push files to remote repository
Function Git_Push([String]$Branch) {
  git push origin $Branch
}

# Pull files from remote repository
Function Git_Pull([String]$Branch) {
  git pull --rebase origin $Branch
}

# Clone repository into directory
Function Git_Clone([String]$Repository) {
  git clone $Repository
}

# Shows the commit history
Function Git_Log {
  git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
}

<#  Node Package Manager (NPM)
    ========================================================================  #>

# Install package in dependencies
Function NPM_Install_Dependencies([String]$Package) {
  npm install --save-prod $Package
}

# Install package in devDependencies
Function NPM_Install_DevDependencies([String]$Package) {
  npm install --save-dev $Package
}

# Delete "node_modules" folder, package-lock.json and reinstall all packages
Function NPM_Reset {
  Remove-Item -Recurse -Force node_modules/
  Remove-Item -Force package-lock.json
  npm install
}

# Outdated packages
Function NPM_Outdated {
  npm outdated
}

# Update packages
Function NPM_Update {
  npm update
}

# Audit packages
Function NPM_Audit {
  npm audit fix
}

# Run development script
Function NPM_Development {
  npm run dev
}

# Run production script
Function NPM_Production {
  npm run prod
}

<#  SSH
    ========================================================================  #>

# Generate SSH key
Function SSH_GenerateKey([String]$EMail, [String]$Name) {
  ssh-keygen -t rsa -b 4096 -C $EMail -f $HOME\.ssh\$Name
}

# Add SSH key
Function SSH_AddKey([String]$Name) {
  ssh-add $HOME\.ssh\$Name
}

# List all SSH keys
Function SSH_ListKeys {
  ssh-add -l
}

# Delete all SSH keys
Function SSH_DeleteKeys {
  ssh-add -D
}

# SSH to RanzigeButter
Function SSH_RanzigeButter {
  ssh ranzigebutter
}

<#  ========================================================================
    # Aliases
    ========================================================================  #>

<#  General
    ========================================================================  #>

Set-Alias "OP" "Open_PowerShell"
Set-Alias "OPA" "Open_PowerShell_Admin"
Set-Alias "ST" "Shutdown_Timer"
Set-Alias "SA" "Shutdown_Abort"

<#  File System
    ========================================================================  #>

Set-Alias "T" "Touch"
Set-Alias "DH" "Dir_Home"
Set-Alias "DD" "Dir_Desktop"
Set-Alias "DDL" "Dir_Downloads"
Set-Alias "DDB" "Dir_Dropbox"
Set-Alias "DP" "Dir_Projects"
Set-Alias "DPRINT" "Dir_Print"

<#  Visual Studio Code
    ========================================================================  #>

Set-Alias "CN" "VSCode_New"
Set-Alias "CR" "VSCode_Reuse"
Set-Alias "CC" "VSCode_Compare"

<#  Git
    ========================================================================  #>

Set-Alias "GAC" "Git_AddAndCommit"
Set-Alias "GACA" "Git_AddAndCommit_Amend"
Set-Alias "GSH" "Git_Push"
Set-Alias "GLL" "Git_Pull"
Set-Alias "GCL" "Git_Clone"
Set-Alias "GLOG" "Git_Log"

<#  Node Package Manager (NPM)
    ========================================================================  #>

Set-Alias "NID" "NPM_Install_Dependencies"
Set-Alias "NIDD" "NPM_Install_DevDependencies"
Set-Alias "NRESET" "NPM_Reset"
Set-Alias "NO" "NPM_Outdated"
Set-Alias "NU" "NPM_Update"
Set-Alias "NA" "NPM_Audit"
Set-Alias "ND" "NPM_Development"
Set-Alias "NP" "NPM_Production"

<#  SSH
    ========================================================================  #>

Set-Alias "SSHG" "SSH_GenerateKey"
Set-Alias "SSHA" "SSH_AddKey"
Set-Alias "SSHL" "SSH_ListKeys"
Set-Alias "SSHD" "SSH_DeleteKeys"
Set-Alias "RB" "SSH_RanzigeButter"

<#  ========================================================================
    # Clear Host
    ========================================================================  #>

Clear-Host
