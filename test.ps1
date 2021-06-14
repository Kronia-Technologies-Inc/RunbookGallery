
param (
    [Parameter(Mandatory=$true)]
    [string] $Command,

    [Parameter(Mandatory=$false)]
    [string] $Parameters
)
if ([string]::IsNullOrEmpty($Parameters))
{
    & $Command
}
else
{
    # Convert parameters from json into hash table so they can be passed to the command
    $Params = @{}
    Write-Error -Message $Command

}
