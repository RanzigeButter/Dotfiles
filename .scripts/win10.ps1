<#  ========================================================================
    # Scripts - Windows 10
    ========================================================================  #>

# General
# ==============================================================================

function setupGeneral {

  # Disable fast startup
  Set-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -Name HiberbootEnabled -Value 0

  # Disabel lock screen
  $pathLockScreen = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization"
  if (!(Test-Path $pathLockScreen)) {
    New-Item $pathLockScreen -ItemType Directory -Force -ea 0 | Out-Null
  }
  New-ItemProperty $pathLockScreen -Name NoLockScreen -Value 1 -ea 0 | Out-Null

  # Dark Mode
  Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name AppsUseLightTheme -Value 0

  # Disable Edge shortcut creation after update
  New-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name DisableEdgeDesktopShortcutCreation -Value 1 -ea 0 | Out-Null

}

# Taskbar
# ==============================================================================

function setupTaskbar {
  $path = "HKCU:\Software\Microsoft\Windows\CurrentVersion"

  Set-ItemProperty "$path\Explorer\StuckRects3" -Name Settings -Value ([byte[]](0x30, 0x00, 0x00, 0x00, 0xfe, 0xff, 0xff, 0xff, 0x02, 0x50, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x5d, 0x00, 0x00, 0x00, 0x1e, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x07, 0x00, 0x00, 0x1e, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00))
  Set-ItemProperty "$path\Explorer\Advanced" -Name TaskbarSizeMove -Value 0
  Set-ItemProperty "$path\Explorer\Advanced" -Name TaskbarSmallIcons -Value 1
  Set-ItemProperty "$path\Explorer\Advanced" -Name ShowCortanaButton -Value 0
  Set-ItemProperty "$path\Explorer\Advanced" -Name ShowTaskViewButton -Value 0
  Set-ItemProperty "$path\Explorer\Advanced\People" -Name PeopleBand -Value 0
  Set-ItemProperty "$path\Search" -Name SearchboxTaskbarMode -Value 0
}

# Explorer
# ==============================================================================

function setupExplorer {
  $path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer"

  Set-ItemProperty "$path\Advanced" -Name LaunchTo -Value 1
  Set-ItemProperty "$path\Advanced" -Name Hidden -Value 1
  Set-ItemProperty $path -Name ShowRecent -Value 0
  Set-ItemProperty $path -Name ShowFrequent -Value 0

  # Remove '3D Objects' folder
  foreach ($path in @(
      "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"
      "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"
    )) {
    Remove-Item $path -Recurse -ea 0 | Out-Null
  }
}

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
    Remove-Item $path -Recurse -ea 0 | Out-Null
  }

  # Remove 'Edit with Paint 3D'
  $pathFileAssociations = "HKLM:\SOFTWARE\Classes\SystemFileAssociations"
  foreach ($path in @(
      "$pathFileAssociations\.3mf\Shell\3D Edit"
      "$pathFileAssociations\.bmp\Shell\3D Edit"
      "$pathFileAssociations\.gif\Shell\3D Edit"
      "$pathFileAssociations\.glb\Shell\3D Edit"
      "$pathFileAssociations\.fbx\Shell\3D Edit"
      "$pathFileAssociations\.jfif\Shell\3D Edit"
      "$pathFileAssociations\.jpe\Shell\3D Edit"
      "$pathFileAssociations\.jpeg\Shell\3D Edit"
      "$pathFileAssociations\.jpg\Shell\3D Edit"
      "$pathFileAssociations\.obj\Shell\3D Edit"
      "$pathFileAssociations\.ply\Shell\3D Edit"
      "$pathFileAssociations\.png\Shell\3D Edit"
      "$pathFileAssociations\.stl\Shell\3D Edit"
      "$pathFileAssociations\.tif\Shell\3D Edit"
      "$pathFileAssociations\.tiff\Shell\3D Edit"
    )) {
    Remove-Item $path -Recurse -ea 0 | Out-Null
  }

  # Remove 'Share'
  Remove-Item "HKCR:\*\shellex\ContextMenuHandlers\ModernSharing" -Recurse -ea 0 | Out-Null

  # Remove 'Include in Library'
  foreach ($path in @(
      "HKCR:\Folder\ShellEx\ContextMenuHandlers\Library Location"
      "HKLM:\SOFTWARE\Classes\Folder\ShellEx\ContextMenuHandlers\Library Location"
    )) {
    Remove-Item $path -Recurse -ea 0 | Out-Null
  }

  # Remove 'Restore to previous Versions'
  foreach ($path in @(
      "HKCR:\AllFilesystemObjects\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}"
      "HKCR:\CLSID\{450D8FBA-AD25-11D0-98A8-0800361B1103}\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}"
      "HKCR:\Directory\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}"
      "HKCR:\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}"
    )) {
    Remove-Item $path -Recurse -ea 0 | Out-Null
  }

  Remove-PSDrive HKCR | Out-Null
}

# System
# ==============================================================================

function setupSystem {

}
