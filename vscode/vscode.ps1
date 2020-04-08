Write-Output " __     ______     ____          _ "
Write-Output " \ \   / / ___|   / ___|___   __| | ___ "
Write-Output "  \ \ / /\___ \  | |   / _ \ / _  |/ _ \ "
Write-Output "   \ V /  ___) | | |__| (_) | (_| |  __/ "
Write-Output "    \_/  |____/   \____\___/ \__,_|\___| "
Write-Output ""

# Settings
# ==============================================================================

Write-Output "Copying VS Code settings..."
Copy-Item -force "$PSScriptRoot\settings.json" "$HOME\AppData\Roaming\Code\User"
Write-Output ""

# Extensions
# ==============================================================================

Write-Output "Installing VS Code extensions..."

$extensions = @(
  # Appearance
  "jolaleye.horizon-theme-vscode"
  "vscode-icons-team.vscode-icons"
  # Formatting
  "editorconfig.editorconfig"
  "esbenp.prettier-vscode"
  # Languages
  "yzhang.markdown-all-in-one"
  "ms-vscode.powershell"
  "mikestead.dotenv"
  "ecmel.vscode-html-css"
  "bmewburn.vscode-intelephense-client"
  "mblode.twig-language-2"
  # Linter
  "davidanson.vscode-markdownlint"
  "shinnn.stylelint"
  "dbaeumer.vscode-eslint"
  # Miscellaneous
  "liximomo.sftp"
  "mkxml.vscode-filesize"
  "cssho.vscode-svgviewer"
  "bierner.emojisense"
  "pnp.polacode"
)

foreach ($extension in $extensions) {
  Write-Output ">>> $extension"
  code --install-extension $extension | Out-Null
}

Write-Output ""

# Custom Icons
# ==============================================================================

Write-Output "Copying custom icons..."
Copy-Item -r -force "$PSScriptRoot\vsicons-custom-icons" "$HOME\AppData\Roaming\Code\User"
Write-Output ""
