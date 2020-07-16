# PowerShell Profile <!-- omit in toc -->

My PowerShell Profile.

## Installation

Before installation, we have to set our PowerShell execution policy to allow the use of scripts.
To do this, open your PowerShell as an administrator and enter the following command:

```PowerShell
  Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force
```

There are four ways to install the profile:

### For current User and Shell

```plaintext
  C:\User\USERNAME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
```

### For current User and all Shells

```plaintext
  C:\User\USERNAME\Documents\WindowsPowerShell\profile.ps1
```

### For all Users and current Shell

```plaintext
  C:\Windows\System32\WindowsPowerShell\v1.0\Microsoft.PowerShell_profile.ps1
```

### For all Users and Shells

```plaintext
  C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1
```

## Content

Summary of the contents of this profile.

**Note:** Commands are not case-sensitive.


---


### Generic

#### Window Title

```plaintext
  PowerShell - Admin: true|false
```

#### Promt

```plaintext
  CurrentLocation ❯
```


---


### Commands

#### General

- `c` = Clear PowerShell
- `x` = Close PowerShell
- `openPowerShellAdmin` / `opa` = Open PowerShell as admin
- `shutdownTimer` / `st` = Shutdown with timer (insert the time in minutes after the command)
- `shutdownAbort` / `sa` = Abort Shutdown
- `updateDotfiles` / `udotfiles` = Update dotfiles

#### File System

- `touch` / `t` = Create new empty file
- `..` = One folder up
- `...` = Two folders up
- `....` = Three folders up
- `dirHome` / `~` = Change directory to Home
- `dirDesktop` / `dd` = Change directory to Desktop
- `dirDownloads` / `ddl` = Change directory to Downloads
- `dirDropbox` / `ddb` = Change directory to Dropbox
- `dirPrint` / `dprint` = Prints the directory contents into a .csv file (file will be located in the corresponding directory)

#### [Visual Studio Code](https://code.visualstudio.com/)

- `vscodeNew` / `cn` = Open current folder in a new VS Code window
- `vscodeReuse` / `cr` = Open current folder in an already opened VS Code window
- `vscodeCompare` / `cc` = Compare two files with each other in a new VS Code window (insert the files after the command)

#### [Git](https://git-scm.com)

- `gitAddCommit` / `gac` = Add and commit files with message (insert the message after the command)
- `gitAddCommitAmend` / `gaca` = Amend to the last commit without editing the message
- `gitPush` / `gsh` = Push files to remote repository (insert the branch after the command)
- `gitPull` / `gll` = Pull files from remote repository (insert the branch after the command)
- `gitClone` / `gcl` = Clone repository into directory (insert the repository after the command)
- `gitLog` / `glog` = Shows the commit history

#### [NodeJS/NPM](https://nodejs.org)

- `npmInstallDependencies` / `nid` = Install package in dependencies (insert package after the command)
- `npmInstallDevDependencies` / `nidd` = Install package in devDependencies (insert package after the command)
- `npmOutdated` / `no` = Outdated packages
- `npmUpdate` / `nu` = Update packages
- `npmAudit` / `na` = Audit packages
- `npmDevelopment` / `nd` = Run development script (configuration must be provided in package.json)
- `npmProduction` / `np` = Run production script (configuration must be provided in package.json)

#### OpenSSH

- `sshGenerateKey` / `sshg` = Generate SSH key (insert the E-Mail and then the name after the command)
- `sshAddKey` / `ssha` = Add SSH key (insert the SSH key name after the command)
- `sshRanzigeButter` / `rb` = SSH to RanzigeButter
