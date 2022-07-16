from selenium import webdriver
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

#driver = webdriver.Remote(
#   command_executor='http://selenium-hub.ucheonyekwuluje.com/wd/hub',
#   desired_capabilities=DesiredCapabilities.CHROME)

def openChromeBrowser():
    chrome_options = webdriver.ChromeOptions()
    driver = webdriver.Remote(
        command_executor='http://selenium-hub.ucheonyekwuluje.com/wd/hub',
        options=chrome_options
    )
    driver.get("http://www.google.com")
    driver.quit()  


def openFirefoxBrowser():
    firefox_options = webdriver.FirefoxOptions()
    driver = webdriver.Remote(
        command_executor='http://selenium-hub.ucheonyekwuluje.com/wd/hub',
        options=firefox_options
    )
    driver.get("http://www.google.com")
    driver.quit() 


#def openOperaBrowser():
#    opera_options = webdriver.Opera()
#    driver = webdriver.Remote(
#        command_executor='http://selenium-hub.ucheonyekwuluje.com/wd/hub',
#        options=opera_options
#    )
#    driver.get("http://www.google.com")
#    driver.quit()



def checkBrowser():
    desiredCapabilities={
       "browserName":"chrome"
    }
    driver = webdriver.Remote(
        command_executor='http://selenium-hub.ucheonyekwuluje.com/wd/hub',
        options=webdriver.ChromeOptions()
    )

    driver.get("https://www.google.co.in/")
    print(driver.title)
    driver.quit()





#openOperaBrowser()
#checkBrowser()
openChromeBrowser()
#openFirefoxBrowser()
