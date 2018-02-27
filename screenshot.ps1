$ie = New-Object -ComObject InternetExplorer.Application

$ie.Visible = $true;

$Yourwebpage = $ie.navigate('https://confluence.thestreet.com/display/BP/Concordance+Customers')

while($Yourwebpage.Busy){Start-Sleep -Seconds 5}

#capturing the screenshot

$file = "P:\$(Get-Date -Format dd-MM-yyyy-hhmm).png"

Add-Type -AssemblyName System.Windows.Forms

Add-type -AssemblyName System.Drawing

$Screen = [System.Windows.Forms.SystemInformation]::VirtualScreen

$width = $Screen.width

$Height = $Screen.Height

$Left = $Screen.Left

$Right = $Screen.Right

$Top = $Screen.Top

$Bottom = $Screen.Bottom

$bitmap = New-Object System.Drawing.Bitmap $width, $Height

$Graphics = [System.Drawing.Graphics]::FromImage($bitmap)

$Graphics.CopyFromScreen($Left, $Top, 0, 0, $bitmap.Size)

$bitmap.Save($File)

Write-Output "Screenshot saved to:"

Write-Output $File