#  ____                        ____  _          _ _   ____             __ _ _
# |  _ \ _____      _____ _ __/ ___|| |__   ___| | | |  _ \ _ __ ___  / _(_) | ___
# | |_) / _ \ \ /\ / / _ \ '__\___ \| '_ \ / _ \ | | | |_) | '__/ _ \| |_| | |/ _ \
# |  __/ (_) \ V  V /  __/ |   ___) | | | |  __/ | | |  __/| | | (_) |  _| | |  __/
# |_|   \___/ \_/\_/ \___|_|  |____/|_| |_|\___|_|_| |_|   |_|  \___/|_| |_|_|\___|


# Environment
$env:EDITOR = "code"

# Promt
function global:prompt {
  $startbracket = Write-Host "[" -ForegroundColor Red -NoNewline
  $username = Write-Host $env:USERNAME -ForegroundColor Yellow -NoNewline
  $separator = Write-Host "@" -ForegroundColor Green -NoNewline
  $computername = Write-Host $env:COMPUTERNAME -ForegroundColor Blue -NoNewline
  $location = Write-Host " $(Split-Path -leaf -path (Get-Location))" -ForegroundColor Magenta -NoNewline
  $endbracket = Write-Host "]" -ForegroundColor Red -NoNewline

  "$startbracket$username$separator$computername$location$endbracket$([char]0x276F) "
}

# System & Programs
# ==============================================================================

function x { exit }
function sudo { Start-Process PowerShell -Verb RunAs }
function update { Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/RanzigeButter/dotfiles/master/update.ps1')) }
Set-Alias "e" "$env:EDITOR"
Set-Alias "dns" "Resolve-DnsName"

function Set-ShutdownTimer([int]$timeInMinutes) {
  $timeInSeconds = $timeInMinutes * 60
  shutdown -s -t $timeInSeconds
  Write-Host "The Computer will shut down in $timeInMinutes minutes."
}
Set-Alias "sst" "Set-ShutdownTimer"
function ast { shutdown -a }

# Directories/Files
# ==============================================================================

function touch([string[]]$file) { New-Item $file -ItemType File | Out-Null }
function mkd([string[]]$directory) { New-Item $directory -ItemType Directory | Out-Null }
function rmrf([string[]]$path) { Remove-Item -Recurse -Force $path }

# Navigation
# ==============================================================================

function .. { Set-Location ".." }
function ... { Set-Location "..\.." }
function .... { Set-Location "..\..\.." }
function ..... { Set-Location "..\..\..\.." }
function ...... { Set-Location "..\..\..\..\.." }
function dl { Set-Location "$env:USERPROFILE\Downloads" }
function db { Set-Location "$env:USERPROFILE\Dropbox" }
function p { Set-Location "$env:USERPROFILE\Projects" }

# SSH
# ==============================================================================

function New-SshKey([string]$email, [string]$name) {
  ssh-keygen -t rsa -b 4096 -C $email -f $env:USERPROFILE\.ssh\$name
}
Set-Alias "sshn" "New-SshKey"

function Add-SshKey([string]$name) {
  ssh-add $env:USERPROFILE\.ssh\$name
}
Set-Alias "ssha" "Add-SshKey"

# Git
# ==============================================================================

function gac([string]$message) { git add .; git commit -m $message }
function gaca { git add .; git commit --amend --no-edit }
function gsh([string]$branch) { git push origin $branch }
function gll([string]$branch) { git pull origin $branch }
function glog { git log --graph --pretty=format:'%C(red)%h%C(reset) -%C(yellow)%d%C(reset) %s %C(green)(%cr) %C(blue)<%an>%C(reset)' }

# Composer
# ==============================================================================

function fuckphp { Remove-Item -Recurse -Force vendor, composer.lock; composer clear-cache; composer update }

# npm
# ==============================================================================

function fuckjs { Remove-Item -Recurse -Force node_modules, package-lock.json; npm install }
function nid([string[]]$package) { npm install --save-prod $package }
function nidd([string[]]$package) { npm install --save-dev $package }
function no { npm outdated }
function nu { npm update }
function nd { npm run dev }
function np { npm run prod }

# ==============================================================================
Clear-Host
# ==============================================================================
