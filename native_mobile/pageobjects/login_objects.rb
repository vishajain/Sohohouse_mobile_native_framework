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
    begin

    @driver.find_element(:name => "Welcome home")

    rescue
      puts "welcome home element not found"
    end

  end

  def email_textfield
    begin
    @driver.find_element(:xpath => "//XCUIElementTypeTextField")

    rescue
    puts "welcome home element not found"
    end
  end

  def password_textfield
    begin
    @driver.find_element(:xpath => "//XCUIElementTypeSecureTextField")

    rescue
    puts "welcome home element not found"
    end
  end

  def go_button
    begin
    @driver.find_element(:name => "Go")

    rescue
    puts "welcome home element not found"
    end
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
    @driver.find_elements(:xpath => "//*[contains(@resource-id,'text_input_item')]/android.widget.FrameLayout/android.widget.EditText")
  end

  def password_textfield
    @driver.find_elements(:xpath => "//*[contains(@resource-id,'text_input_item')]/android.widget.FrameLayout/android.widget.EditText")
  end


end