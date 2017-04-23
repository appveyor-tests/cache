if(-not (Test-Path 'C:\test-folder')) {
  # create from scratch
  Write-Host "Create folder with hidden files"
  New-Item 'C:\test-folder' -ItemType Directory
  New-Item 'C:\test-folder\readme.txt' -ItemType File -Value 'Hello, world!'
  New-Item 'C:\test-folder\hidden-folder' -ItemType Directory
  New-Item 'C:\test-folder\hidden-folder\secret.txt' -ItemType File -Value 'Tsss!'
  (Get-Item 'C:\test-folder\hidden-folder').Attributes = 'Hidden'
  (Get-Item 'C:\test-folder\hidden-folder\secret.txt').Attributes = 'Hidden'
} else {
  Write-Host "Verifying restored folder"
  if(Test-Path 'C:\test-folder\test-folder') { throw 'C:\test-folder\test-folder should no exist.' }
  Get-ChildItem 'C:\test-folder' -Recurse -Force
  $dir_attrs = (Get-Item 'C:\test-folder\hidden-folder' -Force).Attributes
  $file_attrs = (Get-Item 'C:\test-folder\hidden-folder\secret.txt' -Force).Attributes
  if($dir_attrs -ne 'Hidden, Directory') { throw "Restored dir is not hidden." }
  if($file_attrs -ne 'Hidden') { throw "Restored files is not hidden." }
}
