#requires -RunAsAdministrator
# .\launch_only_{alpines,debians,lab}.ps1 -ExecutionPolicy Bypass
# Get-Vm | Where-Object { $_.Name -match 'Debian*' } | Start-Vm
# Get-Vm | Where-Object { $_.Name -match 'Alpine*' } | Start-Vm

$currentVms = Get-Vm | Select -expand Name
Write-Host "List of available vms: " $currentVms

# Confirmation of status
# sleep
Get-VM | Where { $_.State –eq ‘Running’ } 
