#!/usr/bin/env python3
from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

def check_chrome_browser(browser):
  driver = webdriver.Remote(
      command_executor='http://192.168.1.20:30001/wd/hub', 
      options=webdriver.ChromeOptions())

  driver.get("http://google.com")
  assert "google" in driver.page_source
  driver.quit()
  print("Browser %s checks out!" % browser)


def check_firefox_browser():
    firefox_options = webdriver.FirefoxOptions()
    driver = webdriver.Remote(
        command_executor='http://192.168.1.20:30001/wd/hub',
        options=firefox_options
    )
    driver.get("http://www.google.com")
    driver.quit() 

def gen_test():
    desired_cap = {
'platform' : 'win10',
'browserName' : 'chrome',
'version' :  "67.0",
}

url = "https://username:acsessToken@{LMABDA GRID URL}/wd/hub"

driver = webdriver.Remote(
    desired_capabilities=desired_cap,
    command_executor= url
) 

driver.implicitly_wait(1)
driver.get("http://www.google.com/")
driver.quit()


check_chrome_browser("CHROME")
check_firefox_browser()
gen_test()
