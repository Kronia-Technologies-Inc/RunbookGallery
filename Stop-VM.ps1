Param
(
    [Parameter(Mandatory=$true)]
    $ResourceGroupName,

    [Parameter(Mandatory=$true)]
    $Name,
    
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

    Write-Output ("Stopping VM " + $Name + " in resource group " + $ResourceGroupName)
    Stop-AzureRmVM -ResourceGroupName $ResourceGroupName -Name $Name -Force | Write-Verbose
