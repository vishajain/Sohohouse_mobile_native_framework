require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require "test/unit"

class Ios_GuestInvitation_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def new_invitation
    @driver.find_element(:xpath =>  "//android.widget.TextView[@text = 'New invitation']")
  end

  def nav_bar
    @driver.find_element(:xpath =>  "//*[contains(@resource-id , 'bottom_navigation_view') or @text='Save changes']")
  end


  def select_location
    @driver.find_element(:xpath =>  "//android.widget.TextView[@text = 'Select a location']")
  end

  def select_date_field
    @driver.find_element(:id => "#{$currentPackage+':id'+'/date_value'}")
  end

  def select_house
    @driver.find_element(:xpath =>  "//android.widget.TextView[@text = '"+$house+"']")
  end

  def confirm_selection
    @driver.find_element(:xpath =>  "//android.widget.Button[@text = 'Confirm selection' or @text = 'CONFIRM']")
  end

  def today_date
    @driver.find_element(:xpath =>  "//android.widget.TextView[contains(@resource-id , 'date_picker_header_date')]")
  end

  def select_date(date)
    @driver.find_element(:xpath =>  "//android.view.View[@text = '"+date+"']")
  end

  def save_continue
    @driver.find_element(:xpath =>  "//android.widget.Button[@text = 'Save and continue']")
  end

  def add_a_guest
    @driver.find_element(:xpath =>  "//android.widget.Button[@text = 'Add a guest']")
  end

  def add_guest
    @driver.find_element(:xpath =>  "//android.widget.TextView[@text = 'Add guest']")
  end

  def enter_guest_name
    @driver.find_element(:id => "#{$currentPackage+':id'+'/input_dialog_edittext'}")
  end

  def done
    @driver.find_element(:xpath =>  "//android.widget.Button[@text = 'DONE' or @text ='Done']")
  end

  def ElementListWithText(elementText)
    @driver.find_elements(:xpath => "//android.widget.TextView[contains(@text , '#{elementText}')]")
  end

  def ButtonWithText(elementText)
    @driver.find_element(:xpath => "//XCUIElementTypeButton[@name = '#{elementText}']")
  end

end

class Android_GuestInvitation_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def new_invitation
    @driver.find_element(:xpath =>  "//android.widget.TextView[@text = 'New invitation']")
  end

  def nav_bar
    @driver.find_element(:xpath =>  "//*[contains(@resource-id , 'bottom_navigation_view') or @text='Save changes']")
  end


  def select_location
    @driver.find_element(:xpath =>  "//android.widget.TextView[@text = 'Select a location']")
  end

  def select_date_field
    @driver.find_element(:id => "#{$currentPackage+':id'+'/date_value'}")
  end

  def select_house
    @driver.find_element(:xpath =>  "//android.widget.TextView[@text = '"+$house+"']")
  end

  def confirm_selection
    @driver.find_element(:xpath =>  "//android.widget.Button[@text = 'Confirm selection' or @text = 'CONFIRM']")
  end

  def today_date
    @driver.find_element(:xpath =>  "//android.widget.TextView[contains(@resource-id , 'date_picker_header_date')]")
  end

  def select_date(date)
    @driver.find_element(:xpath =>  "//android.view.View[@text = '"+date+"']")
  end

  def save_continue
    @driver.find_element(:xpath =>  "//android.widget.Button[@text = 'Save and continue']")
  end

  def add_a_guest
    @driver.find_element(:xpath =>  "//android.widget.Button[@text = 'Add a guest']")
  end

  def add_guest
    @driver.find_element(:xpath =>  "//android.widget.TextView[@text = 'Add guest']")
  end

  def enter_guest_name
    @driver.find_element(:id => "#{$currentPackage+':id'+'/input_dialog_edittext'}")
  end

  def done
    @driver.find_element(:xpath =>  "//android.widget.Button[@text = 'DONE' or @text ='Done']")
  end

  def ElementListWithText(elementText)
    @driver.find_elements(:xpath => "//android.widget.TextView[contains(@text , '#{elementText}')]")
  end

  def ButtonWithText(elementText)
    @driver.find_element(:xpath => "//android.widget.Button[@text = '#{elementText}']")
  end

  def next
    @driver.find_element(:xpath => "//android.widget.ImageButton[contains(@resource-id,'next')]")
  end

end