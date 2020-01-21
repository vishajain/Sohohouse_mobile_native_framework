require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require 'yaml'
require "test/unit"

class Ios_Myplanner_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def myplanner_title
    @driver.find_element(:name => "My planner")
  end

  def events_section
    @driver.find_element(:name => "Events")
  end

  def events_no_list

    @driver.find_elements(:xpath => "//XCUIElementTypeCell//XCUIElementTypeStaticText[@name = 'Events']//parent::XCUIElementTypeCell/following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeImage")

  end

  def events_with_list

    @driver.find_elements(:xpath => "//XCUIElementTypeCell//XCUIElementTypeStaticText[@name = 'Events']//parent::XCUIElementTypeCell/following-sibling::XCUIElementTypeCell[1]//XCUIElementTypeStaticText")

  end

  def explore_events_btn
    @driver.find_elements(:name => "Explore events")
  end


  def screenings_section
    @driver.find_element(:name => "Screenings")
  end

  def screenings_no_list

    @driver.find_elements(:xpath => "//XCUIElementTypeCell//XCUIElementTypeStaticText[@name = 'Screenings']//parent::XCUIElementTypeCell/following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeImage")

  end

  def screenings_with_list

    @driver.find_elements(:xpath => "//XCUIElementTypeCell//XCUIElementTypeStaticText[@name = 'Screenings']//parent::XCUIElementTypeCell/following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeStaticText")

  end

  def explore_screenings_btn
    @driver.find_elements(:name => "Explore screenings")
  end

  def classes_section
    @driver.find_element(:name => "Classes")
  end

  def classes_no_list

    @driver.find_elements(:xpath => "//XCUIElementTypeCell//XCUIElementTypeStaticText[@name = 'Classes']//parent::XCUIElementTypeCell/following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeImage")

  end

  def classes_with_list

    @driver.find_elements(:xpath => "//XCUIElementTypeCell//XCUIElementTypeStaticText[@name = 'Classes']//parent::XCUIElementTypeCell/following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeStaticText")

  end

  def explore_classes_btn
    @driver.find_elements(:name => "Explore gym classes")
  end

  def stay_section
    @driver.find_element(:name => "Stay")
  end

  def view_bedroom_bookings_click
    @driver.find_element(:name => "View bedroom bookings")
  end

  def homeBtn
    @driver.find_element(:xpath => "//XCUIElementTypeTabBar//XCUIElementTypeButton[1]")
  end

end

class Android_Myplanner_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def myplanner_title
    # @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Sign out']")
    @driver.find_element(:accessibility_id => "My planner")
  end

  def events_section
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Events']")
  end

  def events_no_list

    @driver.find_elements(:xpath => "//android.widget.TextView[@text = 'Events']//parent::android.view.ViewGroup/following-sibling::android.widget.LinearLayout[1]//android.widget.TextView")

  end

  def events_with_list

    @driver.find_elements(:xpath => "//android.widget.TextView[@text = 'Events']//parent::android.view.ViewGroup/following-sibling::android.view.ViewGroup[1]//android.widget.TextView")

  end

  def explore_events_btn
    @driver.find_elements(:xpath => "//android.widget.Button[@text = 'Explore events']")
  end

  def screenings_section
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Screenings']")
  end

  def screenings_no_list

    @driver.find_elements(:xpath => "//android.widget.TextView[@text = 'Screenings']//parent::android.view.ViewGroup/following-sibling::android.widget.LinearLayout[1]//android.widget.TextView")

  end

  def screenings_with_list

    @driver.find_elements(:xpath => "//android.widget.TextView[@text = 'Screenings']//parent::android.view.ViewGroup/following-sibling::android.view.ViewGroup[1]//android.widget.TextView")

  end

  def explore_screenings_btn
    @driver.find_elements(:xpath => "//android.widget.Button[@text = 'Explore screenings']")
  end

  def classes_section
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Classes']")
  end

  def classes_no_list

    @driver.find_elements(:xpath => "//android.widget.TextView[@text = 'Classes']//parent::android.view.ViewGroup/following-sibling::android.widget.LinearLayout[1]//android.widget.TextView")

  end

  def classes_with_list

    @driver.find_elements(:xpath => "//android.widget.TextView[@text = 'Classes']//parent::android.view.ViewGroup/following-sibling::android.view.ViewGroup[1]//android.widget.TextView")

  end

  def explore_classes_btn
    @driver.find_elements(:xpath => "//android.widget.Button[@text = 'Explore gym classes']")

  end

  def stay_section
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Stay']")
  end

  def view_bedroom_bookings_click
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'View bedroom bookings']")
  end

  def homeBtn
    @driver.find_element(:accessibility_id => "home")
  end

end
