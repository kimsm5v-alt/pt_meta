[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$PSDefaultParameterValues['*:Encoding'] = 'utf8'

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$htmlFile = Join-Path $scriptDir "index.html"
$outDir = Join-Path $scriptDir "images"

$content = Get-Content -Raw -LiteralPath $htmlFile -Encoding UTF8
$pattern = 'data:image/(png|jpeg|jpg|gif|webp);base64,([A-Za-z0-9+/=]+)'
$matchList = [regex]::Matches($content, $pattern)
Write-Host "Found $($matchList.Count) images"

for ($i = 0; $i -lt $matchList.Count; $i++) {
    $ext = $matchList[$i].Groups[1].Value
    if ($ext -eq 'jpeg') { $ext = 'jpg' }
    $base64 = $matchList[$i].Groups[2].Value
    $bytes = [Convert]::FromBase64String($base64)
    $filename = Join-Path $outDir "image_$($i+1).$ext"
    [IO.File]::WriteAllBytes($filename, $bytes)
    $sizeKB = [math]::Round($bytes.Length/1024, 1)
    Write-Host "Saved: image_$($i+1).$ext ($sizeKB KB)"
}
Write-Host ""
Write-Host "All images saved to: $outDir"
