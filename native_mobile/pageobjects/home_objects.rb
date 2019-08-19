require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require "test/unit"

class Ios_Home_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def greetings
    str = @driver.find_element(:xpath => "(//XCUIElementTypeOther/XCUIElementTypeStaticText)[1]").text
    return str
  end

  def username
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='"+$name+"']")
  end

  def happening_now
    @driver.find_element(:name => "Happening now")
  end

  def house_notes
    @driver.find_element(:name => "House Notes")
  end

  def see_all_stories
    @driver.find_elements(:name => "See all stories")
  end

  def noticeboard
    noticeboard_text = ""+$house+""+" Noticeboard"
    @driver.find_element(:name => ""+noticeboard_text+"")

    # @driver.find_element(:name => "Little Beach House Barcelona Noticeboard")
  end

  def house_perks
    @driver.find_element(:name => "House Perks")
  end

  def browse_houses
    @driver.find_element(:name => "Browse the Houses")
  end

  def footer_buttons(button)
    @driver.find_element(:name => ""+button+"")
  end

  def whatson
    @driver.find_element(:name => "WHAT'S ON")
  end
end

class Android_Home_Objects

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
