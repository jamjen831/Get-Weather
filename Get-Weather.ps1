#Place this and Get-Weather.psm1 Module into C:\Scripts or modify $modPath value to point to the module.
#Run via Task Scheduler on a daily schedule re-ran every 5 minutes.

#Set the Module (psm1) path
#Import the Module
$modPath = "C:\Scripts\Get-Weather.psm1"
Import-Module $modPath

#Set inital timer to zero
#Set polling frequesncy time, in seconds
$timer = 0
$pollSec = 10

#Check if the timer is under 4min 50sec. 
#Run the Get-Weather function if the is
#Add 10 seconds to the running timer
#wait 10 seconds before we check again. 
While($timer -lt 290){
    Get-Weather
    $timer = ($timer + $pollSec)
    Start-Sleep -Seconds $pollSec
    } 
