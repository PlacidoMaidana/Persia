$actual = "C:\wamp64\www\persia"
$backup = "D:\Pato\PROYECTOS\PROYECTO PERSIA\2022-10-04 persia\2022-10-04 persia~\persia"

Write-Host "--- 1. Verification ---"
$actualExists = Test-Path $actual
$backupExists = Test-Path $backup
Write-Host "Actual exists: $actualExists"
Write-Host "Backup exists: $backupExists"

Write-Host "`n--- 2. File Count ---"
$actualFiles = (Get-ChildItem -Path $actual -Recurse -File -ErrorAction SilentlyContinue).Count
$backupFiles = (Get-ChildItem -Path $backup -Recurse -File -ErrorAction SilentlyContinue).Count
Write-Host "Files in Actual: $actualFiles"
Write-Host "Files in Backup: $backupFiles"

$foldersToCheck = @("app", "routes", "resources\views", "public", "config", "database")
$filesToCheck = @("composer.json", "package.json", "webpack.mix.js")
$missingFiles = New-Object System.Collections.Generic.List[string]

foreach ($folder in $foldersToCheck) {
    if (Test-Path (Join-Path $backup $folder)) {
        Get-ChildItem -Path (Join-Path $backup $folder) -Recurse -File | ForEach-Object {
            $rel = $_.FullName.Substring($backup.Length + 1)
            if (-not (Test-Path (Join-Path $actual $rel))) { [void]$missingFiles.Add($rel) }
        }
    }
}
foreach ($f in $filesToCheck) {
    if ((Test-Path (Join-Path $backup $f)) -and (-not (Test-Path (Join-Path $actual $f)))) { [void]$missingFiles.Add($f) }
}

Write-Host "`n--- 3 & 4. Missing Files ---"
Write-Host "Total missing: $($missingFiles.Count)"
$missingFiles | Group-Object { ($_.Split('\')[0]) } | Select-Object Name, Count | Format-Table -AutoSize
Write-Host "`n--- 5. First 200 Missing Paths ---"
$missingFiles | Select-Object -First 200
