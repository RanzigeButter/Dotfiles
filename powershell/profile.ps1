#  ____                        ____  _          _ _   ____             __ _ _
# |  _ \ _____      _____ _ __/ ___|| |__   ___| | | |  _ \ _ __ ___  / _(_) | ___
# | |_) / _ \ \ /\ / / _ \ '__\___ \| '_ \ / _ \ | | | |_) | '__/ _ \| |_| | |/ _ \
# |  __/ (_) \ V  V /  __/ |   ___) | | | |  __/ | | |  __/| | | (_) |  _| | |  __/
# |_|   \___/ \_/\_/ \___|_|  |____/|_| |_|\___|_|_| |_|   |_|  \___/|_| |_|_|\___|


# Title
function checkAdmin {
  $user = [Security.Principal.WindowsIdentity]::GetCurrent();
  (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}
$Host.UI.RawUI.WindowTitle = "PowerShell - Admin: $(checkAdmin)"

# Promt
function global:prompt {
  "$(Write-Host "$(Split-Path -leaf -path (Get-Location))" -ForegroundColor Blue -NoNewline) $([char]0x276F) "
}

# ==============================================================================
# Commands
# ==============================================================================

Set-Alias "c" "Clear-Host"

function x {
  exit
}

function openPowerShellAdmin {
  Start-Process PowerShell -Verb RunAs
}
Set-Alias "opa" "openPowerShellAdmin"

function shutdownTimer([int]$timeInMinutes) {
  $timeInSeconds = $timeInMinutes * 60
  shutdown -s -t $timeInSeconds
  Write-Host "The Computer will shut down in $timeInMinutes minutes."
}
Set-Alias "sdt" "shutdownTimer"

function shutdownAbort {
  shutdown -a
}
Set-Alias "sda" "shutdownAbort"

Set-Alias "dns" "Resolve-DnsName"

function update {
  Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/RanzigeButter/dotfiles/master/update.ps1'))
}

# File System
# ==============================================================================

function touch([string]$file) {
  New-Item $file -ItemType File | Out-Null
}
Set-Alias "t" "touch"

function .. {
  Set-Location ".."
}
function ... {
  Set-Location "..\.."
}
function .... {
  Set-Location "..\..\.."
}
function ..... {
  Set-Location "..\..\..\.."
}
function ...... {
  Set-Location "..\..\..\..\.."
}

function dirDownloads {
  Set-Location "$HOME\Downloads"
}
Set-Alias "dl" "dirDownloads"

function dirDropbox {
  Set-Location "$HOME\Dropbox"
}
Set-Alias "box" "dirDropbox"

function dirPrint {
  Get-ChildItem -Force -Name -Exclude "dir_content.csv" | Out-File "dir_content.csv"
}
Set-Alias "dprint" "dirPrint"

# Visual Studio Code
# ==============================================================================

function vscodeNew {
  code -n .
}
Set-Alias "coden" "vscodeNew"

function vscodeReuse {
  code -r .
}
Set-Alias "coder" "vscodeReuse"

# Git
# ==============================================================================

function gitAddCommit([string]$message) {
  git add .
  git commit -m $message
}
Set-Alias "gac" "gitAddCommit"

function gitAddCommitAmend {
  git add .
  git commit --amend --no-edit
}
Set-Alias "gaca" "gitAddCommitAmend"

function gitPush([string]$branch) {
  git push origin $branch
}
Set-Alias "gsh" "gitPush"

function gitPull([string]$branch) {
  git pull --rebase origin $branch
}
Set-Alias "gll" "gitPull"

function gitClone([string]$repository) {
  git clone $repository
}
Set-Alias "gcl" "gitClone"

function gitLog {
  git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
}
Set-Alias "glog" "gitLog"

# Node Package Manager
# ==============================================================================

function npmInstallDependencies([string[]]$package) {
  npm install --save-prod $package
}
Set-Alias "nid" "npmInstallDependencies"

function npmInstallDevDependencies([string[]]$package) {
  npm install --save-dev $package
}
Set-Alias "nidd" "npmInstallDevDependencies"

function npmOutdated {
  npm outdated
}
Set-Alias "no" "npmOutdated"

function npmUpdate {
  npm update
}
Set-Alias "nu" "npmUpdate"

function npmAudit {
  npm audit fix
}
Set-Alias "na" "npmAudit"

function npmDevelopment {
  npm run dev
}
Set-Alias "nd" "npmDevelopment"

function npmProduction {
  npm run prod
}
Set-Alias "np" "npmProduction"

# SSH
# ==============================================================================

function sshGenerateKey([string]$email, [string]$name) {
  ssh-keygen -t rsa -b 4096 -C $email -f $HOME\.ssh\$name
}
Set-Alias "sshg" "sshGenerateKey"

function sshAddKey([string]$name) {
  ssh-add $HOME\.ssh\$name
}
Set-Alias "ssha" "sshAddKey"

function sshRanzigeButter {
  ssh ranzigebutter
}
Set-Alias "rb" "sshRanzigeButter"

# ==============================================================================
Clear-Host
# ==============================================================================
