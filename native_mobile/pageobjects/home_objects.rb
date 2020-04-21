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
     @driver.find_element(:xpath => "(//XCUIElementTypeOther/XCUIElementTypeStaticText)[1]")
  end

  def username
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='"+$name+"']")
  end

  def chasing_username
    @driver.find_element(:name => "SFFactory")
  end

  def happening_now
    @driver.find_element(:name => "What’s happening?")
  end

  def house_notes
    @driver.find_elements(:name => "House Notes")
  end

  def see_all_stories
    @driver.find_element(:name => "See all stories")
  end


  def our_houses
    @driver.find_element(:name => "Our Houses")
  end

  def house_notes_screen
    @driver.find_element(:name => "House Notes")
  end

  def past_digital_events
    @driver.find_element(:name => "Digital events on demand")
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
    if button == "HOME"
        @driver.find_element(:xpath => "//XCUIElementTypeTabBar//XCUIElementTypeButton[1]")
    elsif button == "WHAT'S ON"
        @driver.find_element(:xpath => "//XCUIElementTypeTabBar//XCUIElementTypeButton[2]")
    elsif button == "MY PLANNER"
        @driver.find_element(:xpath => "//XCUIElementTypeTabBar//XCUIElementTypeButton[3]")
    elsif button == "ACCOUNT"
        @driver.find_element(:xpath => "//XCUIElementTypeTabBar//XCUIElementTypeButton[4]")
    end
  end

  def homeBtn
    @driver.find_elements(:xpath => "//XCUIElementTypeTabBar[1]//XCUIElementTypeButton")
  end

  def whats_on
    # @driver.find_element(:xpath => "//XCUIElementTypeButton[@name = 'WHAT'S ON']")
     @driver.find_elements(:xpath => "//XCUIElementTypeTabBar[1]/XCUIElementTypeButton")
  end

  def whats_on_1
    # @driver.find_element(:xpath => "//XCUIElementTypeButton[@name = 'WHAT'S ON']")
    @driver.find_element(:xpath => "//XCUIElementTypeTabBar//XCUIElementTypeButton[2]")
  end

  def left_link
    @driver.find_element(:name => "iconLeft")
  end

  def myplanner_btn
    # @driver.find_elements(:xpath => "//XCUIElementTypeTabBar[1]/XCUIElementTypeButton")
    @driver.find_element(:xpath => "//XCUIElementTypeTabBar//XCUIElementTypeButton[3]")
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
    @driver.find_element(:xpath => "//XCUIElementTypeTabBar//XCUIElementTypeButton[4]")
  end

  def post_link
    @driver.find_element(:name => "Post")
  end

  def noticeboard_title
    @driver.find_element(:name => "Noticeboard")
  end

  def noticeboard_text_input
    @driver.find_element(:xpath => "//XCUIElementTypeTextView")
  end

  def view_post

    @driver.find_element(:xpath => "//XCUIElementTypeButton[@name='View another Noticeboard']//parent::XCUIElementTypeCell/following-sibling::XCUIElementTypeCell[2]//XCUIElementTypeStaticText[3]")

  end

  def delete_post
    @driver.find_element(:name => "Delete post")
  end

  def delete_post_check

    @driver.find_elements(:xpath => "//XCUIElementTypeButton[@name='View another Noticeboard']//parent::XCUIElementTypeCell/following-sibling::XCUIElementTypeCell[2]//XCUIElementTypeStaticText")

  end

  def view_another_noticeboard_1

    @driver.find_element(:name => "View another Noticeboard")

  end

  def soho_house_berlin

    @driver.find_element(:name => "Soho House Berlin")

  end

  def soho_berlin_noticeboard_title

    @driver.find_element(:name => "Soho House Berlin Noticeboard")

  end

  def view_another_board_post

    @driver.find_element(:xpath => "//XCUIElementTypeButton[@name='Switch Noticeboard']//parent::XCUIElementTypeCell/following-sibling::XCUIElementTypeCell[2]//XCUIElementTypeStaticText[3]")

  end

  def delete_another_board_post_check

    @driver.find_elements(:xpath => "//XCUIElementTypeButton[@name='Switch Noticeboard']//parent::XCUIElementTypeCell//following-sibling::XCUIElementTypeCell")

  end

  def posts_today

    @driver.find_element(:xpath => "//XCUIElementTypeTable/XCUIElementTypeCell[2]/XCUIElementTypeStaticText[1]")

  end

  def modal_close

    @driver.find_element(:name => "iconXLarge")

  end

  def event_name(event)
    @driver.find_element(:name => ""+event+"")
  end

end

class Android_Home_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def greetings
    @driver.find_element(:xpath => "//android.widget.LinearLayout//android.widget.TextView[1]")

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
    @driver.find_element(:xpath => "//android.widget.Button[@text='See all stories']")
  end

  def house_notes_screen
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'House Notes']")
  end

  def noticeboard
    @driver.find_element(:accessibility_id => "House board")
  end

  def view_another_noticeboard
    @driver.find_elements(:accessibility_id => "Switch Noticeboard")
  end

  def  noticeboards_title
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Noticeboards']")
  end

  def house_perks
    @driver.find_element(:accessibility_id => "Perks")
  end

  def houseperks_title
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'House Perks']")
  end

  def browse_houses
    @driver.find_element(:accessibility_id => "Browse the Houses")
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

  def whats_on_1
       @driver.find_element(:id => "#{$currentPackage+':id'+'/menu_explore'}")
  end

  def left_link
    @driver.find_element(:accessibility_id => "Go back")
  end

  def myplanner_btn
    # @driver.find_elements(:xpath => "//XCUIElementTypeTabBar[1]/XCUIElementTypeButton")
    @driver.find_element(:accessibility_id => "MY PLANNER")
  end

  def myplanner_btn_1
    # @driver.find_elements(:xpath => "//XCUIElementTypeTabBar[1]/XCUIElementTypeButton")
    @driver.find_elements(:accessibility_id => "MY PLANNER")
  end

  def account_btn
    @driver.find_elements(:accessibility_id =>  "ACCOUNT")
  end

  def navigate_back
     @driver.find_element(:accessibility_id => "Go back")

  end

  def navigate_back_to_my_planner
    @driver.find_element(:xpath =>"//android.widget.ImageButton[@content-desc='Navigate up']")
  end

  def browse_houses_navigate_back
     @driver.find_element(:accessibility_id => "GO back")

  end

  def account_button
    # @driver.find_element(:accessibility_id => "ACCOUNT")
    @driver.find_element(:xpath => "//android.view.ViewGroup//android.widget.FrameLayout[4]/android.widget.ImageView")
  end

  def post_link
    @driver.find_element()
  end

  def noticeboard_title
    @driver.find_element()
  end

  def noticeboard_text_input
    @driver.find_element()
  end

  def view_post

    @driver.find_element()

  end

  def delete_post
    @driver.find_element()
  end

  def delete_post_check

    @driver.find_elements()

  end

  def view_another_noticeboard_1

    @driver.find_element()

  end

  def soho_house_berlin

    @driver.find_element()

  end

  def soho_berlin_noticeboard_title

    @driver.find_element()

  end

  def view_another_board_post

    @driver.find_element()

  end

  def delete_another_board_post_check

    @driver.find_elements()

  end

  def posts_today

    @driver.find_element()

  end

  def modal_close

    @driver.find_element()

  end


end
