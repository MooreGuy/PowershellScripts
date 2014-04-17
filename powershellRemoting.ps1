Enable-PSRemoting -Force
Test-WsMan
Invoke-Command -ComputerName Administrator74 -ScriptBlock {Get-ChildItem C:\} -credential rop
Enter-PSSession -ComputerName Administrator74 -Credential rop