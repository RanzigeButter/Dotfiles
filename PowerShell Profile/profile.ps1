#  ____                        ____  _          _ _   ____             __ _ _
# |  _ \ _____      _____ _ __/ ___|| |__   ___| | | |  _ \ _ __ ___  / _(_) | ___
# | |_) / _ \ \ /\ / / _ \ '__\___ \| '_ \ / _ \ | | | |_) | '__/ _ \| |_| | |/ _ \
# |  __/ (_) \ V  V /  __/ |   ___) | | | |  __/ | | |  __/| | | (_) |  _| | |  __/
# |_|   \___/ \_/\_/ \___|_|  |____/|_| |_|\___|_|_| |_|   |_|  \___/|_| |_|_|\___|

<#  ========================================================================
    # Settings
    ========================================================================  #>

<#  Remove other Settings
    ==================================================  #>

Remove-Item "HKCU:\Console\*" -Recurse -ErrorAction SilentlyContinue

<#  Colors
    ==================================================  #>

Set-ItemProperty -Path HKCU:\Console -Name ColorTable00 -Value 0x0018120f -ErrorAction SilentlyContinue # Black (Hex #0f1218 / RGB 15,18,24)
Set-ItemProperty -Path HKCU:\Console -Name ColorTable01 -Value 0x00b27900 -ErrorAction SilentlyContinue # DarkBlue (Hex #0079b2 / RGB 0,121,178)
Set-ItemProperty -Path HKCU:\Console -Name ColorTable02 -Value 0x000ea113 -ErrorAction SilentlyContinue # DarkGreen (Hex #13a10e / RGB 19,161,14)
Set-ItemProperty -Path HKCU:\Console -Name ColorTable03 -Value 0x008b8b00 -ErrorAction SilentlyContinue # DarkCyan (Hex #008b8b / RGB 0,139,139)
Set-ItemProperty -Path HKCU:\Console -Name ColorTable04 -Value 0x001f0fc5 -ErrorAction SilentlyContinue # DarkRed (Hex #c50f1f / RGB 197,15,31)
Set-ItemProperty -Path HKCU:\Console -Name ColorTable05 -Value 0x00981788 -ErrorAction SilentlyContinue # DarkMagenta (Hex #881798 / RGB 136,23,152)
Set-ItemProperty -Path HKCU:\Console -Name ColorTable06 -Value 0x00009cc1 -ErrorAction SilentlyContinue # DarkYellow (Hex #c19c00 / RGB 193,156,0)
Set-ItemProperty -Path HKCU:\Console -Name ColorTable07 -Value 0x00cccccc -ErrorAction SilentlyContinue # Gray (Hex #cccccc / RGB 204,204,204)
Set-ItemProperty -Path HKCU:\Console -Name ColorTable08 -Value 0x00767676 -ErrorAction SilentlyContinue # DarkGray (Hex #767676 / RGB 118,118,118)
Set-ItemProperty -Path HKCU:\Console -Name ColorTable09 -Value 0x00dd963a -ErrorAction SilentlyContinue # Blue (Hex #3a96dd / RGB 58,150,221)
Set-ItemProperty -Path HKCU:\Console -Name ColorTable10 -Value 0x005da33d -ErrorAction SilentlyContinue # Green (Hex #3da35d / RGB 61,163,93)
Set-ItemProperty -Path HKCU:\Console -Name ColorTable11 -Value 0x00d0c088 -ErrorAction SilentlyContinue # Cyan (Hex #88c0d0 / RGB 136,192,208)
Set-ItemProperty -Path HKCU:\Console -Name ColorTable12 -Value 0x005648e7 -ErrorAction SilentlyContinue # Red (Hex #e74856 / RGB 231,72,86)
Set-ItemProperty -Path HKCU:\Console -Name ColorTable13 -Value 0x009e00b4 -ErrorAction SilentlyContinue # Magenta (Hex #b4009e / RGB 180,0,158)
Set-ItemProperty -Path HKCU:\Console -Name ColorTable14 -Value 0x008bcbeb -ErrorAction SilentlyContinue # Yellow (Hex #ebcb8b / RGB 235,203,139)
Set-ItemProperty -Path HKCU:\Console -Name ColorTable15 -Value 0x00f8f8f8 -ErrorAction SilentlyContinue # White (Hex #f8f8f8 / RGB 248,248,248)

