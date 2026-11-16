# Gold Records media uploader

Download `Upload-GoldRecords.ps1` from the ChatGPT conversation, then run it on your Windows computer. The script reads the OneDrive-synced `Albums` directory and uploads only standardized MP3 and PNG/JPG song artwork to the root of this repository (where existing song pages expect them). WAV, DOCX, and unrelated files are excluded.

**Requirements:** Git for Windows, authenticated GitHub push access, OneDrive folders available locally (Files On-Demand files must be downloaded).

**Preview:**

```powershell
powershell -ExecutionPolicy Bypass -File .\Upload-GoldRecords.ps1
```

**Publish:**

```powershell
powershell -ExecutionPolicy Bypass -File .\Upload-GoldRecords.ps1 -Publish
```

The script prompts for the full OneDrive Albums folder path and clones the website repository into `Documents\smallmeansproject-website` if necessary. It verifies the remote, skips identical files, checks for filename collisions, warns about missing assets, commits and pushes in batches, and warns when estimated repository content exceeds 900 MB.

**Important:** GitHub repositories are not ideal for hosting gigabytes of MP3s. Consider dedicated object storage if the full catalog becomes too large. GitHub Pages cannot serve Git LFS pointer files as ordinary audio.
