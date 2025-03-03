# Open Wallacoin in VSC:
#Start-Process "C:\Users\Richard\AppData\Local\Programs\Microsoft VS Code\Code.exe" "F:\DAW\projects\wallacoin-node"
code F:\DAW\projects\wallacoin-rest
code F:\DAW\projects\wallacoin-angular

#Chrome tabs:
$url1 = "https://chatgpt.com/"
$url2 = "http://localhost:4200"
$url3 = "http://localhost:8081"
$url4 = "https://github.com/RichardYusteDAW/notes/blob/master/JavaScript/frameworks/Angular/angular.md#112-de-hijo-al-padre-output"
$url5 = "https://github.com/RichardYusteDAW/notes"

# Open Chrome with URLs:
Start-Process "chrome.exe" "$url1 $url2 $url3 $url4 $url5"

# Open Wallacoin directory:
Invoke-Item "F:\DAW\projects\wallacoin-node"

# Close PowerShell window:
Stop-Process -Name powershell -Force