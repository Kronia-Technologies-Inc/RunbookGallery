Param
(
    [Parameter(Mandatory=$false)]
    $VMResourceGroupName,

    [Parameter(Mandatory=$false)]
    $VMName,

    [Parameter(Mandatory=$false)]
    $TagName = $null
) 

$RunAsConnection = Get-AutomationConnection -Name AzureRunAsConnection

Add-AzureRmAccount `
    -ServicePrincipal `
    -TenantId $RunAsConnection.TenantId `
    -ApplicationId $RunAsConnection.ApplicationId `
    -CertificateThumbprint $RunAsConnection.CertificateThumbprint | Write-Verbose

Write-Output ("Starting VM " + $VMName + " in resource group " + $VMResourceGroupName)
    Start-AzureRmVM -ResourceGroupName $VMResourceGroupName -Name $VMName | Write-Verbose
