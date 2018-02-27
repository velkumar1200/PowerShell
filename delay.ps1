$c = (Get-Date).Minute
  $t = $c + 1;
  Start-Sleep -s 60
  $d = (Get-Date).Minute
if ($d -eq $t)
{
    Stop-Process -ProcessName OUTLOOK
    Write-Host "ehllo"
}
Else
 {

    Write-Host "wrong"
 }