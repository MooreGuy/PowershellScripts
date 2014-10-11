$currentDomain = (Get-WmiObject Win32_ComputerSystem).Domain
$computerName = Get-WmiObject Win32_ComputerSystem
$currentName = ($computerName).name
$myName = Read-Host "What would you like to name this computer? The current name is $currentName. Or enter exit"
$domainToSet = Read-Host "What Domain would you like to add this computer to? The current domain is $currentDomain."
$user = Read-Host "What user will join the computer to the domain?"

if($currentDomain -ne $domainToSet)
{
   Write-Host "The computer is not joined to the domain, $domaintoSet, but $currentDomain"
   $username = "$currentDomain\$user"

   Write-Host "Please enter the password for $user."
   $password = Read-Host -Prompt -AsSecureString"
   $crendential = New-Object System.Management.Automation.PSCredential($username,$password)
   try
   {
      Add-Computer -NewName $myName -DomainName $domainToSet -Credential $credential
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
         switch($computerName.ReturnValue)
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





