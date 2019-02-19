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
  # Design
  "zhuangtongfa.material-theme"
  "robertohuertasm.vscode-icons"
  # Languages
  "yzhang.markdown-all-in-one"
  "james-yu.latex-workshop"
  "ms-vscode.powershell"
  "mikestead.dotenv"
  "mrmlnc.vscode-apache"
  "whatwedo.twig"
  # Linter
  "editorconfig.editorconfig"
  "davidanson.vscode-markdownlint"
  "shinnn.stylelint"
  "dbaeumer.vscode-eslint"
  # Other
  "mkxml.vscode-filesize"
  "cssho.vscode-svgviewer"
  "pnp.polacode"
)

# ==============================================================================
# Installation
# ==============================================================================

foreach ($extension in $extensions) {
  Write-Output ""
  Write-Output ">>> Installing" $extension"..."
  code --install-extension $extension
  Write-Output "=================================================="
  Start-Sleep 1
}
