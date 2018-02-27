$From = "From Address"
$To = "To Address"
$Cc = "gokulrajkumar.r@thestreet.com"
$Subject = "Email Subject"
$Body = "Insert body text here"
$SMTPServer = "SMTP Server"
$SMTPPort = "Port number"
Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject `
-Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl `
-Credential (Get-Credential)
