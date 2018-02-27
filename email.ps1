$From = "velkumar.l@thestreet.com"
$To = "velkumar.l@thestreet.com"
$Cc = "gokulrajkumar.r@thestreet.com"
$Subject = "Email Subject"
$Body = "Insert body text here"
$SMTPServer = "bxsmtppro"
$SMTPPort = "25"
Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject `
-Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl `
-Credential (Get-Credential)