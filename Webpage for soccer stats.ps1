$webdata = @{
    name =          'Lacago'
    fontcolor =     'red'
    fontfamily =    'arial'
    type       =    'soccer'
    age        =    12
    Season     =    2021
}

$os = Get-WmiObject win32_operatingsystem -ErrorAction SilentlyContinue
$uptime = (get-date) - $os.converttodatetime($os.lastbootuptime)
$downtime = (get-date).addhours(-8.5) - $os.converttodatetime($os.lastbootuptime)

$htmlpage = "
<html>
<head>
<title>$($webdata.name)'s web page!</title>
</head>
<body>
<{0}>welcome to $($webdata.name)'s web page!</{0}>
<p>
<font color=""$($webdata. fontcolor)"">$($webdata.name)'s age is ""$($webdata.age)"".</font>
<p>
This means she played $($webdata.type) during $($webdata.season) season.
<p>
current date and time: $($(get-date -format f))
<p>
<pre>
</pre>
</body>
</html>
" -f 'h1'

$file = "C:\powershell\mywebpage.html"
Set-Content -Path $file -value $htmlpage
Invoke-Item $file