<#
$webConfigFile = "C:\Users\danny.call\source\repos\redboneplatform\RedBonePlatform\RedBonePlatform\Web.config"
$commentStringToMatch = "truckingwizard.com\\;Initial Catalog=RedBone"
#-----------------

$xmlFile = [xml](Get-Content $webConfigFile)   
$comments = $xmlFile.configuration.connectionStrings.SelectNodes("//comment()")

foreach ($c in $comments) {
    if ($c.InnerText -match $commentStringToMatch) {
        $theThingXml = [xml]$c.InnerText
    }
}

#Write-Output $theThingXml.add.connectionString.Split(";")[4].Split("=")[1]
#>



<#
$serverInstance = "YourServer"
$database = "YourDatabase"
$scriptFile = "C:\Users\danny.call\zmisc\SQL\temp.sql"
$param1 = "Value1"
$param2 = "Value2"

Invoke-Sqlcmd -ServerInstance $serverInstance -Database $database -InputFile $scriptFile -Variable "Param1=$param1", "Param2=$param2"
#>

<#
$serverInstance =   "localhost\SQLEXPRESS"
$database =         "RedBone"
$scriptFile =       "C:\Users\danny.call\zmisc\SQL\temp.sql"
$username =         "RedboneDB2"
$password =         "oROd5ITSqEgh"
#$credential = New-Object System.Management.Automation.PSCredential($username, $password)
#>

#Invoke-Sqlcmd -ServerInstance $serverInstance -Database $database -InputFile $scriptFile -Credential $credential
#Invoke-Sqlcmd -ServerInstance $serverInstance -Database $database -Username $username -Password $password -InputFile $scriptFile

Invoke-Sqlcmd -ServerInstance localhost\SQLEXPRESS -Database RedBone -InputFile C:\Users\danny.call\zmisc\SQL\temp.sql

#sqlcmd -S localhost\SQLEXPRESS -d RedBone -U RedboneDB2 -P oW9JlqE@1Xvh34 -i C:\Users\danny.call\zmisc\SQL\temp.sql
