$From = "from mail id"
$Subject = "Multi mail test"
$SMTPServer = "smtp server"
$SMTPPort = "portnumber"
$write = "Mail test"
$emailattachment = "C:\Users\Name\Desktop\Resume.pdf"

$a = "1@.com"
$v = "2@.com"
$z = "3@.com"
$1 = "4@.com"
$2 = "5@.com"
$d = $a
Foreach ($i in $d)
{
    $To = $i
        Send-MailMessage -From $From -to $To -Subject $Subject `
        -Body $write -Attachments $emailattachment -SmtpServer $SMTPServer -port $SMTPPort
} 
