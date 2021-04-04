 function Get-Weather {
    #Set City, API Key and units
    #Create the query URL for our weather Data
    $cityID = "yourCityID" 
    $apiKey =  "yourAPIKey" 
    $units = "imperial"
    $callURL = "http://api.openweathermap.org/data/2.5/weather?id=$cityID&units=$units&appid=$apiKey"      
    
    #get the data, process the raw data as JSON, then turn it into an object
    $initalJson = Invoke-RestMethod -UseBasicParsing "$callURL"
    $weatherData = ConvertTo-Json $initalJson | ConvertFrom-Json 
        
    #set weather variables from the wather object
    $Lat = $weatherData.coord.lat
    $Lon = $weatherData.coord.lon
    $realTemp = $weatherData.main.temp
    $feelTemp = $weatherData.main.feels_like
    $maxTemp  = $weatherData.main.temp_max
    $minTemp = $weatherData.main.temp_min
    $pres = $weatherData.main.pressure
    $hum = $weatherData.main.humidity
    $vis = $weatherData.visibility
    $wndSpd = $weatherData.wind.speed
    $wndDeg = $weatherData.wind.deg
    $wndGst = $weatherData.wind.gust
    $cldPerct = $weatherData.clouds.all
    $locName = $weatherData.name 
    
    #Set Output Path 
    #Select which variables and static text to include and write the text file
    $outPath = "C:\Program Files (x86)\Blue Iris Tools\txt\temperature.txt"
    $weatherTxt = "$locName Temp:$realTemp F Humidity:$hum% Cloud:$cldPrct% Pressure:$pres hpa" | Out-File -FilePath $outPath -Force -Encoding ascii
  }
  
