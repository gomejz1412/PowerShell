$Date, $env:Computername
$eventList = @()
Get-EventLog Security 4625,4634,4647,4624,4648,4675,6272,6273,6274,6275,6276,6277,6278,6279,6280 -After $Date `
     `
        | foreach-Object {
                $row = "" | Select UserName, LoginTime, machinename, instanceid, entrytype, message
                        $row.UserName = $_.ReplacementStrings[5]
                                $row.LoginTime = $_.TimeGenerated
                                            $row.machinename = $_.MachineName
                                                  $row.instanceid = $_.InstanceId
                                                         $row.entrytype = $_.EntryType
                                                                 $row.message = $_.Message
                                        $row


                                                } | out-file -FilePath .\Desktop\security.txt
                                                
                                                $eventList 