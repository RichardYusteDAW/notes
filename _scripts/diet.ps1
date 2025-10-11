# Open Wallacoin in VSC:
#Start-Process "C:\Users\Richard\AppData\Local\Programs\Microsoft VS Code\Code.exe" "F:\DAW\projects\wallacoin-node"
code D:\Escritorio\DIET\diet-back
code D:\Escritorio\DIET\diet-front

#Chrome tabs:
$url1 = "https://chatgpt.com/"
$url2 = "https://github.com/RichardYusteDAW/notes"
$url3 = "http://localhost:4200"

# Open Chrome with URLs:
Start-Process "chrome.exe" "$url1 $url2 $url3"

# Open Wallacoin directory:
Invoke-Item "F:\DAW\projects\wallacoin-node"

# Close PowerShell window:
Stop-Process -Name powershell -Force