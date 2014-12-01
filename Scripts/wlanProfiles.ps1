$run = 0;

do
{
	$profile = "Default"

	netsh wlan show profiles

	write-host "Please enter the profile you would like to view."

	$profile = read-host "Profile name"

	netsh wlan show profiles name=$profile key=clear

	$run = read-host "Press (y) to run again"
}
while ( $run -eq "y" ) 
