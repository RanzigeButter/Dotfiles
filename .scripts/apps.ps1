<#  ========================================================================
    # Scripts - Apps
    ========================================================================  #>

Write-Host "Opening links for apps..." -NoNewline

# General
Start-Process "https://www.google.com/chrome/"
Start-Process "https://discordapp.com/"
Start-Process "https://www.spotify.com/"
Start-Process "https://www.dropbox.com/"
Start-Process "https://www.videolan.org/"
Start-Process "https://www.7-zip.org/"

# Productivity
Start-Process "https://affinity.serif.com/"
Start-Process "https://www.captureone.com/"
Start-Process "https://code.visualstudio.com/"
Start-Process "https://www.microsoft.com/de-de/p/windows-terminal-preview/9n0dx20hk701"
Start-Process "https://git-scm.com/"
Start-Process "https://nodejs.org/"

# Games
Start-Process "https://store.steampowered.com/"
Start-Process "https://www.battle.net/"

# Miscellaneous
Start-Process "https://customer.focusrite.com/en/support/downloads?brand=Focusrite&product_by_range=1361&download_type=software"

Write-Host " Done"
Read-Host "Press ENTER to continue when you are finished with the installations..."
