param (
    [Parameter(Mandatory=$true)]
    $ParameterPath
)

$ParameterValues = Get-Content $ParameterPath | ConvertFrom-Json

$RGName = "${$ParameterValues.ResourceGroupName}"
$StorageAccountName = "${$ParameterValues.StagingStorageAccount}"
$StorageAccountResourceGroupName = "${$ParameterValues.StagingStorageAccountResourceGroupName}"

$RecoveryServiceVault = Get-AzRecoveryServicesVault -ResourceGroupName $RGName
Set-AzRecoveryServicesVaultContext -Vault $RecoveryServiceVault

Get-AzRecoveryServicesBackupContainer -ContainerType "AzureVM" | Where-Object Status -eq "Registered" | ForEach-Object {
    Write-Host "VMName $($_.FriendlyName)"
    $namedContainer = Get-AzRecoveryServicesBackupContainer -ContainerType "AzureVM" -FriendlyName $_.FriendlyName -VaultId $RecoveryServiceVault.ID
    $item = Get-AzRecoveryServicesBackupItem -Container $namedContainer -WorkloadType "AzureVM" -VaultId $RecoveryServiceVault.ID
    $startDate = (Get-Date).AddDays(-7)
    $rp = Get-AzRecoveryServicesBackupRecoveryPoint -Item $item -StartDate $startDate.ToUniversalTime() -VaultId $RecoveryServiceVault.ID
    $restoreJob = Restore-AzRecoveryServicesBackupItem -RecoveryPoint $rp[0] -StorageAccountName $StorageAccountName -StorageAccountResourceGroupName $StorageAccountResourceGroupName -VaultId $RecoveryServiceVault.ID -TargetResourceGroupName $RGName -VaultLocation $RecoveryServiceVault.Location
    $restoreJob
}
