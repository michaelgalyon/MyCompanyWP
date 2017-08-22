[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint.Client")

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint.Client.Runtime")

Function Get-ClientContext([string]$Url,[string]$UserName,[string]$Password)
{
    $SecurePassword = $Password | ConvertTo-SecureString -AsPlainText -Force
    $context = New-Object Microsoft.SharePoint.Client.ClientContext($Url)
    $context.Credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($UserName, $SecurePassword)
    return $context
}

Function Uninstall-AppInstance([Microsoft.SharePoint.Client.ClientContext]$Context,[Guid]$AppInstanceId)

{

   $appInst = $Context.Web.GetAppInstanceById($AppInstanceId)

   $appInst.Uninstall()

   $context.ExecuteQuery()

 }

$UserName = "admin.galyon@olympus-ossa.com"

$Password=Read-Host -Prompt "Password" -AsSecureString;

$Url = "https://olympusssa.sharepoint.com/sites/GalyonTest/"

$AppInstanceid = New-Object Guid("1cc03c1c-f985-4768-b2a9-e7e1b9e673d0") #you need to specify App Instance Id here

$context = Get-ClientContext -Url $Url -UserName $UserName -Password $Password

Uninstall-AppInstance -Context $context -AppInstanceId $AppInstanceid

$context.Dispose()