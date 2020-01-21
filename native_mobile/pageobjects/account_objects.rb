require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require 'yaml'
require "test/unit"

class Ios_Account_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def account_title
    @driver.find_element(:name => "View Profile")
  end

  def edit_profile_screen
    @driver.find_element(:name => "Edit")
  end

  def your_membership
    @driver.find_element(:name => "Your membership")
  end

  def perks
    @driver.find_element(:name => "Perks")
  end

  def houseperks_title
    @driver.find_element(:name => "House Perks")
  end

  def payment
    @driver.find_element(:name => "Payment")
  end

  def past_bookings
    @driver.find_element(:name => "Past bookings")
  end

  def change_password
    @driver.find_element(:name => "Change password")
  end

  def favourite_houses

    @driver.find_element(:name => "Favourite Houses")
  end

  def notification_preferences

    @driver.find_element(:name => "Notification preferences")
  end

  def sync_calendar
    @driver.find_element(:name => "Sync calendar")
  end

  def myplanner_title
    @driver.find_element(:name => "My planner")
  end


  def contact_us
    @driver.find_element(:name => "Contact us")
  end

  def faq

    @driver.find_element(:name => "FAQ")

  end

  def policies

    @driver.find_element(:name => "Policies")

  end

  def stay_section
    @driver.find_element(:name => "Sign out")
  end


  def icon_left
    @driver.find_element(:name => "iconLeft")
  end

  def icon_back_header
    @driver.find_element(:name => "iconBackHeader")
  end

  def homeBtn
    @driver.find_element(:xpath => "//XCUIElementTypeTabBar//XCUIElementTypeButton[1]")
  end

  def perkTitle
    # @driver.find_element(:xpath => "//XCUIElementTypeCell[1]")
    @driver.find_element(:xpath => "//XCUIElementTypeTable[1]/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[2]")
  end

  def perkLocation
    @driver.find_element(:xpath => "//XCUIElementTypeTable[1]/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[1]")
  end

  def perkContentImage
    @driver.find_element(:xpath => "//XCUIElementTypeImage[1]")
  end

  def perkContentLocation
    @driver.find_element(:xpath => "//XCUIElementTypeTable[1]/XCUIElementTypeCell/XCUIElementTypeStaticText[1]")
  end

  def perkContentTitle
    @driver.find_element(:xpath => "//XCUIElementTypeTable[1]/XCUIElementTypeCell/XCUIElementTypeStaticText[2]")
  end

  def perkContentDesc
    @driver.find_element(:xpath => "//XCUIElementTypeTable[1]/XCUIElementTypeCell/XCUIElementTypeTextView")
  end

  def current_password
    @driver.find_element(:name => "Current password")
  end

  def new_password
    @driver.find_element(:name => "New password")
  end

  def confirm_password
    @driver.find_element(:name => "Confirm password")
  end

  def save_btn
    @driver.find_element(:name => "Save")
  end

  def sign_out
    @driver.find_element(:name => "Sign out")
  end

  def reset
    @driver.find_element(:name => "Reset")
  end

  def local_house
    @driver.find_element(:name => "#{$house}")
  end

  def save_changes
    @driver.find_element(:name => "Save changes")
  end

  def tap_uk
    @driver.find_element(:name => "UK")
  end

  def greek_St
    @driver.find_element(:name => "40 Greek Street")
  end

  def notification_pref_switch(link)
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name = '#{link}']/following-sibling::XCUIElementTypeSwitch")
  end

  def notification_pref_switch_value(link)
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name = '#{link}']/following-sibling::XCUIElementTypeSwitch").attribute("value")
  end

  def enquiry_type
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name = 'What type of enquiry do you have?']/parent::XCUIElementTypeCell/following-sibling::XCUIElementTypeCell/XCUIElementTypePicker/XCUIElementTypePickerWheel")
  end

  def enquiry_topic1

    # @driver.find_elements(:xpath => "//XCUIElementTypeStaticText[contains(@name,'the topic of your enquiry?')]")

    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[contains(@name, 'the topic of your enquiry?')]/parent::XCUIElementTypeCell/following-sibling::XCUIElementTypeCell/XCUIElementTypePicker/XCUIElementTypePickerWheel")

  end

  def enquiry_message

    @driver.find_element(:name => "Let us know what you need help with, or share your feedback")

  end

  def submit

    @driver.find_element(:name => "Submit")

  end

  def done
    @driver.find_element(:name => "Done")
  end

end

class Android_Account_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def account_title
    @driver.find_element(:accessibility_id => "View profile")
  end

  def edit_profile_screen
    @driver.find_element(:accessibility_id => "Edit")
  end

  def your_membership
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Your membership']")
  end

  def perks
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Perks']")
  end

  def houseperks_title
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'House Perks']")
  end

  def payment
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Payment']")

  end

  def past_bookings
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Past bookings']")
  end

  def change_password
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Change password']")
  end

  def favourite_houses

    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Favourite Houses']")
  end

  def house_preferences

    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'House preferences']")
  end

  def notification_preferences

    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Notification preferences']")
  end

  def contact_us
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Contact us']")
  end

  def faq

    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'FAQ']")

  end

  def policies

    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Policies']")

  end

  def stay_section
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Sign out']")
  end

  def navigate_up
    @driver.find_element(:xpath => "//android.widget.ImageButton[@content-desc = 'Navigate up']")
  end

  def icon_left
    @driver.find_element(:accessibility_id => "Go back")
  end

  def icon_back_header
    @driver.find_element(:xpath => "//android.widget.ImageButton[@index='0']")
  end

  def homeBtn
    @driver.find_element(:xpath => "//*[@resource-id='com.sohohouse.seven:id/menu_home']/android.widget.ImageView[1]")
  end

end

