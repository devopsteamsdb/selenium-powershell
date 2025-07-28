# Published to dockerhub at devopsteamsdb/devopsteamsdb:selenium_powershell_latest

# Use this sample script.ps1
```
# Import Module
Import-Module Selenium

# Set Chrome options
$chromeOptions = New-Object OpenQA.Selenium.Chrome.ChromeOptions
$chromeOptions.AddArgument("--headless=new")
$chromeOptions.AddArgument("--no-sandbox")
$chromeOptions.AddArgument("--disable-dev-shm-usage")

# Start ChromeDriver (adjust path if needed)
$service = [OpenQA.Selenium.Chrome.ChromeDriverService]::CreateDefaultService("/usr/local/bin")
$driver = New-Object OpenQA.Selenium.Chrome.ChromeDriver($service, $chromeOptions)

# Go to website
$driver.Navigate().GoToUrl("https://www.google.com")

# Output page title
Write-Host "Page Title:" $driver.Title

# Clean up
$driver.Quit()# Set Chrome options
$chromeOptions = New-Object OpenQA.Selenium.Chrome.ChromeOptions
$chromeOptions.AddArgument("--headless=new")
$chromeOptions.AddArgument("--no-sandbox")
$chromeOptions.AddArgument("--disable-dev-shm-usage")

# Start ChromeDriver (adjust path if needed)
$service = [OpenQA.Selenium.Chrome.ChromeDriverService]::CreateDefaultService("/usr/local/bin")
$driver = New-Object OpenQA.Selenium.Chrome.ChromeDriver($service, $chromeOptions)

# Go to website
$driver.Navigate().GoToUrl("https://www.google.com")

# Output page title
Write-Host "Page Title:" $driver.Title

# Clean up
$driver.Quit()
```

Run the script
docker run --rm -v "$PWD:/app" -w /app devopsteamsdb/devopsteamsdb:selenium_powershell_latest pwsh ./script.ps1
