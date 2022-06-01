# Logging
New-Item -itemType Directory -Path "C:\" -Name "Temp" -ErrorAction SilentlyContinue
New-Item -ItemType File -Path "C:\Temp" -Name "ms_msdt_log.log" -Force
Start-Transcript -Append C:\Temp\ms_msdt_log.log

Write-Output "Starting detection for MSDT registry key"

# create a PSDrive for HKey_Classes_Root hive
New-PSDrive -PSProvider Registry HKCR -Root HKEY_CLASSES_ROOT -ErrorAction SilentlyContinue
Test-Path -Path 'HKCR:\ms-msdt'

if (Test-Path -Path 'HKCR:\ms-msdt') {
    Write-Output "Above result is True, exiting 1"
    Remove-PSDrive -Name HKCR
    Stop-Transcript
    Exit 1
}
else {
    Write-Output "Above result is False, exiting 0"
    Remove-PSDrive -Name HKCR
    Stop-Transcript
    Exit 0
}
