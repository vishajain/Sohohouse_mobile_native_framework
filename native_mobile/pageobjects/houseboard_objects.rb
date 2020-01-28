require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require 'yaml'
require "test/unit"

class Ios_Blackslate_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def house_name
    @driver.find_element(:xpath => "//XCUIElementTypeCell//XCUIElementTypeStaticText")
  end

  def close_blackslate
    @driver.find_element(:name => "iconX")
  end

  def browse_houses
    @driver.find_element(:name => "Europe")
  end

  def browse_houses_back_button
    @driver.find_element(:name => "iconLeft")
  end

  def membership_card
    @driver.find_element(:name => "Membership card")
  end

  def membership_card_back_button
    @driver.find_element(:name => "iconLeft")
  end

  def membership_card_screen
    @driver.find_element(:name => "Your membership")
  end

  def book_a_bedroom
    @driver.find_element(:name => "Book a bedroom")
  end

  def contact_a_house
    @driver.find_element(:name => "Contact a House")
  end

  def house_rules
    @driver.find_element(:name => "House rules")
  end

  def icon_left
    @driver.find_element(:name => "iconLeft")
  end

end

class Android_Blackslate_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def house_name
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='Open now']//parent::XCUIElementTypeCell//preceding-sibling::XCUIElementTypeCell/XCUIElementTypeStaticText")
  end

  def close_blackslate
    @driver.find_element(:accessibility_id => "Return home")
  end

  def browse_houses
    @driver.find_element(:xpath => "//android.widget.TextView[@text='Europe']")
  end

  def browse_houses_back_button
    @driver.find_element(:accessibility_id => "Go back")
  end

  def membership_card
    @driver.find_element(:xpath => "//android.widget.Button[@text='Membership card']")
  end

  def membership_card_back_button
    @driver.find_element(:xpath => "//android.widget.Button[@text='Dismiss']")
  end

  def membership_card_screen
    @driver.find_element(:xpath => "//android.widget.TextView[@text='Membership type']")
  end

  def book_a_bedroom
    @driver.find_element(:xpath => "//android.widget.Button[@text='Book a bedroom']")
  end

  def contact_a_house
    @driver.find_element(:xpath => "//android.widget.Button[@text='Contact a House']")
  end

  def house_rules
    @driver.find_element(:xpath => "//android.widget.Button[@text='House rules']")
  end

  def icon_left
    @driver.find_element(:accessibility_id => "Go back")
  end

end


