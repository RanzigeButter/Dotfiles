# dotfiles

Repository that contains my dotfiles/configs.

## Installation

1. Update Windows (Settings -> Updates -> Search for Updates)
2. Open PowerShell as administrator and enter this command:

```PowerShell
iwr "https://raw.githubusercontent.com/RanzigeButter/dotfiles/master/install.ps1" -UseBasicParsing | iex
```

## Update

Run this command to update:

```PowerShell
iwr "https://raw.githubusercontent.com/RanzigeButter/dotfiles/master/update.ps1" -UseBasicParsing | iex
```

## WSL

Install some basic programs, set zsh as the default shell and copy dotfiles:

```sh
curl -o- https://raw.githubusercontent.com/RanzigeButter/dotfiles/master/wsl/install.sh | sh
```
