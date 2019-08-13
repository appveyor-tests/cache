appveyor version
cmd /c 'mklink /J C:\msys64-copy C:\msys64'
cmd /c 'ping -n 1 objects.liquidweb.services'
nuget restore packages.config -PackagesDirectory packages
 .\cache-hidden.ps1
 Set-Content -Path "$env:appveyor_build_folder\packages\ts.txt" -Value "$(get-date)"
$expected_7zip_path = '"C:\Program Files\7-Zip\7z.exe"'
Write-Host "Path to 7z: $env:7zip"
if($env:7zip -ne $expected_7zip_path) { throw "7zip: $env:7zip, expected: $expected_7zip_path"; }
Write-Host "Clear PATH variable - cache should work"
$env:path = ""
