<#
.SYNOPSIS
    Downloads and extracts devotional songs without admin rights or nested folders
#>

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
chcp 65001 | Out-Null
$ErrorActionPreference = "Stop"

# Improved download function
function Get-BhajanFile {
    param ($url, $output)
    try {
        Write-Host "Downloading $output..." -ForegroundColor Cyan
        Invoke-WebRequest $url -OutFile $output -UserAgent "Wget"
    } catch {
        Write-Host "Retrying with alternate download method..." -ForegroundColor Yellow
        try {
            (New-Object Net.WebClient).DownloadFile($url, $output)
        } catch {
            Write-Host "ERROR: Failed to download: $output" -ForegroundColor Red
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
        # Write-Host "Created folder: $((Get-Item $dest).FullName)" -ForegroundColor Green
    }
    
    # Extract and handle -latest folder
    try {
        Expand-Archive -Path $zip -DestinationPath $dest -Force
        
        # Move contents from -latest folder to main directory
        $latestFolder = Get-ChildItem -Path $dest -Directory | Where-Object { $_.Name -like "*-latest" } | Select-Object -First 1
        if ($latestFolder) {
            # Write-Host "Moving files from $($latestFolder.Name)..." -ForegroundColor Yellow
            Get-ChildItem -Path $latestFolder.FullName | Move-Item -Destination $dest -Force
            Remove-Item -Path $latestFolder.FullName -Recurse -Force
            Write-Host "Files moved to: $((Get-Item $dest).FullName)" -ForegroundColor Green
        }
        
        # Remove the zip file
        Remove-Item $zip -ErrorAction SilentlyContinue
        
    } catch {
        Write-Host "ERROR: Failed to extract $zip" -ForegroundColor Red
        exit 1
    }
}

# Final output
# Write-Host "`nSUCCESS: All bhajans downloaded and extracted to these folders:" -ForegroundColor Magenta
# Get-ChildItem -Directory | Where-Object { $_.Name -match "bhajans" } | ForEach-Object {
#     Write-Host "-> $($_.FullName)" -ForegroundColor White
#     Write-Host "   (Contains $((Get-ChildItem $_.FullName -File).Count) files)" -ForegroundColor Gray
# }

Clear-Host
