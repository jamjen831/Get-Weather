# Get-Weather
Get OpenWeather info for BlueIris Overlay 
Currenlty using / moifiying HTML data but working on properly parsing the default JSON to be able to better manage the data
Steps:

    Head over toOpenWeatherMapand sign up for their free API access to current weather data. This allows for 1,000,000 free API calls per month.
        If we poll every 10 seconds we would have a maximum of (on 31-day months): [(60 seconds/min) * (60 min/hr) * (24 hr/day) * (31 days/month)]/(1 Poll /10 seconds) = 267,840 calls per month.
            Note - You can modify the $pollSec value in Get-Weather.ps1 to change the poll frequency (in seconds)
        Copy the API key (sent via email when ready)
    Find your locations "CityID". Easier way is to search for your city and then the ID from the 
    Grab the current scripts from here and place in C:\Scripts (or elsewhere and update paths in the script) :
        Get-Weather.psm1 is the module that does all the actual work
        Get-Weather.ps1 is the script we run that calls the Get-Weather function created in the Module (the psm1) every 10 seconds
    Enable Powershell scripts
        Open Powershell As Admin
        Run command "Set-ExecutionPolicy -Unrestricted
    Edit Get-Weather.ps1
        Set $cityID to the City ID found in step 2.1
        Set $ apiKey with your API key from 1.2
    Setup Windows Scheduled Task to run every 5 minutes:
    1. Open Windows task Scheduler
    2. Right-Click on "Task Scheduler Library" and chose "Create task"
    3. General Tab: Select "Run whether user is logged on or not"
    4. Trigger Tab: Click New
    5. Setting: Daily
    6. Advanced Settings: Repeat Task Every: 5 minutes for Duration of: 1 day
    7. Check "enabled"
    8. Actions Tab: Click New
    9. Program script: Powershell.exe
    10. Add Argument: -File c:\script\Get-Weather.ps1 (or wherever you have placed the script)
    11. Save (you will likely be prompted for a username and password, this will be used to run the task
    Check the temperature.txt to make sure it's being updated
