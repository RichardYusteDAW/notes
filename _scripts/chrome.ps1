#Chrome tabs:
$url1 = "https://chatgpt.com/"
$url2 = "https://github.com/RichardYusteDAW/notes/blob/master/index.md"
$url3 = "http://localhost:8080/"

# Open Chrome with URLs:
Start-Process "chrome.exe" "$url1 $url2 $url3"

# Open Wallacoin Mockup in Chrome:
Start-Process "chrome.exe" "file:F:\DAW\projects\wallacoin\design\2.mockUp\MockUp2.pdf"

# Open Wallacoin in VSC:
#Start-Process "C:\Users\Richard\AppData\Local\Programs\Microsoft VS Code\Code.exe" "F:\DAW\projects\wallacoin-node"
code F:\DAW\projects\wallacoin-node\

# Open Wallacoin directory:
Invoke-Item "F:\DAW\projects\wallacoin-node"

# Close PowerShell window:
Stop-Process -Name powershell -Force