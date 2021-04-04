 function Get-Weather {
    #Set City, API Key and units
    $cityID = "yourCityID" 
    $apiKey =  "yourAPIKey" 
    $units = "imperial"
    $callURL = "http://api.openweathermap.org/data/2.5/weather?id=$cityID&units=$units&appid=$apiKey"      
    
    #get the data and convert
    $initalJson = Invoke-RestMethod -UseBasicParsing "$callURL"
    $weatherData = ConvertTo-Json $initalJson | ConvertFrom-Json 
        
    #set weather variables from the polled data
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
    
    #Set Output, which variables to include and make the text file
    $outPath = "C:\Program Files (x86)\Blue Iris Tools\txt\temperature.txt"
    $weatherTxt = "$locName Temp:$realTempF Humidity:$hum% Cloud:$cldPrct% Pressure:$pres hpa" | Out-File -FilePath $outPath -Force -Encoding ascii
  }
  