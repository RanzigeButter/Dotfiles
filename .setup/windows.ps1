<#  ========================================================================
    # Setup - Windows
    ========================================================================  #>

# System
# ==============================================================================

function setupSystem {
  # Disable Telemetry
  Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name Enabled -Value 0
  Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name AllowTelemetry -Value 0

  # Disable Feedback Experience
  $pathFeedbackExperience = "HKCU:\SOFTWARE\Microsoft\Siuf\Rules"
  if (!(Test-Path $pathFeedbackExperience)) {
    New-Item $pathFeedbackExperience -ItemType Directory -Force -ea 0 | Out-Null
  }
  New-ItemProperty $pathFeedbackExperience -Name NumberOfSIUFInPeriod -Value 0 -ea 0 | Out-Null

  # Disable Defender Telemetry
  Set-MpPreference -MAPSReporting Disabled
  Set-MpPreference -SubmitSamplesConsent NeverSend

  # Disable Services
  foreach ($service in @(
      "*diagnosticshub.standardcollector.service*"
      "*DiagTrack*"
      "*dmwappushsvc*"
      "*lfsvc*"
      "*RetailDemo*"
      "*WbioSrvc*"
      "*xbgm*"
      "*XblAuthManager*"
      "*XblGameSave*"
      "*XboxNetApiSvc*"
    )) {
    Get-Service -Name $service | Set-Service -StartupType Disabled -ea 0 | Out-Null
  }

  # Disable Tasks
  foreach ($task in @(
      "*Consolidator*"
      "*UsbCeip*"
      "*XblGameSaveTask*"
      "*XblGameSaveTaskLogon*"
    )) {
    Get-ScheduledTask -TaskName $task | Disable-ScheduledTask -ea 0 | Out-Null
  }

  # Disable Lock Screen
  $pathLockScreen = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
  if (!(Test-Path $pathLockScreen)) {
    New-Item $pathLockScreen -ItemType Directory -Force -ea 0 | Out-Null
  }
  New-ItemProperty $pathLockScreen -Name NoLockScreen -Value 1 -ea 0 | Out-Null

  # Enable Dark Mode
  Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name AppsUseLightTheme -Value 0

  # Remove '3D Objects' folder
  foreach ($path3DObjects in @(
      "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"
      "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"
    )) {
    Remove-Item $path3DObjects -Recurse -ea 0
  }

  # Disable Edge shortcut creation
  New-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name DisableEdgeDesktopShortcutCreation -Value 1 -ea 0 | Out-Null

  # Disable fast startup
  Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -Name HiberbootEnabled -Value 0

  # Mouse settings
  Set-ItemProperty "HKCU:\Control Panel\Mouse" -Name MouseSpeed -Value 0
  Set-ItemProperty "HKCU:\Control Panel\Mouse" -Name MouseSensitivity -Value 12
}

Write-Host "Setting up system..." -NoNewline
setupSystem
Write-Host " Done"

# Apps
# ==============================================================================

function setupApps {
  # Remove AppxPackages
  Get-AppxPackage -AllUsers |
  Where-Object { $_.name -notlike "*Microsoft.WindowsStore*" } |
  Where-Object { $_.name -notlike "*Microsoft.Windows.Photos*" } |
  Where-Object { $_.name -notlike "*Microsoft.WindowsCalculator*" } |
  Where-Object { $_.name -notlike "*Microsoft.ScreenSketch*" } |
  Where-Object { $_.name -notlike "*Microsoft.WindowsTerminal*" } |
  Remove-AppxPackage -ea 0 | Out-Null

  # Remove AppxProvisionedPackages
  Get-AppxProvisionedPackage -online |
  Where-Object { $_.packagename -notlike "*Microsoft.WindowsStore*" } |
  Where-Object { $_.packagename -notlike "*Microsoft.Windows.Photos*" } |
  Where-Object { $_.packagename -notlike "*Microsoft.WindowsCalculator*" } |
  Where-Object { $_.packagename -notlike "*Microsoft.ScreenSketch*" } |
  Where-Object { $_.packagename -notlike "*Microsoft.WindowsTerminal*" } |
  Remove-AppxProvisionedPackage -online -ea 0 | Out-Null

  # Remove WindowsCapabilities
  foreach ($capability in @(
      "App.StepsRecorder~~~~0.0.1.0"
      "Browser.InternetExplorer~~~~0.0.11.0"
      "Media.WindowsMediaPlayer~~~~0.0.12.0"
      "Microsoft.Windows.WordPad~~~~0.0.1.0"
      "Microsoft.Windows.PowerShell.ISE~~~~0.0.1.0"
    )) {
    Remove-WindowsCapability -Online –Name $capability -NoRestart
  }

  # App settings
  foreach ($key in @(
      "ContentDeliveryAllowed"
      "OemPreInstalledAppsEnabled"
      "PreInstalledAppsEnabled"
      "SilentInstalledAppsEnabled"
      "SoftLandingEnabled"
      "SubscribedContentEnabled"
      "SystemPaneSuggestionsEnabled"
    )) {
    Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name $key -Value 0
  }

  # Disable consumer features
  $pathConsumerFeatures = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
  if (!(Test-Path $pathConsumerFeatures)) {
    New-Item $pathConsumerFeatures -ItemType Directory -Force -ea 0 | Out-Null
  }
  New-ItemProperty $pathConsumerFeatures -Name DisableWindowsConsumerFeatures -Value 1 -ea 0 | Out-Null
}

