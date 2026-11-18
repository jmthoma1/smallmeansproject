param([Parameter(Mandatory=$true)][string]$Source,[Parameter(Mandatory=$true)][string]$SongFolder,[switch]$Apply)
$ErrorActionPreference='Stop'
$root=(& git rev-parse --show-toplevel)
if($LASTEXITCODE -ne 0){throw 'Run inside the website repository'}
$branch=(& git -C $root branch --show-current)
if($branch -ne 'website-reorganization'){throw 'Use the website-reorganization branch only'}
if($SongFolder -notmatch '^collections/(gold-records|voices-of-truth|line-upon-line)/([a-z0-9-]+/)+[a-z0-9-]+/?$'){throw 'Invalid collection path'}
$dest=Join-Path $root $SongFolder
if(!(Test-Path -LiteralPath (Join-Path $dest 'index.html') -PathType Leaf)){throw 'Song page must already exist'}
$ext=[IO.Path]::GetExtension($Source).ToLowerInvariant()
switch($ext){'.jpg'{$name='cover.jpg'} '.mp3'{$name='preview.mp3'} default{throw 'Only standardized JPG and MP3 files accepted'}}
if(!(Test-Path -LiteralPath $Source -PathType Leaf)){throw 'Source missing'}
$target=Join-Path $dest $name
if((Test-Path -LiteralPath $target) -and ((Get-FileHash -LiteralPath $target).Hash -eq (Get-FileHash -LiteralPath $Source).Hash)){Write-Host 'Identical file; skipped';return}
Write-Host "$Source -> $target"
if(!$Apply){Write-Host 'Preview only. Use -Apply to copy locally.';return}
Copy-Item -LiteralPath $Source -Destination $target -Force
if((Get-FileHash -LiteralPath $target).Hash -ne (Get-FileHash -LiteralPath $Source).Hash){throw 'Hash mismatch'}
Write-Host 'Copy verified. Review git diff/status; no commit or push performed.'
