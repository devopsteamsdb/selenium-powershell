FROM mcr.microsoft.com/powershell:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget \
    unzip \
    curl \
    gnupg \
    ca-certificates

# Add Chrome repository and install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends google-chrome-stable

# Get Chrome version, download and install matching ChromeDriver
RUN CHROME_VERSION=$(google-chrome --version | awk '{print $3}') && \
    wget -q -O /tmp/chromedriver.zip "https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/${CHROME_VERSION}/linux64/chromedriver-linux64.zip" && \
    unzip /tmp/chromedriver.zip -d /usr/local/bin/ && \
    mv /usr/local/bin/chromedriver-linux64/chromedriver /usr/local/bin/chromedriver && \
    chmod +x /usr/local/bin/chromedriver && \
    rm -rf /tmp/chromedriver.zip /usr/local/bin/chromedriver-linux64

ENV PATH="/usr/local/bin:${PATH}"

# Install Selenium PowerShell module
RUN pwsh -Command "Install-Module -Name Selenium -Scope CurrentUser -Force"

# Replace default Selenium module chromedriver with downloaded one
RUN mkdir -p /root/.local/share/powershell/Modules/Selenium/3.0.1/assemblies/linux && \
    cp /usr/local/bin/chromedriver /root/.local/share/powershell/Modules/Selenium/3.0.1/assemblies/linux/chromedriver

# Optionally clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
