require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require "test/unit"

class Ios_Connect_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def your_post
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='Your post']/following-sibling::XCUIElementTypeTextView")
  end
  def refine
    @driver.find_element(:xpath => "//XCUIElementTypeOther/XCUIElementTypeStaticText[@name='Refine']")
  end

  def view_post_house(house)

    @driver.find_element(:xpath => "//XCUIElementTypeOther/following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeButton[@name='"+house+"']")

  end
  def view_post_message

    @driver.find_element(:xpath => "//XCUIElementTypeOther/following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeTextView")

  end
  def view_post_title

    @driver.find_element(:xpath => "//XCUIElementTypeOther/following-sibling::XCUIElementTypeCell[1]/XCUIElementTypeStaticText")

  end

  def reply
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='Write your reply']/preceding-sibling::XCUIElementTypeTextView")
  end

  def like_icon
    @driver.find_element(:xpath => "//XCUIElementTypeButton/preceding-sibling::XCUIElementTypeButton[1]")
  end
  def like_count
    @driver.find_element(:xpath => "//XCUIElementTypeCell[1]//XCUIElementTypeButton[contains(@name,'1 ')]/XCUIElementTypeStaticText")
  end
  def delete_button
    @driver.find_element(:xpath => "//XCUIElementTypeCell[2]/XCUIElementTypeButton[@name='Post actions']")
  end

  def back
    @driver.find_element(:name => "iconLeft")
  end

  def post_button
    @driver.find_element(:xpath => "//*[@name='Post']")
  end
  def reply_button
    @driver.find_element(:name => "Reply")
  end
  def booking_time_slot
  @driver.find_element(:xpath => "//XCUIElementTypeCell[5]//XCUIElementTypeButton[@enabled='true'][1]")
  end
  def navigate_back_to_connect
    @driver.find_element(:xpath => "//*[contains(@name , 'iconLeft') or contains(@name,'iconXLarge') or contains(@name , 'iconArrowLeft') or contains(@name, 'iconDarkSmallClose')]")
  end
  def switch_camera
    @driver.find_element(:name => "switch camera")
  end
  def Members
    @driver.find_element(:name => "Members")
  end
  def mute
    @driver.find_element(:name => "mute")
  end
  def disable_video
    @driver.find_element(:name => "disable video")
  end
  def open_room_switch(text)
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='"+text+"']/following-sibling::XCUIElementTypeButton")
  end
  def exit_from_chat_window
    @driver.find_element(:xpath => "//*[contains(@name , 'iconLeft') or contains(@name,'iconXLarge') or contains(@name , 'iconArrowLeft')]")
  end
  def connect_section
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[contains(@name,'Let other') or @name='Complete your profile']")
  end

end

class Android_Connect_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def your_post
    @driver.find_element(:id => "#{$currentPackage+':id'+'/post_input'}")
  end

  def view_post_house(house)

    @driver.find_element(:xpath => "//androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.LinearLayout/android.widget.TextView[@text='"+house+"']")

  end
  def view_post_message

    @driver.find_element(:xpath => "//androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.TextView[contains(@resource-id,'message_content')]")

  end
  def view_post_title

    @driver.find_element(:xpath => "//androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.LinearLayout/android.widget.TextView[contains(@resource-id,'author_name')]")

  end
  def view_post_time
    @driver.find_element(:xpath => "//androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.LinearLayout/android.widget.TextView[contains(@resource-id,'timestamp')]")
  end

  def post_button
    @driver.find_element(:id => "#{$currentPackage+':id'+'/submit_post_btn'}")
  end

  def refine
    @driver.find_element(:id => "#{$currentPackage+':id'+'/filter_button'}")
  end
  def reply
    @driver.find_element(:id => "#{$currentPackage+':id'+'/reply_input'}")
  end
  def delete_button
    @driver.find_element(:xpath => "//androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.ImageView[contains(@resource-id,'delete_post_btn')]")
  end
  def reply_button
    @driver.find_element(:id => "#{$currentPackage+':id'+'/submit_reply_btn'}")
  end

end