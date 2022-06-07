$computername 
$now = Get-Date
$uptime = $now - $boot | select -ExpandProperty totalhours | foreach {$_.ToString("###.##")}

$os = Get-WmiObject win32_operatingsystem -Property caption,lastbootuptime -ComputerName $computername
$cdrive = Get-WmiObject win32_logicaldisk -Filter "deviceID='c:'" -ComputerName $computername
$freespace = $cdrive.FreeSpace /1GB -as [INT]
$boot = $os.ConvertToDateTime($os.LastBootUpTime)




$properties = [ordered]@{'computername' = $computername;
                         'OS' = $os.caption;
                         'Lastbootup' = $boot;
                         'uptimehours' = $uptime;
                         'C:Freespace' = $freespace
                         }    
$obj = New-Object -TypeName PSObject -Property $properties


$FormatEnumerationLimit = -1
Write-Output $obj