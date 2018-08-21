$Body = "Sample Email Body" 
$SmtpServer = 'smtp.gmail.com' 
$SmtpUser = 'velkumar1200@gmail.com' 
$smtpPassword = '<Input Gmail Account Password Here>' 
$MailtTo = 'velkumar1200@gmail.com' 
$MailFrom = 'velkumar1200@gmail.com' 
$MailSubject = "Testing Mail Attachments using $SmtpServer" 
$Credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $SmtpUser, $($smtpPassword | 
ConvertTo-SecureString -AsPlainText -Force) 
Send-MailMessage -To "$MailtTo" -from "$MailFrom" -Subject $MailSubject -Body "$Body" -Attachments "C:\PS\SampleAttachment.txt" -SmtpServer $SmtpServer -BodyAsHtml -UseSsl -Credential $Credentials 
write-Output "Custom Message : Attachment Email Sent to Business Users"
