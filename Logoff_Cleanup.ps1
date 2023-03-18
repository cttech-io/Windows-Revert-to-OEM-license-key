#Clear User Downloads Folder of antything older than 7 days old
Get-ChildItem –Path $env:UserProfile\Downloads\* -Recurse | Where-Object { $_.LastWriteTime –lt (Get-Date).AddDays(-7) } | Remove-Item -Force

#Clear Down Teams Cache
$TeamsCache="$env:AppData\Microsoft\Teams\Service Worker\CacheStorage"
If (Test-Path $TeamsCache){
	Remove-Item $TeamsCache\* -Recurse -Force}

#Clear Down User Thunderbird Index Files 
Get-ChildItem -Path $env:AppData\Thunderbird\Profiles\ *.sbd -Recurse | foreach { Remove-Item -Path $_.FullName -Force -Recurse }
Get-ChildItem -Path $env:AppData\Thunderbird\Profiles\ *.msf -Recurse | foreach { Remove-Item -Path $_.FullName -Force -Recurse }

#Clear Recycle Bin
Clear-RecycleBin -DriveLetter C -Force