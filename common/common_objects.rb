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

  def element_with_partial_text(elementText)
    @driver.find_element(:xpath => "//*[contains(@name , \""+elementText+"\")]")
  end

  def tab_icon
    @driver.find_element(:name => "fab")
  end

  def tab_icons(index)
    @driver.find_element(:xpath => "//XCUIElementTypeTabBar/XCUIElementTypeButton["+index.to_s+"]")
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

  def element_with_partial_text(elementText)
    @driver.find_element(:xpath => "//*[contains(@text , \""+elementText+"\")]")
  end

  def tab_icons(index)
    @driver.find_element(:xpath => "//android.view.ViewGroup//android.widget.FrameLayout["+index.to_s+"]/android.widget.ImageView")
  end

end