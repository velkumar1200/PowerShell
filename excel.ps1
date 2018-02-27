
$number = 10
function fTimesTen{
    for($i=1; $i -le $number; ++$i)
    {
        if ($number%$i -eq 0)
        {
            Write-Host($i);
        }
    }

    return;
    }
    Write-Host (fTimesTen);