<#  Font
    ==================================================  #>

Set-ItemProperty -Path HKCU:\Console -Name FaceName -Value Consolas -ErrorAction SilentlyContinue # Font (Consolas)
Set-ItemProperty -Path HKCU:\Console -Name FontSize -Value 0x00120000 -ErrorAction SilentlyContinue # Font Size (18)
Set-ItemProperty -Path HKCU:\Console -Name FontWeight -Value 0x00000190 -ErrorAction SilentlyContinue # Font Weight (400)

<#  Miscellaneous
    ==================================================  #>

Set-ItemProperty -Path HKCU:\Console -Name WindowAlpha -Value 0x000000f4 -ErrorAction SilentlyContinue # Window Opacity (95%)
Set-ItemProperty -Path HKCU:\Console -Name LineWrap -Value 0x00000001 -ErrorAction SilentlyContinue # Break long lines into multiple rows (Yes)
Set-ItemProperty -Path HKCU:\Console -Name HistoryBufferSize -Value 0x00000032 -ErrorAction SilentlyContinue # History Buffer Size (50)
Set-ItemProperty -Path HKCU:\Console -Name NumberOfHistoryBuffers -Value 0x00000003 -ErrorAction SilentlyContinue # Number of History Buffers (3)
Set-ItemProperty -Path HKCU:\Console -Name HistoryNoDup -Value 0x00000001 -ErrorAction SilentlyContinue # Retain duplicate History Entries (No)
Set-ItemProperty -Path HKCU:\Console -Name QuickEdit -Value 0x00000001 -ErrorAction SilentlyContinue # Quick Edit (Yes)
Set-ItemProperty -Path HKCU:\Console -Name InsertMode -Value 0x00000001 -ErrorAction SilentlyContinue # Insert Mode (Yes)

<#  Window Title
    ==================================================  #>

