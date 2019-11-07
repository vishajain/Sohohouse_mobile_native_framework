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
    @driver.find_elements(:name => "House Notes")
  end

  def see_all_stories
    @driver.find_elements(:xpath => "//XCUIElementTypeCell/XCUIElementTypeButton[@name = 'See all stories']")
  end

  def house_notes_screen
    @driver.find_element(:name => "House Notes")
  end

  def noticeboard
    noticeboard_text = ""+$house+""+" Noticeboard"
    @driver.find_element(:name => ""+noticeboard_text+"")

    # @driver.find_element(:name => "Little Beach House Barcelona Noticeboard")
  end

  def view_another_noticeboard
    @driver.find_elements(:xpath => "//XCUIElementTypeCell/XCUIElementTypeButton[@name = 'View another Noticeboard']")
  end

  def  noticeboards_title
    @driver.find_element(:name => "Noticeboards")
  end

  def house_perks
    @driver.find_element(:name => "House Perks")
  end

  def houseperks_title
    @driver.find_element(:name => "House Perks")
  end

  def browse_houses
    @driver.find_element(:name => "Browse the Houses")
  end

  def browsehouses_title
    @driver.find_element(:name => "Europe")
  end

  def footer_buttons(button)
    @driver.find_element(:name => ""+button+"")
  end

  def homeBtn
    @driver.find_elements(:xpath => "//XCUIElementTypeTabBar[1]/XCUIElementTypeButton")
  end

  def whats_on
    # @driver.find_element(:xpath => "//XCUIElementTypeButton[@name = 'WHAT'S ON']")
     @driver.find_elements(:xpath => "//XCUIElementTypeTabBar[1]/XCUIElementTypeButton")
  end

  def left_link
    @driver.find_element(:name => "iconLeft")
  end

  def myplanner_btn
    # @driver.find_elements(:xpath => "//XCUIElementTypeTabBar[1]/XCUIElementTypeButton")
    @driver.find_element(:name => "MY PLANNER")
  end

  def myplanner_btn_1
    # @driver.find_elements(:xpath => "//XCUIElementTypeTabBar[1]/XCUIElementTypeButton")
    @driver.find_elements(:name => "MY PLANNER")
  end

  def account_btn
    @driver.find_elements(:xpath => "//XCUIElementTypeTabBar[1]/XCUIElementTypeButton")
  end

  def navigate_back
    @driver.find_element(:xpath => "//XCUIElementTypeOther/XCUIElementTypeButton[1]")
  end

  def navigate_back_to_my_planner
    @driver.find_element(:xpath => "//XCUIElementTypeOther/XCUIElementTypeButton[1]")
  end

  def browse_houses_navigate_back
    @driver.find_element(:xpath => "//XCUIElementTypeOther/XCUIElementTypeButton[1]")
  end
  def account_button
    @driver.find_element(:name => "ACCOUNT")
  end

end

class Android_Home_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def greetings
    str = @driver.find_element(:id => "com.sohohouse.seven:id/title_text").text
    return str
  end

  def username
    @driver.find_element(:xpath => "//android.widget.TextView[@text='"+$name+"']")
  end

  def happening_now
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Happening now']")
  end

  def house_notes
    @driver.find_elements(:xpath => "//android.widget.TextView[@text = 'House Notes']")
  end

  def see_all_stories
    @driver.find_elements(:xpath => "//android.widget.Button[@text='See all stories']")
  end

  def house_notes_screen
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'House Notes']")
  end

  def noticeboard

    @driver.find_element(:id => "com.sohohouse.seven:id/local_house_board_title")

    # @driver.find_element(:name => "Little Beach House Barcelona Noticeboard")
  end

  def view_another_noticeboard
    @driver.find_elements(:id => "com.sohohouse.seven:id/explore_other_noticeboards")
  end

  def  noticeboards_title
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Noticeboards']")
  end

  def house_perks
    @driver.find_element(:id => "com.sohohouse.seven:id/perks_btn")
  end

  def houseperks_title
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'House Perks']")
  end

  def browse_houses
    @driver.find_element(:id => "com.sohohouse.seven:id/browse_houses_btn")
  end

  def browsehouses_title
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Europe']")
  end

  def homeBtn
    @driver.find_elements(:xpath => "//android.widget.FrameLayout[contains(@resource-id,'bottom_nav_bar')]//android.widget.FrameLayout")
  end

  def whats_on

     @driver.find_elements(:xpath => "//android.widget.FrameLayout[contains(@resource-id,'bottom_nav_bar')]//android.widget.FrameLayout")

  end

  def left_link
    @driver.find_element(:id => "com.sohohouse.seven:id/browse_houses_back_button")
  end

  def myplanner_btn
    # @driver.find_elements(:xpath => "//XCUIElementTypeTabBar[1]/XCUIElementTypeButton")
    @driver.find_element(:id => "com.sohohouse.seven:id/menu_planner")
  end

  def myplanner_btn_1
    # @driver.find_elements(:xpath => "//XCUIElementTypeTabBar[1]/XCUIElementTypeButton")
    @driver.find_elements(:id => "com.sohohouse.seven:id/menu_planner")
  end

  def account_btn
    @driver.find_elements(:id => "com.sohohouse.seven:id/menu_more")
  end

  def navigate_back
     @driver.find_element(:accessibility_id => "Go back")
    # element =  @driver.find_element(:uiautomator => 'new UiSelector().resourceId("com.sohohouse.seven:id/toolbar_back_btn")')

    # Appium::TouchAction.new.tap(element).perform

  end

  def navigate_back_to_my_planner
    @driver.find_element(:xpath =>"//android.widget.ImageButton[@content-desc='Navigate up']")
  end

  def browse_houses_navigate_back
     @driver.find_element(:id => "com.sohohouse.seven:id/browse_houses_back_button")


  end

  def account_button
    @driver.find_element(:id => "com.sohohouse.seven:id/menu_more")
  end


end
