Write-Output ""
Write-Output " __     ______     ____          _        _____      _                 _                  "
Write-Output " \ \   / / ___|   / ___|___   __| | ___  | ____|_  _| |_ ___ _ __  ___(_) ___  _ __  ___  "
Write-Output "  \ \ / /\___ \  | |   / _ \ / _` |/ _ \ |  _| \ \/ / __/ _ \ '_ \/ __| |/ _ \| '_ \/ __| "
Write-Output "   \ V /  ___) | | |__| (_) | (_| |  __/ | |___ >  <| ||  __/ | | \__ \ | (_) | | | \__ \ "
Write-Output "    \_/  |____/   \____\___/ \__,_|\___| |_____/_/\_\\__\___|_| |_|___/_|\___/|_| |_|___/ "
Write-Output ""

# ==============================================================================
# Extensions
# ==============================================================================

$extensions = @(
  # Appearance
  "zhuangtongfa.material-theme"
  "vscode-icons-team.vscode-icons"
  # Formatting
  "editorconfig.editorconfig"
  "esbenp.prettier-vscode"
  # Languages
  "yzhang.markdown-all-in-one"
  "james-yu.latex-workshop"
  "ms-vscode.powershell"
  "mikestead.dotenv"
  "ecmel.vscode-html-css"
  "mblode.twig-language-2"
  # Linter
  "davidanson.vscode-markdownlint"
  "shinnn.stylelint"
  "dbaeumer.vscode-eslint"
  # Miscellaneous
  "mkxml.vscode-filesize"
  "cssho.vscode-svgviewer"
  "bierner.emojisense"
  "pnp.polacode"
  "liximomo.sftp"
)

# ==============================================================================
# Installation
# ==============================================================================

foreach ($extension in $extensions) {
  Write-Output ""
  Write-Output ">>> Installing $extension..."
  code.cmd --install-extension $extension
  Write-Output "=================================================="
  Start-Sleep 1
}
