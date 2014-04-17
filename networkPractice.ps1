$Port = 161
$udpobject = New-Object system.Net.sockets.Udpclient
$udpobject.Connect(PC-TECHAIDE, $port)
$udpobject.Client.RecieveTimeout = 100

$byte = @(48,36,2,1,1,4,6,112,117,98,108,105,99,161,23,2,2,117,6,2,1,0,2,1,0,48,11,48,9,6,5,43,6,1,2,1,5,0) 
[void]$udpobject.Send($byte,$byte.length) 
$remoteendpoint = New-
Try  
                { 
                    # if SNMP is enabled the script will recieve some data back from 
                    # the pinged device 
                    $receivebytes = $udpobject.Receive([ref]$remoteendpoint) 
                    write-host "It WORKED, IT FREAKING WORKED"
                } 
                Catch  
                { 
                    # otherwise after 100 milliseconds the Recieve() function will throw a fault, 
                    # this try/catch statement supresses it 
		    write-host "YOU'VE FAILED"
                } 
                 
                $udpobject.Close()