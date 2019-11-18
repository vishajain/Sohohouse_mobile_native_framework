require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require "test/unit"

class Ios_Onboarding_Objects
  
  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end
  
  def terms_text
    @driver.find_element(:name => "Terms and conditions")
  end

  def accept_terms
    @driver.find_element(:name => "Accept & Continue")
  end

  def helpus_text
    @driver.find_element(:name => "Help us improve")
  end

  def allow_improve
    @driver.find_element(:name => "Allow")
  end

  def houserules_text
    @driver.find_element(:name => "House rules")
  end

  def next_button
    @driver.find_element(:name => "Next")
  end

  def continue_button_to_notify_pref
    @driver.find_element(:name => "Next")
  end

  def myplanner_text
    @driver.find_element(:name => "My planner")
  end

  def continue_without_sync
    @driver.find_element(:name => "Continue without syncing")
  end

  def welcome_text
    @driver.find_element(:name => "Welcome to Soho House")
  end

  def continue_button
    @driver.find_element(:name => "Continue")
  end

  def makepersonal_text
    @driver.find_element(:name => "Make it personal")
  end

  def intronotice_text
    @driver.find_element(:name => "Introducing Noticeboard")
  end

  def noticeboard_text
    @driver.find_element(:name => "Noticeboard")
  end

  def notification_pref_text
    @driver.find_element(:name => "Notification preferences")
  end

  def ok_button
    @driver.find_element(:name => "OK")
  end

  def you_are_set_text
    @driver.find_element(:name => "You're all set")
  end

end

class Android_Onboarding_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def welcome_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Welcome to Soho House']")
  end

  def next_button
    @driver.find_element(:id => "com.sohohouse.seven:id/title_card_next_button")
  end


  def next_button_1
    @driver.find_element(:id => "com.sohohouse.seven:id/continue_button")
  end

  def makepersonal_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Make it personal']")
  end

  def intronotice_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Introducing Noticeboard']")
  end

  def intronotice_continue
    @driver.find_element(:id => "com.sohohouse.seven:id/onboarding_house_accept_button")
  end

  def continue_button
    @driver.find_element(:id => "com.sohohouse.seven:id/onboarding_house_accept_button")
  end

  def continue_button_to_notify_pref
    @driver.find_element(:id => "com.sohohouse.seven:id/onboarding_house_accept_button")
  end

  def noticeboard_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Noticeboard']")
  end

  def notification_pref_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Notification preferences']")
  end

  def ok_button
    @driver.find_element(:xpath => "//android.widget.Button[@text = 'OK']")
  end

  def you_are_set_text
    @driver.find_element(:id => "com.sohohouse.seven:id/title_card_title")
  end

end
