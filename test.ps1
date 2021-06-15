
param (
    [Parameter(Mandatory=$true)]
    [string] $VMResourceGroupName,

    [Parameter(Mandatory=$false)]
    [string] $VMName
    
)

Write-Output $VMResourceGroupName
Write-Output $VMName
Write-Output "Cambio"


