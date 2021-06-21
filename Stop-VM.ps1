Param
(
    [Parameter(Mandatory=$true)]
    $VMResourceGroupName,

    [Parameter(Mandatory=$true)]
    $VMName,
    
    [Parameter(Mandatory=$true)]
    $AutomationAccount,

    [Parameter(Mandatory=$false)]
    $TagName = $null
) 

$RunAsConnection = Get-AutomationConnection -Name AzureRunAsConnection

Add-AzureRmAccount `
    -ServicePrincipal `
    -TenantId $RunAsConnection.TenantId `
    -ApplicationId $RunAsConnection.ApplicationId `
    -CertificateThumbprint $RunAsConnection.CertificateThumbprint | Write-Verbose

    Write-Output ("Stopping VM " + $VMName + " in resource group " + $VMResourceGroupName)
    Stop-AzureRmVM -ResourceGroupName $VMResourceGroupName -Name $VMName -Force | Write-Verbose
