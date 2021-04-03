﻿function Get-WeatherData {
    $cityID = "5393052" 
    #Write-Host $cityID
    $apiKey =  "e28110e8c1c5f11fcb929def472de104" 
    #Write-Host $apiKey
    $callURL = "http://api.openweathermap.org/data/2.5/weather?id=$cityID&units=imperial&mode=html&appid=$apiKey" 
    #Write-Host $callURL
    $script:html = Invoke-RestMethod -UseBasicParsing "$callURL" 
    #Write-Host $html
   } 

   function ConvertHtml-ToText {
 #Credit to Winston from with slight modifications
 #http://winstonfassett.com/blog/2010/09/21/html-to-text-conversion-in-powershell/
 param([System.String] $html)

 # remove line breaks, replace with spaces
 $html = $html -replace "(`r|`n|`t)", " "

 # remove invisible content
 @('head', 'style', 'script', 'object', 'embed', 'applet', 'noframes', 'noscript', 'noembed') | % {
  $html = $html -replace "<$_[^>]*?>.*?</$_>", ""
 }

 # Condense extra whitespace
 $html = $html -replace "( )+", " "
 $html = $html -replace "More..", ""


 # Add line breaks
 @('div','p','blockquote','h[1-9]') | % { $html = $html -replace "</?$_[^>]*?>.*?</$_>", ("`n" + '$0' )} 
 # Add line breaks for self-closing tags
 @('div','p','blockquote','h[1-9]','br') | % { $html = $html -replace "<$_[^>]*?/>", ('$0' + "`n")} 

 #strip tags 
 $html = $html -replace "<[^>]*?>", ""
  
 # replace common entities
 @( 
  @("&amp;bull;", " * "),
  @("&amp;lsaquo;", "<"),
  @("&amp;rsaquo;", ">"),
  @("&amp;(rsquo|lsquo);", "'"),
  @("&amp;(quot|ldquo|rdquo);", '"'),
  @("&amp;trade;", "(tm)"),
  @("&amp;frasl;", "/"),
  @("&amp;(quot|#34|#034|#x22);", '"'),
  @('&amp;(amp|#38|#038|#x26);', "&amp;"),
  @("&amp;(lt|#60|#060|#x3c);", "<"),
  @("&amp;(gt|#62|#062|#x3e);", ">"),
  @('&amp;(copy|#169);', "(c)"),
  @("&amp;(reg|#174);", "(r)"),
  @("&amp;nbsp;", " "),
  @("&amp;(.{2,6});", "")
 ) | % { $html = $html -replace $_[0], $_[1] }

 #Remove degree symbol
 $html = $html -replace "°",""
 
 #remove extra lines
 $html = $html -replace '\n+', ""
 #remove spaces
 $html = $html -replace '\s+'," "
 #$html = $html -replace '\s+',''
 #$html = $html -replace '(^\s+|\s+$)','' -replace '\s+',' ' 
 return $html

}

function Write-WeatherText {
  $outPath = "C:\Program Files (x86)\Blue Iris Tools\txt\temperature.txt"
  $weatherTxt = ConvertHtml-ToText $html |
  Out-File -FilePath $outPath -Force -Encoding ascii
  }

  function Get-Weather {
    Get-WeatherData | ConvertHtml-ToText | Write-WeatherText
    }