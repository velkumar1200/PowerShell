###################################################################
# @ Velkumar
# @ Script for Daily CheckList Taken by
####################################################################
$From = "From address"
$To = "To address"
$Subject = "Daily Checklist Taken"
$SMTPServer = "smtp server"
$SMTPPort = "portnumber"
#Specify the path of the excel file
$p = cd "X:\Checklist"
$a = Get-ChildItem | where {$_.LastWriteTime}|select -Last 1
$b = Get-ChildItem | where {$_.LastWriteTime}|select -Last 1 Name
$FileName = ($b).Name
$FilePath = ($a).FullName
#Specify the Sheet name
$SheetName = "sheet1"
# Create an Object Excel.Application using Com interface
$objExcel = New-Object -ComObject Excel.Application
# Disable the 'visible' property so the document won't open in excel
$objExcel.Visible = $false
# Open the Excel file and save it in $WorkBook
$WorkBook = $objExcel.Workbooks.Open($FilePath)
# Load the WorkSheet 'BuildSpecs'
$WorkSheet = $WorkBook.sheets.item($SheetName)
$write = ""
function MsgCnt($inMessage){
    write-host $inMessage
    return $inMessage+ "`n"
    }
$output = [pscustomobject][ordered]@{
    "Monday        "="    "+$WorkSheet.Range("D11").Text+"`n`t"
    "Tuseday        "="    "+$WorkSheet.Range("F11").Text+"`n`t"
    "Wednesday   "="    "+$WorkSheet.Range("H11").Text+"`n`t"
    "Thursday       "="    "+$WorkSheet.Range("J11").Text+"`n`t"
    "Friday           "="    "+$WorkSheet.Range("L11").Text+"`n"
    }
$a = $output -replace ("@"," " ) -replace("{","") -replace("}","") -replace(";","")
$header ="Members taken the CheckList"
$s = ($header).ToUpper()
$write+= MsgCnt "File Name: $FileName"
$write+= MsgCnt "-----------------------------------------------------------------------------------"
$write+= MsgCnt "`t`t$s"
$write+= MsgCnt "-----------------------------------------------------------------------------------"
$write+= MsgCnt "`t$a`t"
$write+= MsgCnt "-----------------------------------------------------------------------------------"
$WorkBook.Save()
$WorkBook.Close()
$objExcel.Quit()
$date=(Get-Date).DayOfWeek
if($date -eq "Friday")
{
$To = "To address"
$cc = "CC address"
Send-MailMessage -From $From -to $To -Cc $cc -Subject $Subject `
-Body $write -SmtpServer $SMTPServer -port $SMTPPort 
}
else{
Send-MailMessage -From $From -to $To -Subject $Subject `
-Body $write -SmtpServer $SMTPServer -port $SMTPPort
}
