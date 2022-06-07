clear-host
set-location C:\Pass

$passwordlength = 88                
$uppercaseletters = (65..90)
$lowercaseletters = (97..122)
$numberszerothroughnine = (48..57)
$specialcharacters = (33..47)
$morespecialcharacters = (58..64)
$curlybrackets = (123..126)



$a = -join ($uppercaseletters +
           $lowercaseletters +
           $numberszerothroughnine +
           $morespecialcharacters +
           $curlybrackets |
Get-Random -Count $passwordlength | % {[char]$_})
$a
$a | clip