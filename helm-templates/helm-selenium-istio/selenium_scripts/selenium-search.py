from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
import time
	
grid_url = "http://selenium-hub.ucheonyekwuluje.com/wd/hub"

#set chromodriver.exe path
chrome_options = webdriver.ChromeOptions()
chrome_options.add_argument("--start-maximized")
chrome_options.add_argument("--incognito")
driver = webdriver.Remote(
     command_executor = grid_url,
     options=chrome_options
   )

driver.implicitly_wait(0.5)
#launch URL
driver.get("https://www.google.com/")
#identify search box
m = driver.find_element("name","q")
#enter search text
m.send_keys("Tutorialspoint")
time.sleep(0.2)
#perform Google search with Keys.ENTER
m.send_keys(Keys.ENTER)
driver.quit()
