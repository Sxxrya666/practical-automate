<#
.SYNOPSIS
    Downloads and extracts devotional songs without admin rights or nested folders
#>

$ErrorActionPreference = "Stop"

# Improved download function
function Get-BhajanFile {
    param ($url, $output)
    try {
        Write-Host "📥 Downloading $output..." -ForegroundColor Cyan
        Invoke-WebRequest $url -OutFile $output -UserAgent "Wget"
    } catch {
        Write-Host "⚠️ Retrying with alternate download method..." -ForegroundColor Yellow
        try {
            (New-Object Net.WebClient).DownloadFile($url, $output)
        } catch {
            Write-Host "❌ Failed to download: $output" -ForegroundColor Red
            exit 1
        }
    }
}

# File URLs
$files = @{
    Krishna = "https://bit.ly/krishnbhaktigeet"
    Shiva   = "https://bit.ly/shivbhaktigeet"
}

# Process each download
foreach ($god in $files.Keys) {
    $zip = "$god-songs.zip"
    $dest = "$god-bhajans"
    
    # Download
    Get-BhajanFile -url $files[$god] -output $zip
    
    # Create destination (if doesn't exist)
    if (-not (Test-Path $dest)) {
        New-Item -ItemType Directory -Path $dest | Out-Null
    }
    
    # Extract directly to destination (no nested folders)
    try {
        Expand-Archive -Path $zip -DestinationPath $dest -Force
        Write-Host "✔️ Extracted to: $dest" -ForegroundColor Green
        
        # Remove the zip file
        Remove-Item $zip -ErrorAction SilentlyContinue
    } catch {
        Write-Host "❌ Failed to extract $zip" -ForegroundColor Red
        exit 1
    }
}

# Final output
Write-Host "`n🎉 All done! Your bhajans are in:" -ForegroundColor Magenta
Get-ChildItem -Directory | Where-Object { $_.Name -match "bhajans" } | ForEach-Object {
    Write-Host "→ $($_.FullName)" -ForegroundColor White
}
Clear-Host
