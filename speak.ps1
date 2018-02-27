Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
$speak.Rate   = -1  # -10 to 10; -10 is slowest, 10 is fastest
$speak.Speak("Hello...! ")
Write-Host ("Hello..! (>_<)")
$speak.Speak("what's your name..??") 
$name = Read-Host -Prompt "what's your name..?"
$speak.Speak( "Good Morning" + $name)
Write-Host "Good Moring..!" $name 
$speak.Speak(" I'm Red Queen.!")
Write-Host "I'm Red Queen..!" 
$speak.Speak("How are you " + $name )
$reply = Read-Host -Prompt "How are you"
$speak.Speak("Shall we speak....")
$var = Read-Host -Prompt "Shall we speak...."
if ($var -eq "yes") {
$speak.Speak("Did you wake up early in the morning..!")
Write-Host "Did you wake up early in the morning..!"
$answer = Read-Host -Prompt $a
if ($answer -eq "yes")
    {
        $speak.Speak("Woww.. That's great")
    }
else
    {
        $speak.Speak("Say yes or no")
    }
$speak.Speak("shall we start")
Write-Host "Shall we start"
$ans = Read-Host -Prompt $b
if ($answer -eq "yes")
    {
        $speak.Speak("Which Application you like to start")
        Write-Host "Which Application you like to start"
        $answer = Read-Host -Prompt $a
    if($answer -eq "calculator")
        {
            [System.Diagnostics.Process]::Start("c:\windows\system32\calc.exe")
            $speak.Speak("Your Application is Open Now")
        }
    if($answer -eq "Notepad")
        {
            [System.Diagnostics.Process]::Start("c:\windows\system32\notepad.exe")
            Start-Sleep -s 2
            $speak.Speak("Your Application is Open Now")
        }
    if($answer -eq "paint")
        {
            [System.Diagnostics.Process]::Start("c:\windows\system32\mspaint.exe")
            $speak.Speak("Your Application is Open Now")
        }
    if($answer -eq "chrome")
        {
            [System.Diagnostics.Process]::Start("C:\Program Files (x86)\Google\Chrome\Application\chrome.exe")
            $speak.Speak("Your Application is Open Now")
        }
    if($answer -eq "mozilla")
        {
            [System.Diagnostics.Process]::Start("C:\Program Files (x86)\Mozilla Firefox\firefox.exe")
        }
    }
    }
else 
    {
        $speak.Speak("Thanks for coming ...! ")
        Write-Host "Thanks for coming ...! "
    }
#/kill -processname chrome/#