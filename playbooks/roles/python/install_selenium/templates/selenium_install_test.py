from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
 
from pyvirtualdisplay import Display
display = Display(visible=0, size=(1024, 768))
display.start()
 
firefox_capabilities = DesiredCapabilities.FIREFOX
firefox_capabilities['marionette'] = True
firefox_capabilities['binary'] = '/usr/bin/firefox'
 
 
driver = webdriver.Firefox(capabilities=firefox_capabilities)
driver.get("http://yahoo.co.jp")
print driver.title
 
driver.close()
