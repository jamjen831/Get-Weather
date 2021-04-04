#Place this and Get-Weather.psm1 Module into C:\Scripts or modify $modPath value to point to the module.
#Run via Task Scheduler on a daily schedule re-ran every 5 minutes.
#Import the Module from file
$modPath = "C:\Scripts\Get-Weather.psm1"
Import-Module $modPath
#Set inital timer to zero and Polling time, in seconds
$timer = 0
$pollSec = 10
#Check if the timer is under 4min 50sec, run Get-Weather function and add 10 seconds to the timer. 
While($timer -lt 290){
    Get-Weather
    $timer = ($timer + $pollSec)
    Start-Sleep -Seconds $pollSec
    } 
