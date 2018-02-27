$inUsername = "sa"
$inPassword = "TDIN531$"
$inSQLServer = "TDIN531"
$inSQL = "exec [MozendaAdmin].[dbo].[pr_MZGetAgentModificationsList] @inReview = 3 "
Invoke-Sqlcmd -ServerInstance $inSQLServer -Username $inUsername -Password $inPassword -Query $inSQL -ErrorAction Stop | Format-Table -Property CollectionID,'Date Changed',Agent,Review  | Export-Csv D:\MDL\sql.csv