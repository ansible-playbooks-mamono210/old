from selenium import webdriver
from selenium.webdriver.chrome.options import Options

browser_path = '/opt/google/chrome/google-chrome'

opts = Options()
opts.binary_location = browser_path
opts.add_argument('--headless')
opts.add_argument('--disable-gpu')
opts.add_argument('--no-sandbox')

browser = webdriver.Chrome(chrome_options=opts)

browser.get('https://yahoo.co.jp')
print(browser.title)
