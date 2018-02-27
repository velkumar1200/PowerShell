################################################################################
#   Move files from source to Destination and print No. of Files and its Details
#
#   Created By VELKUMAR
#
#################################################################################

#    If(Test-Path ./Destination -or Test-Path ./upsc ){
#    write-host 'File Exist'
#    Write-Host 'Checking for files....'
#    }
#    else{
#        $Descre = New-Item -Path 'C:\Users\Vel\Desktop\Destination' -ItemType "directory" # create Destination folder
#        $Srccre = New-Item -Path 'C:\Users\Vel\Desktop\upsc' -ItemType "directory" # create Source folder
#    }


$Srclocationchange = Set-Location C:\Users\Vel\Desktop # set location 
$Src = Get-childItem upsc   # get all the files and subfolder in the current folder "upsc"
$Filename = ($Src).Name  #get all files name
$SrcTotalFiles = $Src.Count  #get number of files present in the folder.

$DesTotalFiles = (Get-ChildItem -Path 'C:\Users\Vel\Desktop\Destination').count
$Des =  Get-ChildItem destination
$Desfile = ($Des).Name
$DesTotalFiles = $Des.Count 
# (Get-ChildItem | ?{ $_.PSIsContainer }) // command to find folders only

function Msg{
    
    write-Host "========================================"
    Write-Host "Files Present in the folder"
    write-Host "========================================"
}

if($SrcTotalFiles -ne 0 ){
    $id = 1    
    Msg                               
    foreach($in in $Src)
    {
        Get-ChildItem -Path 'C:\Users\Vel\Desktop\upsc' -Recurse -File | Move-Item -Destination 'C:\Users\Vel\Desktop\Destination'
        Remove-Item -path 'C:\Users\Vel\Desktop\upsc\*' -Recurse
    }
    
    Write-host "TotalFiles: "$SrcTotalFiles
    Write-Host "Files Present"
    foreach($ins in $Filename){
    Write-host "File: $id" $ins
    $id++
    }
}
if($DesTotalFiles -ne 0 ){
    $id = 1
    Msg
    foreach($in in $Des)
    {
    
        Get-ChildItem -Path 'C:\Users\Vel\Desktop\Destination' -Recurse -File | Move-Item -Destination 'C:\Users\Vel\Desktop\upsc'
        Remove-Item -path 'C:\Users\Vel\Desktop\Destination\*' -Recurse
    }

    Write-host "TotalFiles: "$DesTotalFiles
    Write-Host "Files Present"
    foreach($ins in $Desfile){
    Write-host "File: $id" $ins
    $id++
    }
    
}
else {
    Write-host "No match"
}