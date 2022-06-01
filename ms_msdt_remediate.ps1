Start-Transcript -Append C:\Temp\ms_msdt_log.log

Write-Output "Starting remediation for MSDT registry key"

# export key to c:\temp
Write-Output "Exporting ms_msdt key"
reg export HKEY_CLASSES_ROOT\ms-msdt c:\temp\ms_msdt.reg

# nuke the key
Write-Output "Deleting ms_msdt key"
reg delete HKEY_CLASSES_ROOT\ms-msdt /f

Write-Output "Remediation complete"
Stop-Transcript
