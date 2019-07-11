# **PowerShell Profile** <!-- omit in toc -->

My custom PowerShell Profile.

## Table of Contents <!-- omit in toc -->

- [**Installation**](#installation)
  - [For current User and Shell](#for-current-user-and-shell)
  - [For current User and all Shells](#for-current-user-and-all-shells)
  - [For all Users and current Shell](#for-all-users-and-current-shell)
  - [For all Users and Hosts](#for-all-users-and-hosts)
- [**Content**](#content)
  - [**Settings**](#settings)
    - [Colors](#colors)
    - [Font](#font)
    - [Miscellaneous](#miscellaneous)
    - [Window Title](#window-title)
    - [User Interface](#user-interface)
    - [Promt](#promt)
  - [**Functions**](#functions)
    - [General](#general)
    - [Directory](#directory)
    - [Visual Studio Code](#visual-studio-code)
    - [Git](#git)
    - [Node Package Manager (NPM)](#node-package-manager-npm)
    - [Webpack](#webpack)
    - [SSH](#ssh)
  - [**Aliases**](#aliases)
    - [General](#general-1)
    - [Directory](#directory-1)
    - [Visual Studio Code](#visual-studio-code-1)
    - [Git](#git-1)
    - [Node Package Manager (NPM)](#node-package-manager-npm-1)
    - [Webpack](#webpack-1)
    - [SSH](#ssh-1)
  - [**Clear-Host**](#clear-host)

## **Installation**

Before the installation we have to set our PowerShell execution policy to make use of scripts.
To do this, open your PowerShell as an administrator and enter the following command:

````PowerShell
  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force
````

Now there are four ways to install the profile:

### For current User and Shell

````plaintext
  C:\User\USERNAME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
````

### For current User and all Shells

````plaintext
  C:\User\USERNAME\Documents\WindowsPowerShell\profile.ps1
````

### For all Users and current Shell

````plaintext
  C:\Windows\System32\WindowsPowerShell\v1.0\Microsoft.PowerShell_profile.ps1
````

### For all Users and Hosts

````plaintext
  C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1
````


---


## **Content**

Summary of all the things this profile contains.

**Note:** Commands are not case-sensitive.


---


### **Settings**

First, all other settings stored in the Registry are deleted to ensure that all windows look the same.

#### Colors

````plaintext
  Black (Hex #0f1218 / RGB 15,18,24)
  DarkBlue (Hex #0078b4 / RGB 0,120,180)
  DarkGreen (Hex #14a532 / RGB 20,165,50)
  DarkCyan (Hex #008c8c / RGB 0,140,140)
  DarkRed (Hex #f51937 / RGB 245,25,55)
  DarkMagenta (Hex #af46d2 / RGB 175,70,210)
  DarkYellow (Hex #f5b464 / RGB 245,180,100)
  Gray (Hex #cccccc / RGB 204,204,204)
  DarkGray (Hex #888888 / RGB 136,136,136)
  Blue (Hex #3296fa / RGB 50,150,250)
  Green (Hex #32b45f / RGB 50,180,95)
  Cyan (Hex #19e1C8 / RGB 25,225,200)
  Red (Hex #e64655 / RGB 230,70,85)
  Magenta (Hex #c873dc / RGB 200,115,220)
  Yellow (Hex #ebc88c / RGB 235,200,140)
  White (Hex #f8f8f8 / RGB 248,248,248)
````

#### Font

````plaintext
  Font = Consolas
  Font Size = 18
  Font Weight = 400
````

#### Miscellaneous

````plaintext
  Window Opacity = 95%
  Break long lines into multiple rows = Yes
  History Buffer Size = 50
  Number of History Buffers = 3
  Retain duplicate History Entries = No
  Quick Edit = Yes
  Insert Mode = Yes
````

#### Window Title

The window title contains the following information: The name of the program, whether the application is running as an administrator or not and the date of the current day.

#### User Interface

This determines which colors are to be used for what.

````PowerShell
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
````

#### Promt

Changes Promt to "UserName@HostName - CurrentLocation>".


---


### **Functions**

List of all contained functions.

#### General

- `C` = Clear PowerShell
- `X` = Close PowerShell
- `Open_PowerShell` = Open new PowerShell window
- `Open_PowerShell_Admin` = Open new PowerShell window as admin
- `Shutdown_Timer` = Shutdown with timer (Insert the desired time in minutes after the command.)
- `Shutdown_Abort` = Abort Shutdown

#### Directory

- `..` = One folder up
- `...` = Two folders up
- `....` = Three folders up
- `Dir_Home` = Change directory to Home
- `Dir_Desktop` = Change directory to Desktop
- `Dir_Downloads` = Change directory to Downloads
- `Dir_Dropbox` = Change directory to Dropbox
- `Dir_Projects` = Change directory to Projects
- `Dir_Print` = Prints the directory contents into a .csv file (The file will be located in the corresponding directory.)

#### Visual Studio Code

[Visual Studio Code](https://code.visualstudio.com/) must be installed!

- `VSCode_New` = Open current folder in a new VS Code window
- `VSCode_Reuse` = Open current folder in an already opened VS Code window
- `VSCode_Compare` = Compare two files with each other in a new VS Code window (Insert the desired files after the command.)

#### Git

[Git](https://git-scm.com) must be installed!

- `Git_AddAndCommit` = Add and commit files with message (Insert the desired message after the command.)
- `Git_AddAndCommit_Amend` = Amend to the last commit without editing the message
- `Git_Push` = Push files to remote repository (Insert the desired branch after the command.)
- `Git_Pull` = Pull files from remote repository (Insert the desired branch after the command.)
- `Git_Clone` = Clone repository into directory (Insert the desired repository after the command.)
- `Git_Log` = Shows the commit history

#### Node Package Manager (NPM)

[NodeJS/NPM](https://nodejs.org) must be installed!

- `NPM_Install_Dependencies` = Install package in dependencies (Insert the desired package after the command.)
- `NPM_Install_DevDependencies` = Install package in devDependencies (Insert the desired package after the command.)
- `NPM_Outdated` = Outdated packages
- `NPM_Update` = Update packages
- `NPM_Audit` = Audit packages

#### Webpack

[Webpack](https://webpack.js.org) configuration must be provided!

- `Webpack_Development` = Run Webpack in development mode
- `Webpack_Production` = Run Webpack in production mode

#### SSH

[OpenSSH](https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_overview) must be installed!

- `SSH_GenerateKey` = Generate SSH key (Insert the desired E-Mail first and then the desired name after the command.)
- `SSH_AddKey` = Add SSH key (Insert the desired SSK key name after the command.)
- `SSH_ListKeys` = List all added SSH keys
- `SSH_DeleteKeys` = Delete all added SSH keys
- `SSH_RasPi0W` = SSH to RaspberryPi 0 W


---


### **Aliases**

List of all contained aliases.

#### General

- `OP` = `Open_PowerShell`
- `OPA` = `Open_PowerShell_Admin`
- `ST` = `Shutdown_Timer`
- `SA` = `Shutdown_Abort`

#### Directory

- `DH` = `Dir_Home`
- `DDT` = `Dir_Desktop`
- `DDL` = `Dir_Downloads`
- `DDB` = `Dir_Dropbox`
- `DP` = `Dir_Projects`
- `DPRINT` = `Dir_Print`

#### Visual Studio Code

[Visual Studio Code](https://code.visualstudio.com/) must be installed!

- `CN` = `VSCode_New`
- `CR` = `VSCode_Reuse`
- `CC` = `VSCode_Compare`

#### Git

[Git](https://git-scm.com) must be installed!

- `GAC` = `Git_AddAndCommit`
- `GACA` = `Git_AddAndCommit_Amend`
- `GSH` = `Git_Push`
- `GLL` = `Git_Pull`
- `GCL` = `Git_Clone`
- `GLOG` = `Git_Log`

#### Node Package Manager (NPM)

[NodeJS/NPM](https://nodejs.org) must be installed!

- `ND` = `NPM_Install_Dependencies`
- `NDD` = `NPM_Install_DevDependencies`
- `NO` = `NPM_Outdated`
- `NU` = `NPM_Update`
- `NA` = `NPM_Audit`

#### Webpack

[Webpack](https://webpack.js.org) configuration must be provided!

- `WD` = `Webpack_Development`
- `WP` = `Webpack_Production`

#### SSH

[OpenSSH](https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_overview) must be installed!

- `SSHG` = `SSH_GenerateKey`
- `SSHA` = `SSH_AddKey`
- `SSHL` = `SSH_ListKeys`
- `SSHD` = `SSH_DeleteKeys`
- `RPI0` = `SSH_RasPi0W`


---


### **Clear-Host**

Clear PowerShell after the profile has been loaded.
