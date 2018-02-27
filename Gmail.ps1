$Body = "Sample Email Body" 
$SmtpServer = 'smtp.gmail.com' 
$SmtpUser = 'kspriyaranjan@gmail.com' 
$smtpPassword = '<Input Gmail Account Password Here>' 
$MailtTo = 'priyaranjan.ks@hotmail.com' 
$MailFrom = 'kspriyaranjan@gmail.com' 
$MailSubject = "Testing Mail Attachments using $SmtpServer" 
$Credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $SmtpUser, $($smtpPassword | 
ConvertTo-SecureString -AsPlainText -Force) 
Send-MailMessage -To "$MailtTo" -from "$MailFrom" -Subject $MailSubject -Body "$Body" -Attachments "C:\PS\SampleAttachment.txt" -SmtpServer $SmtpServer -BodyAsHtml -UseSsl -Credential $Credentials 
write-Output "Custom Message : Attachment Email Sent to Business Users"