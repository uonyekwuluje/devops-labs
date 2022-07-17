from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
	
grid_url = "http://selenium-hub.ucheonyekwuluje.com/wd/hub"

#def openChromeBrowser():
#    chrome_options = webdriver.ChromeOptions()
#    driver = webdriver.Remote(
#        command_executor='http://selenium-hub.ucheonyekwuluje.com/wd/hub',
#        options=chrome_options
#    )
#    driver.get("http://www.google.com")
#    driver.quit()  
#
#
#def openFirefoxBrowser():
#    firefox_options = webdriver.FirefoxOptions()
#    driver = webdriver.Remote(
#        command_executor='http://selenium-hub.ucheonyekwuluje.com/wd/hub',
#        options=firefox_options
#    )
#    driver.get("http://www.google.com")
#    driver.quit() 
#


					 
driver = webdriver.Remote(
   command_executor = grid_url,
   desired_capabilities={
            "browserName": "chrome",
   })


driver.implicitly_wait(30)
driver.get("http://www.python.org")
assert "Python" in driver.title
elem = driver.find_element("name","q1")
elem.send_keys("documentation")
elem.send_keys(Keys.RETURN)
assert "No results found." not in driver.page_source
print('this is running on a grid0')

driver.quit()
