import selenium
import os
import time

from selenium import webdriver

class RunLoginTestOnChrome():
    def test(self):
        driverLocation = "C:/Development/Selenium/chromedriver"
        os.environ["webdriver.chrome.driver"] = driverLocation

        # Instantiate Chrome Browser Command
        driver = webdriver.Chrome(driverLocation)

        # Open the provided URL
        driver.get("https://login.yahoo.com/")

        # Finding the 'id' of the email field on login page and input email id
        email_id_field = driver.find_element_by_id('login-username')
        email_id_field.send_keys('pushpendra_test')

        # find  'Next' button and click it
        email_next_button = driver.find_element_by_id('login-signin')
        email_next_button.click()
        time.sleep(5)

        # Find password field and send password
        email_password_field = driver.find_element_by_id('login-passwd')
        email_password_field.send_keys('test@12345')

        # find  'Next' button and click it
        email_next_button = driver.find_element_by_id('login-signin')
        email_next_button.click()
        time.sleep(10)

ff = RunLoginTestOnChrome()
ff.test()
