require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require "test/unit"

class Ios_Viewprofile_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def profession_value1
    @driver.find_element(:xpath => "//XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[2]")
  end

  def city_value
    @driver.find_element(:xpath => "//XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[1]")
  end

  def industry_value
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='Industry']/following-sibling::XCUIElementTypeStaticText[1]")
  end

  def about_me_value
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='About me']/following-sibling::XCUIElementTypeStaticText[1]")
  end

  def interests_value
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='Interests']/following-sibling::XCUIElementTypeStaticText[1]")
  end

  def lets_chat_value
    @driver.find_element(:xpath => "//XCUIElementTypeCell[4]/XCUIElementTypeStaticText[2]")
  end

  def instagram_value
    @driver.find_element(:name => "instagram")
  end

  def twitter_value
    @driver.find_element(:name => "twitter")
  end

  def linkedin_value
    @driver.find_element(:name => "linkedIn")
  end

  def spotify_value
    @driver.find_element(:name => "spotify")
  end

  def youtube_value
    @driver.find_element(:name => "youtube")
  end

  def website_value
    @driver.find_element(:name => "website")
  end

  def icon_left
    @driver.find_element(:name => "iconLeft")
  end

  def homeBtn
    @driver.find_element(:xpath => "//XCUIElementTypeTabBar//XCUIElementTypeButton[1]")
  end

end

class Android_Viewprofile_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def navigate_up
    @driver.find_element(:xpath => "//android.widget.ImageButton[@content-desc = 'Navigate up']")
  end

  def homeBtn
    @driver.find_element(:xpath => "//*[@resource-id='com.sohohouse.seven:id/menu_home']/android.widget.ImageView[1]")
  end

end