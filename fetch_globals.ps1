# gets the globals from ESOUI wiki and saves as ps1 and lua
# don't abuse them
# also there is over 12k of these and ps bails at 4096
$d = "$" # hack - don't care

"# generated with fetch_globals.ps1" | Out-File -FilePath "globals.ps1"
"-- generated with fetch_globals.ps1" | Out-File -FilePath "globals.lua"
$req = (Invoke-webrequest -URI "https://wiki.esoui.com/Constant_Values")
foreach ($tr in $req.ParsedHtml.getElementsByTagName('table')[0].getElementsByTagName('tbody')[0].getElementsByTagName('tr')) {
    # write-host $tr.innerHTML
    $key = $tr.getElementsByTagName('td')[0].getElementsByTagName('div')[0].innerHtml
    $value = $tr.getElementsByTagName('td')[1].innerHtml
    
    write-host "$($key) = $($value)"
    "$($d)$($key) = $($value)" | Out-File -FilePath "globals.ps1" -Append
    "$($key) = $($value)" | Out-File -FilePath "globals.lua" -Append

}