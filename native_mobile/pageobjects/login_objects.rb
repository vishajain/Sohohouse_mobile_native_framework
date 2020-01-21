require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require "test/unit"

class Ios_Login_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def welcome_home

    @driver.find_element(:name => "Welcome home")

  end

  def email_textfield
    @driver.find_element(:xpath => "//XCUIElementTypeTextField")

  end

  def password_textfield
    @driver.find_element(:xpath => "//XCUIElementTypeSecureTextField")

  end

  def go_button

    @driver.find_element(:name => "Go")

  end

end

class Android_Login_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def welcome_home
      @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Welcome home']")
  end

  def go_button
    @driver.find_element(:xpath => "//android.widget.Button[@text = 'Sign in']")
  end

  def email_textfield
    @driver.find_element(:xpath => "//android.widget.EditText[contains(@text,'Email address')]")
  end

  def password_textfield
    @driver.find_element(:xpath => "//android.widget.EditText[contains(@text,'Password')]")
  end


end