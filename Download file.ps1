 $Path = "P:\temp\company_list.xlsx" 
 $source = Start-BitsTransfer -Source "http://www.londonstockexchange.com/statistics/companies-and-issuers/companies-defined-by-mifir-identifiers-list-on-lse.xlsx" -Destination $Path
Write-Host "File Downloaded in $path"