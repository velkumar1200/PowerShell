$From = "velkumar.l@thestreet.com"
$Subject = "Multi mail test"
$SMTPServer = "bxsmtppro"
$SMTPPort = "25"
$write = "Mail test"
$emailattachment = "C:\Users\Velkumar.L\Desktop\Resume.pdf"

$a = "AEE.Phils.Sourcing@accenture.com"
$b = "akshay.chauhan@collabera.com"
$c = "AmzadKhan_F@symantec.com"
$e = "aritra.a@hcl.com"
$f = "ashwini.chandramouli@aspiresys.com"
$g = "B_Prasanna@symantec.com"
$h = "careers@phaccenture.com"
$i = "cmiller@thoughtworks.com"
$j = "escott@thoughtworks.com"
$k = "ganesh.x.ramakrishnan@oracle.com"
$l = "hr@mindcurv.com"
$m = "jobs@zohocorp.com"
$n = "Manjula.anand@lntinfotech.com"
$o = "mara.t.c.morelos@accenture.com"
$p = "necyriac@thoughtworks.com"
$q = "pradipta.bagchi@tcs.com"
$r = "Prem.navaz@cognizant.com"
$s = "PriyaBade@hexaware.com"
$t = "retailjb@microsoft.com"
$u = "revathi.pk@zohocorp.com"
$v = "saranya.krishnan@aspiresys.com"
$w = "shamala.p@tcs.com"
$y = "snario@thoughtworks.com"
$z = "Tusha.Gosavi@amdocs.com"
$1 = "vijay.ba@zohocorp.com"
$2 = "zuberahmed_s@hcl.com"
$d = $a
Foreach ($i in $d)
{
    $To = $i
        Send-MailMessage -From $From -to $To -Subject $Subject `
        -Body $write -Attachments $emailattachment -SmtpServer $SMTPServer -port $SMTPPort
} 

#Clear-Host
#$path = "C:\Users\Velkumar.L\Desktop"
#Foreach ($i in Get-Content email.txt)
#{
#    Write-Host("Email Address: " + $i)
#}
#$htmlexport = @"
#<html>
#<head>
#<body>
#<p>
#Hi,<br />
#&nbsp;&nbsp;&nbsp;&nbsp;Hope all is well with you!<br />
#&nbsp;&nbsp;&nbsp;&nbsp;With this mail i have attached my Resume. Please let me know if any vacancy matchs my profile. Please find the attachment
#<br />
#<br /><b>
#Kind Regards,</b><br />
#Velkumar L
#</p>
#</body>
#</html>
#"@
#Send-MailMessage -From $From -to $To -Subject $Subject `
#-Body $htmlexport -BodyAsHtml -Attachments $emailattachment -SmtpServer $SMTPServer -port $SMTPPort