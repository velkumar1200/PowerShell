###################################################################
# @ Velkumar
# @ Script for Concordance Screenshot
####################################################################

##  Login Credential

$From = "velkumar.l@thestreet.com"
$To = "velkumar.l@thestreet.com"
$Subject = "Concordance ScreenShot"
$SMTPServer = "bxsmtppro"
$SMTPPort = "25"

##  Move Old File
$Date = Get-date -UFormat "%Y%m%d"
$Path = cd "X:\Technology\PTS\India\Concordance_spot\Latest"
$Last = Get-ChildItem | where {$_.LastWriteTime}|select -Last 1 LastWriteTime
$LastFileDate = (Get-date -UFormat '%Y%m%d' (($Last).LastWriteTime))
if(($LastFileDate) -lt $Date)
    {
        $LastFile=Get-ChildItem | where {$_.LastWriteTime}|select -Last 1
        Move-Item $LastFile "X:\Technology\PTS\India\Concordance_spot\Older\$LastFileDate.Concordance.jpg"
        Write-host "correct"
    }
else
    {
        Write-Host "There is no old files."
    }

##  ScreenShot Operation
        $ie = New-Object -ComObject InternetExplorer.Application
        $ie.Visible = $true
        $ie.Navigate("https://confluence.thestreet.com/display/BP/Concordance+Customers")
        $ie.FullScreen = $true
        while($ie.busy -eq $true ){
        Start-Sleep -Seconds 10
        }
        Add-Type -AssemblyName System.Drawing
        $bitmap = New-Object -TypeName System.Drawing.Bitmap -ArgumentList $ie.Width, $ie.Height
        $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
        $graphics.CopyFromScreen($ie.Left, $ie.Top, 0, 0, $bitmap.Size)

        $ie.Quit()
        $bitmap.Save("X:\Technology\PTS\India\Concordance_spot\Latest\Concordance.jpg")

##  File Name
$New = Get-ChildItem | where {$_.LastWriteTime}|select -Last 1 Name
$FileName = ($New).Name
Write-Host $FileName

##  HTML

$body = @' 
<!DOCTYPE HTML>
<html>  
<style>
.center {
    text-align:center;
	color:#214F83;
	border: 3px solid;
    border-color:#214F83;
	border-radius:15px;
}
</style>
  <body> 
<div class="center">  
  <h1><p >Concordance</p></h1>
  </div>
    <img src='X:\Technology\PTS\India\Concordance_spot\Latest\Concordance.jpg' /><br />
  </body>  
</html>  
'@ 

##  Send Mail

Send-MailMessage -From $From -to $To -Subject $Subject `
-BodyAsHtml $body -SmtpServer $SMTPServer -port $SMTPPort