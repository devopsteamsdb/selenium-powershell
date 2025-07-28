# 🧪 Selenium PowerShell Docker Image

✅ **Published to DockerHub**  
`devopsteamsdb/devopsteamsdb:selenium_powershell_latest`

A minimal Docker image for running PowerShell scripts with Selenium and Chrome in headless mode.

---

## 🚀 Quick Start

1. **Create a PowerShell script (`script.ps1`):**

```powershell
# Import Selenium module
Import-Module Selenium

# Configure Chrome options
$chromeOptions = New-Object OpenQA.Selenium.Chrome.ChromeOptions
$chromeOptions.AddArgument("--headless=new")
$chromeOptions.AddArgument("--no-sandbox")
$chromeOptions.AddArgument("--disable-dev-shm-usage")

# Start ChromeDriver
$service = [OpenQA.Selenium.Chrome.ChromeDriverService]::CreateDefaultService("/usr/local/bin")
$driver = New-Object OpenQA.Selenium.Chrome.ChromeDriver($service, $chromeOptions)

# Navigate to website
$driver.Navigate().GoToUrl("https://www.google.com")

# Output page title
Write-Host "Page Title:" $driver.Title

# Clean up
$driver.Quit()
```

2. **Run the script with Docker:**

```bash
docker run --rm \
  -v "$PWD:/app" \
  -w /app \
  devopsteamsdb/devopsteamsdb:selenium_powershell_latest \
  pwsh ./script.ps1
```

---

## 🛠 Features

- 🧰 PowerShell with Selenium module pre-installed  
- 🧭 Chrome & ChromeDriver (headless mode support)  
- 🐳 Lightweight and portable for automation or CI use

---

## 📂 Example Use Cases

- Automated web testing in PowerShell  
- Web scraping with Chrome headless  
- Running browser automation scripts inside CI pipelines
