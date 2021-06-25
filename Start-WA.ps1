Param
(
    [Parameter(Mandatory=$false)]
    $ResourceGroupName,

    [Parameter(Mandatory=$false)]
    $Name,

    [Parameter(Mandatory=$false)]
    $TagName = $null
) 

$RunAsConnection = Get-AutomationConnection -Name AzureRunAsConnection

Add-AzureRmAccount `
    -ServicePrincipal `
    -TenantId $RunAsConnection.TenantId `
    -ApplicationId $RunAsConnection.ApplicationId `
    -CertificateThumbprint $RunAsConnection.CertificateThumbprint | Write-Verbose

Write-Output ("Starting WA " + $Name + " in resource group " + $ResourceGroupName)
    Start-AzWebApp -ResourceGroupName $ResourceGroupName -Name $Name | Write-Verbose
