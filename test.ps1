
param (
    [Parameter(Mandatory=$true)]
    [string] $VMResourceGroupName,

    [Parameter(Mandatory=$false)]
    [string] $VMName
    
    [Parameter(Mandatory=$false)]
    $TagName = $null
)
if ([string]::IsNullOrEmpty($Parameters))
{
    & $VMResourceGroupName
}
else
{
    Write-Output $VMResourceGroupName
    Write-Output $VMName

}
