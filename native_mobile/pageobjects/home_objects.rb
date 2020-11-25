require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require "test/unit"

class Ios_Home_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def house_name

    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name= '"+$house+"']")
  end

  def house_name_webview
    # webview = @driver.available_contexts[1]
    # @driver.set_context(webview)
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='Babington House']")
  end

  def close_blackslate
    @driver.find_element(:name => "iconX")
  end

  def browse_houses_back_button
    @driver.find_element(:name => "iconLeft")
  end

  def membership_card
    @driver.find_element(:name => "Membership card")
  end

  def membership_card_back_button
    @driver.find_element(:name => "iconLeft")
  end

  def membership_card_screen
    @driver.find_element(:name => "Your membership")
  end

  def book_a_bedroom
    @driver.find_element(:name => "Book a bedroom")
  end

  def contact_a_house
    @driver.find_element(:name => "Contact a House")
  end

  def house_rules
    @driver.find_element(:name => "House rules")
  end

  def house_rules_webview
    @driver.find_element(:xpath =>  "//XCUIElementTypeStaticText[@name='House guidelines']")
  end

  def icon_left
    @driver.find_element(:name => "iconLeft")
  end

  def upcoming_bookings
    @driver.find_element(:name => "Upcoming bookings")
  end

  def event
    @driver.find_elements(:xpath => "//XCUIElementTypeTable/XCUIElementTypeCell[3]/XCUIElementTypeStaticText")
  end

  def event_title_first_event
    @driver.find_element(:xpath => "//XCUIElementTypeCell[3]//XCUIElementTypeStaticText[8]")
  end

  def event_date_first_event
    @driver.find_element(:xpath => "//XCUIElementTypeCell[3]//XCUIElementTypeStaticText[1]")
  end

  def event_title_second_event
    @driver.find_element(:xpath => "//XCUIElementTypeCell[3]//XCUIElementTypeStaticText[3]")
  end

  def event_date_second_event
    @driver.find_element(:xpath => "//XCUIElementTypeCell[3]//XCUIElementTypeStaticText[4]")
  end

  def event_status_one_event
    @driver.find_element(:xpath => "//XCUIElementTypeCell[3]//XCUIElementTypeStaticText[6]")
  end

  def event_status_multi_event
    @driver.find_element(:xpath => "//XCUIElementTypeCell[3]//XCUIElementTypeStaticText[7]")
  end

  def section_displayed(section)
    @driver.find_element(:name => ""+section+"")
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
        @driver.find_element(:name => "Home")
    elsif button == "BOOK"
      @driver.find_element(:name => "Book")
    elsif button == "CONNECT"
      @driver.find_element(:name => "Connect")
    elsif button == "DISCOVER"
      @driver.find_element(:name => "Discover")
    elsif button == "ACCOUNT"
        @driver.find_element(:name => "Account")
    end
  end

  def homeBtn
    @driver.find_elements(:xpath => "//XCUIElementTypeTabBar[1]//XCUIElementTypeButton")
  end

  def whats_on
     @driver.find_elements(:xpath => "//XCUIElementTypeTabBar[1]/XCUIElementTypeButton")
  end

  def whats_on_1
    @driver.find_element(:xpath => "//XCUIElementTypeTabBar//XCUIElementTypeButton[2]")
  end

  def left_link
    @driver.find_element(:name => "iconLeft")
  end

  def myplanner_btn
    @driver.find_element(:xpath => "//XCUIElementTypeTabBar//XCUIElementTypeButton[3]")
  end

  def myplanner_btn_1
    @driver.find_elements(:name => "MY PLANNER")
  end

  def account_btn
    @driver.find_elements(:xpath => "//XCUIElementTypeTabBar[1]/XCUIElementTypeButton")
  end

  def navigate_back
    @driver.find_element(:xpath => "//XCUIElementTypeOther/XCUIElementTypeButton[1]")
  end

  def navigates_back
    @driver.find_element(:name => "Back")
  end

  def navigate_back_to_my_planner
    @driver.find_element(:xpath => "//XCUIElementTypeOther/XCUIElementTypeButton[1]")
  end

  def browse_houses_navigate_back
    @driver.find_element(:xpath => "//XCUIElementTypeOther/XCUIElementTypeButton[1]")
  end

  def account_button
    @driver.find_element(:name => "Account")
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

  def member_card_details
    @driver.find_element(:id => "#{$currentPackage+':id'+'/card_front'}")
  end

  def stay_with_us
    @driver.find_element(:id => "//android.view.View[@text = 'Stay with us']")
  end

  def house_guest
    @driver.find_element(:xpath =>  "//android.widget.TextView[@text = 'House Guest']")
  end

  def new_invitation
    @driver.find_element(:xpath =>  "//android.widget.TextView[@text = 'New invitation']")
   
  end


