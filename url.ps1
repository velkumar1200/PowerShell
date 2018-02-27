[datetime]$alarmTime = "January 30, 2017 11:43:00 AM" 
$nowTime = get-date 
$tsSeconds = ($alarmTime - $nowTime).Seconds
$timeSpan = New-TimeSpan -Seconds $tsSeconds

$timer = New-Object System.Timers.Timer
Register-ObjectEvent -InputObject $timer -EventName Elapsed -Action { [System.Windows.Forms.MessageBox]::Show("Coffee Time over" , "Alert!") }
$timer.Autoreset = $false 
$timer.Interval = $timeSpan.TotalMilliseconds
$timer.Enabled = $true