# Check Administrator
Function Check_Administrator {
  $user = [Security.Principal.WindowsIdentity]::GetCurrent();
  (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

# Set Title
$Host.UI.RawUI.WindowTitle = "PowerShell - $ENV:USERNAME - Administrator: $((Check_Administrator)) - $((Get-Date).ToLongDateString())"

<#  User Interface
    ==================================================  #>

$Host.UI.RawUI.BufferSize = new-object System.Management.Automation.Host.Size(125, 3000)
$Host.UI.RawUI.WindowSize = new-object System.Management.Automation.Host.Size(125, 50)
$Host.UI.RawUI.CursorSize = "25"
$Host.UI.RawUI.ForegroundColor = "White"
$Host.UI.RawUI.BackgroundColor = "Black"
$Host.PrivateData.ErrorForegroundColor = "Red"
$Host.PrivateData.ErrorBackgroundColor = "Black"
$Host.PrivateData.WarningForegroundColor = "Yellow"
$Host.PrivateData.WarningBackgroundColor = "Black"
$Host.PrivateData.DebugForegroundColor = "Yellow"
$Host.PrivateData.DebugBackgroundColor = "Black"
$Host.PrivateData.VerboseForegroundColor = "Yellow"
$Host.PrivateData.VerboseBackgroundColor = "Black"
$Host.PrivateData.ProgressForegroundColor = "Yellow"
$Host.PrivateData.ProgressBackgroundColor = "Black"

<#  Promt
    ==================================================  #>

Function Prompt {
  $UserComputer = Write-Host "${env:USERNAME}@${env:COMPUTERNAME}" -NoNewline -ForegroundColor Green
  $Seperator = Write-Host ":" -NoNewline
  $Location = Write-Host "$(Get-Location)" -NoNewline -ForegroundColor Blue
  $UserComputer + $Seperator + $Location + "> "
}

<#  ========================================================================
    # Functions
    ========================================================================  #>

<#  General
    ==================================================  #>

# Clear PowerShell
Function C {
  Clear-Host
}

# Close PowerShell
Function X {
  exit
}

# Open new PowerShell Window
Function Open_PowerShell {
  Start-Process PowerShell
}

# Open new PowerShell Window as Admin
Function Open_PowerShell_Admin {
  Start-Process PowerShell -Verb RunAs
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

<#  Directory
    ==================================================  #>

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

# Change directory to Dropbox
Function Dir_Dropbox {
  Set-Location "F:\Dropbox"
}

# Change directory to Downloads
Function Dir_Downloads {
  Set-Location "F:\Downloads"
}

# Change directory to Homepage
Function Dir_Homepage {
  Set-Location "F:\Web\Projekte\Homepage"
}

# Prints the directory contents
Function Dir_Print {
  Get-ChildItem -Force -Name | Out-File "dir_content.csv"
}

<#  Git
    ==================================================  #>

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

# Push files to remote Repository
Function Git_Push([String]$Branch) {
  git push origin $Branch
}

# Pull files from remote Repository
Function Git_Pull([String]$Branch) {
  git pull origin $Branch
}

# Add remote Repository
Function Git_Remote([String]$URL) {
  git remote --verbose add origin $URL
}

# Clone Repository into directory
Function Git_Clone([String]$URL) {
  git clone $URL
}

<#  Node Package Manager (NPM)
    ==================================================  #>

# Install Package in dependencies
Function NPM_Install_Dependencies([String]$Package) {
  npm install --save-prod $Package
}

# Install Package in devDependencies
Function NPM_Install_DevDependencies([String]$Package) {
  npm install --save-dev $Package
}

# Outdated Packages
Function NPM_Outdated {
  npm outdated
}

# Update Packages
Function NPM_Update {
  npm update
}

# Audit Packages
Function NPM_Audit {
  npm audit fix
}

<#  Webpack
    ==================================================  #>

# Development
Function Webpack_Development {
  npm run dev
}

# Production
Function Webpack_Production {
  npm run prod
}

<#  SSH
    ==================================================  #>

# Generate SSH Key
Function SSH_GenerateKey([String]$EMail, [String]$Name) {
  ssh-keygen -t rsa -b 4096 -C "$EMail" -f "$HOME\.ssh\$Name"
}

# Add SSH Key
Function SSH_AddKey([String]$Name) {
  ssh-add "$HOME\.ssh\$Name"
}

# RaspberryPi 0 W
Function SSH_RasPi0 {
  ssh RasPi0 -l pi
}

<#  ========================================================================
    # Aliases
    ========================================================================  #>

<#  General
    ==================================================  #>

Set-Alias "OP" "Open_PowerShell"
Set-Alias "OPA" "Open_PowerShell_Admin"
Set-Alias "ST" "Shutdown_Timer"
Set-Alias "SA" "Shutdown_Abort"

<#  Directory
    ==================================================  #>

Set-Alias "DH" "Dir_Home"
Set-Alias "DDT" "Dir_Desktop"
Set-Alias "DDB" "Dir_Dropbox"
Set-Alias "DDL" "Dir_Downloads"
Set-Alias "DHP" "Dir_Homepage"
Set-Alias "DP" "Dir_Print"

<#  Git
    ==================================================  #>

Set-Alias "GAC" "Git_AddAndCommit"
Set-Alias "GACA" "Git_AddAndCommit_Amend"
Set-Alias "GSH" "Git_Push"
Set-Alias "GLL" "Git_Pull"
Set-Alias "GRE" "Git_Remote"
Set-Alias "GCL" "Git_Clone"

<#  Node Package Manager (NPM)
    ==================================================  #>

Set-Alias "ND" "NPM_Install_Dependencies"
Set-Alias "NDD" "NPM_Install_DevDependencies"
Set-Alias "NO" "NPM_Outdated"
Set-Alias "NU" "NPM_Update"
Set-Alias "NA" "NPM_Audit"

<#  Webpack
    ==================================================  #>

Set-Alias "WD" "Webpack_Development"
Set-Alias "WP" "Webpack_Production"

<#  SSH
    ==================================================  #>

Set-Alias "SSHG" "SSH_GenerateKey"
Set-Alias "SSHA" "SSH_AddKey"
Set-Alias "RPI0" "SSH_RasPi0"

<#  ========================================================================
    # Clear Host
    ========================================================================  #>

Clear-Host
