# Get-Weather

Get OpenWeather info for BlueIris Overlay (or anything that want's a text file) 

Now using default JSON, allowing for getting more data and easier manipulation.  Older HTML version preserved as htm-old.psm1 file

Steps:

    1. Head over to OpenWeatherMap and sign up for their free API access to current weather data. This allows for 1,000,000 free API calls per month.

         Note - You can modify the $pollSec value in Get-Weather.ps1 to change the poll frequency (in seconds)

    2. Copy the API key (sent via email when ready)

    3. Find your locations "CityID" by searching OpenWeatherMap.  City ID can be found in the url for your Cities current weather conditions  

    4. Grab the current scripts from here and place in C:\Scripts (or elsewhere and update paths in the script) :

        a. Get-Weather.psm1 is the module that does all the actual work

        b. Get-Weather.ps1 is the script we run that calls the Get-Weather function created in the Module (the psm1) every 10 seconds

    5. Enable Powershell scripts

       Open Powershell As Admin

       Run command "Set-ExecutionPolicy -Unrestricted

    6. Edit Get-Weather.ps1

           a. Set $cityID to the City ID 

           b. Set $ apiKey with your API key 

    7. Setup Windows Scheduled Task to run every 5 minutes:

           a. Open Windows task Scheduler

           b. Right-Click on "Task Scheduler Library" and chose "Create task"

           c. General Tab: Select "Run whether user is logged on or not"

           d. Trigger Tab: Click New

           e. Setting: Daily

           f. Advanced Settings: Repeat Task Every: 5 minutes for Duration of: 1 day

           g. Check "enabled"

           h. Actions Tab: Click New

           i. Program script: Powershell.exe

           j. Add Argument: -File c:\script\Get-Weather.ps1 (or wherever you have placed the script)

           k. Save (you will likely be prompted for a username and password, this will be used to run the task

    8.Check the temperature.txt to make sure it's being updated

