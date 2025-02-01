param (
    [Parameter(Mandatory=$true)]
    $ParameterPath
)

$ParameterValues = Get-Content $ParameterPath | ConvertFrom-Json

$RGName = "${$ParameterValues.ResourceGroupName}"

$RecoveryServiceVault = Get-AzRecoveryServicesVault -ResourceGroupName $RGName
Set-AzRecoveryServicesVaultContext -Vault $RecoveryServiceVault

Get-AzRecoveryServicesBackupContainer -ContainerType "AzureVM" | Where-Object Status -eq "Registered" | ForEach-Object -Parallel {
    Write-Host "VMName $($_.FriendlyName)"
    $namedContainer = Get-AzRecoveryServicesBackupContainer -ContainerType "AzureVM" -FriendlyName $_.FriendlyName -VaultId $RecoveryServiceVault.ID
    $item = Get-AzRecoveryServicesBackupItem -Container $namedContainer -WorkloadType "AzureVM" -VaultId $RecoveryServiceVault.ID
    $endDate = (Get-Date).AddDays(60).ToUniversalTime()
    $job = Backup-AzRecoveryServicesBackupItem -Item $item -VaultId $RecoveryServiceVault.ID -ExpiryDateTimeUTC $endDate
    $jobid = $job.JobID
    [array]$combine += $jobid
}

$combine

$combine | ForEach-Object {
    $JobDetails = Get-AzRecoveryServicesBackupJobDetail -JobId $_ -VaultId $RecoveryServiceVault.ID
    while ($JobDetails.Status -eq "InProgress") {
        Write-Host "Still Backup is in process $($_)"
        Start-Sleep -Seconds 10
        $JobDetails = Get-AzRecoveryServicesBackupJobDetail -JobId $_ -VaultId $RecoveryServiceVault.ID
    }
    $JobDetails
}
