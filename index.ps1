<#
.SYNOPSIS
    Downloads and extracts devotional songs without admin rights
#>

$ErrorActionPreference = "Stop"

# Download function with retry logic
function Get-File {
    param ($url, $output)
    try {
        Write-Host "Downloading $output..."
        (New-Object Net.WebClient).DownloadFile($url, $output)
    } catch {
        Write-Host "⚠️ Retrying download..." -ForegroundColor Yellow
        try {
            Invoke-WebRequest $url -OutFile $output -UserAgent "Wget"
        } catch {
            Write-Host "❌ Failed to download $output" -ForegroundColor Red
            exit 1
        }
    }
}

# File URLs
$files = @{
    Krishna = "https://bit.ly/krishnbhaktigeet"
    Shiva   = "https://bit.ly/shivbhaktigeet"
}

# Download and extract each file
foreach ($god in $files.Keys) {
    $zip = "$god-songs.zip"
    Get-File -url $files[$god] -output $zip
    
    # Extract to subfolder
    $dest = "$god-bhajans"
    New-Item -ItemType Directory -Path $dest -Force | Out-Null
    try {
        Expand-Archive -Path $zip -DestinationPath $dest -Force
    } catch {
        Write-Host "❌ Extraction failed for $zip" -ForegroundColor Red
        exit 1
    }
    
    # Cleanup
    Remove-Item $zip -ErrorAction SilentlyContinue
}

Write-Host "✅ Success! Files extracted to:" -ForegroundColor Green
Get-ChildItem | Where-Object { $_.PSIsContainer -and $_.Name -match "bhajans" } | Select-Object Name
