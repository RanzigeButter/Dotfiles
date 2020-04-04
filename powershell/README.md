# PowerShell Profile <!-- omit in toc -->

My custom PowerShell Profile.

## Table of Contents <!-- omit in toc -->

- [Installation](#installation)
  - [For current User and Shell](#for-current-user-and-shell)
  - [For current User and all Shells](#for-current-user-and-all-shells)
  - [For all Users and current Shell](#for-all-users-and-current-shell)
  - [For all Users and Hosts](#for-all-users-and-hosts)
- [Content](#content)
  - [General](#general)
    - [Window Title](#window-title)
    - [Promt](#promt)
  - [Functions](#functions)
    - [General](#general-1)
    - [File System](#file-system)
    - [Visual Studio Code](#visual-studio-code)
    - [Git](#git)
    - [Node Package Manager (NPM)](#node-package-manager-npm)
    - [SSH](#ssh)
  - [Aliases](#aliases)
    - [General](#general-2)
    - [File System](#file-system-1)
    - [Visual Studio Code](#visual-studio-code-1)
    - [Git](#git-1)
    - [Node Package Manager (NPM)](#node-package-manager-npm-1)
    - [SSH](#ssh-1)
  - [Clear-Host](#clear-host)

## Installation

Before installation, we have to set our PowerShell execution policy to allow the use of scripts.
To do this, open your PowerShell as an administrator and enter the following command:

````PowerShell
  Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force
````

There are four ways to install the profile:

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


## Content

Summary of all the things this profile contains.

**Note:** Commands are not case-sensitive.


---


### General

#### Window Title

```plaintext
  PowerShell - Admin: true|false
```

#### Promt

```plaintext
  UserName@HostName - CurrentLocation>
```


---


### Functions

List of all contained functions.

#### General

- `C` = Clear PowerShell
- `X` = Close PowerShell
- `Open_PowerShell` = Open new PowerShell window
- `Open_PowerShell_Admin` = Open new PowerShell window as admin
- `Shutdown_Timer` = Shutdown with timer (Insert the desired time in minutes after the command)
- `Shutdown_Abort` = Abort Shutdown

#### File System

- `Touch` = Create new empty file
- `..` = One folder up
- `...` = Two folders up
- `....` = Three folders up
- `Dir_Home` = Change directory to Home
- `Dir_Desktop` = Change directory to Desktop
- `Dir_Downloads` = Change directory to Downloads
- `Dir_Dropbox` = Change directory to Dropbox
- `Dir_Projects` = Change directory to Projects
- `Dir_Print` = Prints the directory contents into a .csv file (The file will be located in the corresponding directory)

#### Visual Studio Code

[Visual Studio Code](https://code.visualstudio.com/) must be installed!

- `VSCode_New` = Open current folder in a new VS Code window
- `VSCode_Reuse` = Open current folder in an already opened VS Code window
- `VSCode_Compare` = Compare two files with each other in a new VS Code window (Insert the desired files after the command)

#### Git

[Git](https://git-scm.com) must be installed!

- `Git_AddAndCommit` = Add and commit files with message (Insert the desired message after the command)
- `Git_AddAndCommit_Amend` = Amend to the last commit without editing the message
- `Git_Push` = Push files to remote repository (Insert the desired branch after the command)
- `Git_Pull` = Pull files from remote repository (Insert the desired branch after the command)
- `Git_Clone` = Clone repository into directory (Insert the desired repository after the command)
- `Git_Log` = Shows the commit history

#### Node Package Manager (NPM)

[NodeJS/NPM](https://nodejs.org) must be installed!

- `NPM_Install_Dependencies` = Install package in dependencies (Insert package after the command)
- `NPM_Install_DevDependencies` = Install package in devDependencies (Insert package after the command)
- `NPM_Reset` = Delete "node_modules" folder, package-lock.json and reinstall all packages
- `NPM_Outdated` = Outdated packages
- `NPM_Update` = Update packages
- `NPM_Audit` = Audit packages
- `NPM_Development` = Run development script (configuration must be provided in package.json)
- `NPM_Production` = Run production script (configuration must be provided in package.json)

#### SSH

[OpenSSH](https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_overview) must be installed!

- `SSH_GenerateKey` = Generate SSH key (Insert the desired E-Mail first and then the desired name after the command)
- `SSH_AddKey` = Add SSH key (Insert the desired SSK key name after the command)
- `SSH_ListKeys` = List all added SSH keys
- `SSH_DeleteKeys` = Delete all added SSH keys
- `SSH_RanzigeButter` = SSH to RanzigeButter


---


### Aliases

List of all contained aliases.

#### General

- `OP` = `Open_PowerShell`
- `OPA` = `Open_PowerShell_Admin`
- `ST` = `Shutdown_Timer`
- `SA` = `Shutdown_Abort`

#### File System

- `T` = `Touch`
- `DH` = `Dir_Home`
- `DD` = `Dir_Desktop`
- `DDL` = `Dir_Downloads`
- `DDB` = `Dir_Dropbox`
- `DP` = `Dir_Projects`
- `DPRINT` = `Dir_Print`

#### Visual Studio Code

- `CN` = `VSCode_New`
- `CR` = `VSCode_Reuse`
- `CC` = `VSCode_Compare`

#### Git

- `GAC` = `Git_AddAndCommit`
- `GACA` = `Git_AddAndCommit_Amend`
- `GSH` = `Git_Push`
- `GLL` = `Git_Pull`
- `GCL` = `Git_Clone`
- `GLOG` = `Git_Log`

#### Node Package Manager (NPM)

- `NID` = `NPM_Install_Dependencies`
- `NIDD` = `NPM_Install_DevDependencies`
- `NRESET` = `NPM_Reset`
- `NO` = `NPM_Outdated`
- `NU` = `NPM_Update`
- `NA` = `NPM_Audit`
- `ND` = `NPM_Development`
- `NP` = `NPM_Production`

#### SSH

- `SSHG` = `SSH_GenerateKey`
- `SSHA` = `SSH_AddKey`
- `SSHL` = `SSH_ListKeys`
- `SSHD` = `SSH_DeleteKeys`
- `RB` = `SSH_RanzigeButter`


---


### Clear-Host

Clear PowerShell after the profile has been loaded.
