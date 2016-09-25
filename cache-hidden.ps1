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
  Get-ChildItem 'C:\test-folder' -Recurse -Force
  (Get-Item 'C:\test-folder\hidden-folder' -Force).Attributes
  (Get-Item 'C:\test-folder\hidden-folder\secret.txt' -Force).Attributes
}
