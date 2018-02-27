$date = (Get-Date).ToString("yyyy:MM:dd")
$gLog = ""
function fAddToLog($inMessage){
    write-host $inMessage
    return $inMessage+ "<br />"
    }
$gLog += fAddToLog "----------------------------------------------------------------------------------------------"
$gLog += fAddToLog "Checklist URL's Status - $date"
$gLog += fAddToLog "----------------------------------------------------------------------------------------------"

$Outputreport | out-file C:\Scripts\Test.htm 