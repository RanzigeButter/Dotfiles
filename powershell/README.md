# PowerShell Profile

My PowerShell Profile.

## Installation

Before installation, we have to set our PowerShell execution policy to allow the use of scripts.
To do this, open your PowerShell as an administrator and enter the following command:

```PowerShell
Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force
```

There are four ways to install the profile:

```plaintext
For current User and Shell:
C:\User\USERNAME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

For current User and all Shells:
C:\User\USERNAME\Documents\WindowsPowerShell\profile.ps1

For all Users and current Shell:
C:\Windows\System32\WindowsPowerShell\v1.0\Microsoft.PowerShell_profile.ps1

For all Users and Shells:
C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1
```

## Content

### Promt

```plaintext
[Username@Computername CurrentLocation]❯
```

### Commands

> Commands are not case-sensitive.

General:

- `x` = Close PowerShell
- `openPowerShellAdmin` / `opa` = Open PowerShell as admin
- `shutdownTimer` / `sdt` = Shutdown with timer (insert the time in minutes after the command)
- `shutdownAbort` / `sda` = Abort Shutdown
- `dns` = Get DNS infos
- `update` = Update dotfiles

Directories/Files:

- `touch` / `t` = Create new empty file
- `mkd` = Create new empty directory
- `dircontent` = Writes the directory contents to a .csv file
- `..`, `...`, `....`, `.....`, `......` = Folder(s) up
- `dl` = Change directory to Downloads
- `box` = Change directory to Dropbox
- `p` = Change directory to Projects

SSH:

- `sshGenerateKey` / `sshg` = Generate SSH key (insert the E-Mail and then the name after the command)
- `sshAddKey` / `ssha` = Add SSH key (insert the SSH key name after the command)
- `sshRanzigeButter` / `rb` = SSH to RanzigeButter

[Visual Studio Code](https://code.visualstudio.com):

- `vscodeNew` / `coden` = Open current folder in a new VS Code window
- `vscodeReuse` / `coder` = Open current folder in an already opened VS Code window

[Git](https://git-scm.com):

- `gitAddCommit` / `gac` = Add and commit files with message (insert the message after the command)
- `gitAddCommitAmend` / `gaca` = Amend to the last commit without editing the message
- `gitPush` / `gsh` = Push files to remote repository (insert the branch after the command)
- `gitPull` / `gll` = Pull files from remote repository (insert the branch after the command)
- `gitClone` / `gcl` = Clone repository into directory (insert the repository after the command)
- `gitLog` / `glog` = Shows the commit history

[npm](https://www.npmjs.com):

- `npmInstallDependencies` / `nid` = Install package in dependencies (insert package after the command)
- `npmInstallDevDependencies` / `nidd` = Install package in devDependencies (insert package after the command)
- `npmOutdated` / `no` = Outdated packages
- `npmUpdate` / `nu` = Update packages
- `npmAudit` / `na` = Audit packages
- `npmDevelopment` / `nd` = Run development script (configuration must be provided in package.json)
- `npmProduction` / `np` = Run production script (configuration must be provided in package.json)