end

class Android_Home_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def house_name
    @driver.find_element(:xpath => "//android.widget.Button[@text= '"+$house+"']")
  end

  def close_blackslate
    @driver.find_element(:accessibility_id => "Return home")
  end

  # def browse_houses
  #   @driver.find_element(:xpath => "//android.widget.TextView[@text='Europe']")
  # end

  def browse_houses_back_button
    @driver.find_element(:accessibility_id => "Go back")
  end

  def membership_card
    @driver.find_element(:xpath => "//android.widget.Button[@text='Membership card']")
  end

  def membership_card_back_button
    @driver.find_element(:xpath => "//android.widget.Button[@text='Dismiss']")
  end

  def membership_card_screen
    @driver.find_element(:xpath => "//android.widget.TextView[@text='Membership type']")
  end

  def book_a_bedroom
    @driver.find_element(:xpath => "//android.widget.Button[@text='Book a bedroom']")
  end

  def contact_a_house
    @driver.find_element(:xpath => "//android.widget.Button[@text='Contact a House']")
  end

  def house_rules
    @driver.find_element(:xpath => "//android.widget.Button[@text='House rules']")
  end

  def icon_left
    @driver.find_element(:accessibility_id => "Navigate up")
  end

  def greetings
    @driver.find_element(:id => "#{$currentPackage+':id'+'/title_view'}")

  end

  def loader
    @driver.find_elements(:id => "#{$currentPackage+':id'+'/lottie_view'}")

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
    @driver.find_element(:xpath =>"//android.widget.TextView[contains(@text , '"+$house+"')]")
  end

  def view_another_noticeboard
    @driver.find_elements(:xpath =>"//android.widget.TextView[@text = 'View another Noticeboard']")
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
    @driver.find_elements(:xpath => "//android.view.ViewGroup//android.widget.FrameLayout[1]/android.widget.ImageView")
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
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Post']")
  end

  def noticeboard_title
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Noticeboard']")
  end

  def noticeboard_text_input
    @driver.find_element(:id => "#{$currentPackage+':id'+'/house_board_post_edit_text'}")
  end

  def view_post

    @driver.find_element(:xpath => "//android.widget.TextView[@text ='Now']/following-sibling::android.widget.TextView")

  end

  def post_button

    @driver.find_element(:xpath => "//android.widget.Button[@text = 'Post']")

  end

  def delete_post
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Delete post']")
  end

  def delete_post_check

    @driver.find_elements(:xpath => "//*[@text ='How are you all doing']")

  end

  def view_another_noticeboard_1

    @driver.find_element(:xpath =>"//android.widget.TextView[@text = 'View another Noticeboard']")

  end

  def soho_house_berlin

    @driver.find_element(:xpath =>"//android.widget.TextView[@text = 'Soho House Berlin']")

  end

  def soho_berlin_noticeboard_title

    @driver.find_element(:xpath =>"//android.widget.TextView[@text = 'Soho House Berlin Noticeboard']")

  end

  def view_another_board_post

    @driver.find_element(:xpath => "//android.widget.TextView[@text ='Now']/following-sibling::android.widget.TextView")

  end

  def delete_another_board_post_check

    @driver.find_elements(:xpath => "//*[@text ='How are you all doing']")

  end

  def posts_today

    @driver.find_element(:xpath => "//android.widget.TextView[@text = '"+$house+"']/following-sibling::android.widget.LinearLayout//android.widget.TextView")

  end

  def modal_close

    @driver.find_element(:accessibility_id => "Go back")

  end
  def house_name_webview

    @driver.find_element(:xpath =>"//android.view.View[@text = '"+$house+"']/following-sibling::android.view.View//android.view.View[@text = 'House']")
  end

  def member_card_details
    @driver.find_element(:id => "#{$currentPackage+':id'+'/card_front'}")
  end

  def stay_with_us
    @driver.find_element(:xpath => "//android.view.View[@text = 'Stay with us']")
  end


  def house_rules_webview
    @driver.find_element(:xpath =>  "//android.view.View[@text = 'Soho House & Co']/following-sibling::android.view.View//android.view.View[@text = 'House Rules']")
  end

  def house_guest
    @driver.find_element(:xpath =>  "//android.widget.TextView[@text = 'House Guest']")
  end


  def new_invitation
    @driver.find_element(:xpath =>  "//android.widget.TextView[@text = 'New invitation']")
  end

  def nav_bar
    @driver.find_element(:xpath =>  "//*[contains(@resource-id , 'bottom_navigation_view') or @text='Save changes']")
  end
end
