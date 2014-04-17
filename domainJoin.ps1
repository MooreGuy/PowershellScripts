$domain = (Get-WmiObject Win32_ComputerSystem).Domain
$computerName = Get-WmiObject Win32_ComputerSystem
$currentName = ($computerName).name
$myName = Read-Host "What would you like to name this computer? The current name is $currentName. Or enter exit"
if($domain -ne "templetonusd.org")
{
   Write-Host "The computer is not joined to the domain, templetonusd.org, but $domain"
   $domain = "templetonusd.org"
   $user = rop
   $username = "templetonusd.org\$user"
   $password = Read-Host -Prompt -AsSecureString"
   $crendential = New-Object System.Management.Automation.PSCredential($username,$password)
   try
   {
      Add-Computer -NewName $myName -DomainName $domain -Credential $credential
      Restart-Computer -force
   }
   catch
   {
      Write-Host "Exception occurred in Rename-Computer " $Error
   }
}


else
{
   if($myName -ne "exit")
   {
      try
      {
         $computername.rename($myName)
         switch($computername.ReturnValue)
         {
            
            0{
               Write-Host "Success"
               Restart-Computer -force
            }

            
            5{
               Write-Host "You need administrator privilleges"
               exit
            }
         }
      }
      catch
      {
         Write-Host "Exception occurred in Rename-Computer " $Error
      }
   }
}
write-host "This shouldn't have happened but it did"
Restart-Computer -force





