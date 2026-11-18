# Collection media workflow

Do not use the old root-directory uploader with the reorganized site. Run `Update-SongMedia.ps1` from a local checkout of the `website-reorganization` branch. It previews by default and replaces one existing song asset locally with `-Apply`. It never commits or pushes.

Example (PowerShell):

```powershell
powershell -ExecutionPolicy Bypass -File .\tools\Update-SongMedia.ps1 -Source 'C:\Music\song.jpg' -SongFolder 'collections/gold-records/vol-01-1-nephi/songs/1-nephi-01-great-and-marvelous'
```

Add `-Apply` after checking the destination. Use standardized square JPEGs and MP3 previews only. Review `git status` before committing and pushing to the working branch. Keep original full-resolution files and full songs offline. New songs require an HTML page and album navigation entry before media replacement. Bulk imports and future collection templates are not yet implemented. Do not delete legacy HTML redirects. GitHub Pages cannot serve Git LFS pointers as ordinary audio.
