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

  def button_with_text(elementText)
    @driver.find_element(:xpath => "//XCUIElementTypeButton[@name = \""+elementText+"\"]")
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

  def home_menu
    @driver.find_element(:name => "sideMenuHome")
  end

  def account_menu
    @driver.find_element(:name => "sideMenuAccount")
  end
  def skip_onboard
    @driver.find_element(:xpath => "//*[@name=\"Next\" or @name=\"Continue\" or @name=\"Continue without syncing\" or @name=\"I'd rather opt out\" or @name=\"Dismiss\" or @name=\"Remind me later\" or @name=\"Update later\" or @name=\"Allow\"]")
  end
  def side_left_arrow
    @driver.find_element(:name => "sideMenuArrowLeft")
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

  def button_with_text(elementText)
    @driver.find_element(:xpath => "//*[@text = \""+elementText+"\"]")
  end

  def element_with_partial_text(elementText)
    @driver.find_element(:xpath => "//*[contains(@text , \""+elementText+"\")]")
  end

  def tab_icons(index)
    @driver.find_element(:xpath => "//android.view.ViewGroup//android.widget.FrameLayout["+index.to_s+"]/android.widget.ImageView")
  end

end