Write-Host "Setting up apps..." -NoNewline
setupApps
Write-Host " Done"

# Explorer
# ==============================================================================

function setupExplorer {
  $path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer"

  Set-ItemProperty "$path\Advanced" -Name LaunchTo -Value 1
  Set-ItemProperty "$path\Advanced" -Name Hidden -Value 1
  Set-ItemProperty "$path\CabinetState" -Name FullPath -Value 1
  Set-ItemProperty $path -Name ShowRecent -Value 0
  Set-ItemProperty $path -Name ShowFrequent -Value 0
}

Write-Host "Setting up explorer..." -NoNewline
setupExplorer
Write-Host " Done"

# Taskbar
# ==============================================================================

function setupTaskbar {
  $path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion"

  Set-ItemProperty "$path\Explorer\StuckRects3" -Name Settings -Value ([byte[]](0x30, 0x00, 0x00, 0x00, 0xfe, 0xff, 0xff, 0xff, 0x02, 0x50, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x5d, 0x00, 0x00, 0x00, 0x1e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x07, 0x00, 0x00, 0x1e, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00))
  Set-ItemProperty "$path\Explorer\Advanced" -Name TaskbarSizeMove -Value 0
  Set-ItemProperty "$path\Explorer\Advanced" -Name TaskbarSmallIcons -Value 1
  Set-ItemProperty "$path\Explorer\Advanced" -Name ShowCortanaButton -Value 0
  Set-ItemProperty "$path\Explorer\Advanced" -Name ShowTaskViewButton -Value 0
  Set-ItemProperty "$path\Explorer\Advanced\People" -Name PeopleBand -Value 0
  Set-ItemProperty "$path\Search" -Name SearchboxTaskbarMode -Value 0
}

Write-Host "Setting up taskbar..." -NoNewline
setupTaskbar
Write-Host " Done"

# Context Menu
# ==============================================================================

function setupContextMenu {
  New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT | Out-Null

  # Remove 'Edit With Photos'
  New-ItemProperty "HKCR:\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit" -Name ProgrammaticAccessOnly -Value 1 -ea 0 | Out-Null

  # Remove 'Create a new Video'
  foreach ($path in @(
      "HKCR:\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellCreateVideo"
      "HKCR:\AppXk0g4vb8gvt7b93tg50ybcy892pge6jmt\Shell\ShellCreateVideo"
    )) {
    Remove-Item $path -Recurse -ea 0
  }

  # Remove 'Edit with Paint 3D'
  $pathSFA = "HKLM:\SOFTWARE\Classes\SystemFileAssociations"
  foreach ($path in @(
      "$pathSFA\.3mf\Shell\3D Edit"
      "$pathSFA\.bmp\Shell\3D Edit"
      "$pathSFA\.gif\Shell\3D Edit"
      "$pathSFA\.glb\Shell\3D Edit"
      "$pathSFA\.fbx\Shell\3D Edit"
      "$pathSFA\.jfif\Shell\3D Edit"
      "$pathSFA\.jpe\Shell\3D Edit"
      "$pathSFA\.jpeg\Shell\3D Edit"
      "$pathSFA\.jpg\Shell\3D Edit"
      "$pathSFA\.obj\Shell\3D Edit"
      "$pathSFA\.ply\Shell\3D Edit"
      "$pathSFA\.png\Shell\3D Edit"
      "$pathSFA\.stl\Shell\3D Edit"
      "$pathSFA\.tif\Shell\3D Edit"
      "$pathSFA\.tiff\Shell\3D Edit"
    )) {
    Remove-Item $path -Recurse -ea 0
  }

  # Remove 'Share'
  Remove-Item "HKCR:\*\shellex\ContextMenuHandlers\ModernSharing" -Recurse -ea 0

  # Remove 'Include in Library'
  foreach ($path in @(
      "HKCR:\Folder\ShellEx\ContextMenuHandlers\Library Location"
      "HKLM:\SOFTWARE\Classes\Folder\ShellEx\ContextMenuHandlers\Library Location"
    )) {
    Remove-Item $path -Recurse -ea 0
  }

  # Remove 'Restore to previous Versions'
  foreach ($path in @(
      "HKCR:\AllFilesystemObjects\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}"
      "HKCR:\CLSID\{450D8FBA-AD25-11D0-98A8-0800361B1103}\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}"
      "HKCR:\Directory\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}"
      "HKCR:\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}"
    )) {
    Remove-Item $path -Recurse -ea 0
  }

  Remove-PSDrive HKCR | Out-Null
}

Write-Host "Setting up context menu..." -NoNewline
setupContextMenu
Write-Host " Done"
