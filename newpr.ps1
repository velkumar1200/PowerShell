$c = (Get-Date).TimeOfDay | Select-Object hours,minutes


Write-Host "Time is " $c

if($c.Hours -eq 16 -and $C.Minutes -eq 54)
{
   Start-Process -FilePath "OUTLOOK.EXE"

    Write-Host "Service Started"
}
else
{
    Write-Host "Is not the Time";
}
/-------------------------------------------------------------------------------

$d = Set-Location -Path 'C:\Users\Velkumar.L\AppData'

Get-ChildItem  -File

Get-ChildItem | Select-Object Mode,Name | Where{$_.Mode -in 'd----','d-r--'} 
/-------------------------------------------------------------------------------
GET ONLY FOLDER

Get-ChildItem | where{$_.PsIsContainer}