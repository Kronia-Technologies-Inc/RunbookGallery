Param
(
    [Parameter(Mandatory=$false)]
    $WAResourceGroupName,

    [Parameter(Mandatory=$false)]
    $WAName,

    [Parameter(Mandatory=$false)]
    $TagName = $null
) 

$RunAsConnection = Get-AutomationConnection -Name AzureRunAsConnection

Add-AzureRmAccount `
    -ServicePrincipal `
    -TenantId $RunAsConnection.TenantId `
    -ApplicationId $RunAsConnection.ApplicationId `
    -CertificateThumbprint $RunAsConnection.CertificateThumbprint | Write-Verbose

Write-Output ("Starting WA " + $WAName + " in resource group " + $WAResourceGroupName)
    Start-AzWebApp -ResourceGroupName $WAResourceGroupName -Name $WAName
