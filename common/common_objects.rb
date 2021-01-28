require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require "test/unit"

class Ios_Common_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def element_with_text(elementText)
    @driver.find_element(:xpath => "//*[@name = \""+elementText+"\"]")
  end

end

class Android_Common_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def element_with_text(elementText)
    @driver.find_element(:xpath => "//*[@text = \""+elementText+"\"]")
  end

end