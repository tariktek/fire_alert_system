$url = "https://github.com/google/fonts/raw/main/ofl/pacifico/Pacifico-Regular.ttf"
$currentDir = $PSScriptRoot
$output = Join-Path $currentDir "assets\fonts\Pacifico-Regular.ttf"
New-Item -ItemType Directory -Force -Path (Split-Path $output -Parent)
Invoke-WebRequest -Uri $url -OutFile $output
Write-Host "Font downloaded to: $output" 