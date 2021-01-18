require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require 'yaml'
require "test/unit"

class Ios_Whatson_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver

    config       = {props: YAML.load_file(File.join(File.dirname(__FILE__), '../../config/testdata.yml'))}
    # run_id       = config[:props]["data"]["run-id"]
    @member_paid_event_name         = config[:props]["data"]["event"]["paid-event"]
    @screening_paid_event_name       = config[:props]["data"]["screen"]["paid-event"]
    @gym_paid_event_name             = config[:props]["data"]["Gym"]["paid-event"]
    @member_free_event_name         = config[:props]["data"]["event"]["free-event"]
    @screening_free_event_name       = config[:props]["data"]["screen"]["free-event"]
    @gym_free_event_name             = config[:props]["data"]["Gym"]["free-event"]
    @active_member_event            = config[:props]["data"]["active-site"]["member-event"]
    @active_gym_event            = config[:props]["data"]["active-site"]["gym-event"]
    $planner_member_event         = config[:props]["data"]["my-planner"]["member-event"]
    $planner_gym_event         = config[:props]["data"]["my-planner"]["gym-event"]

  end

  def whatson_title
    @driver.find_element(:name => "What's on")
  end

  def whatson_filter
    @driver.find_element(:name => "iconFilter")
  end

  def whatson_options(button)
    @driver.find_element(:name => ""+button+"")
  end

  def paid_member_event
    @driver.find_element(:name =>""+@member_paid_event_name+"")
  end

  def paid_screening_event
    @driver.find_element(:name =>""+@screening_paid_event_name+"")
  end

  def paid_gym_event
    @driver.find_element(:name =>""+@gym_paid_event_name+"")
  end

  def active_member_event
    @driver.find_element(:name =>""+@active_member_event+"")
  end

  def active_gym_event
    @driver.find_element(:name =>""+@active_gym_event+"")
  end

  def free_member_event
    @driver.find_element(:name =>""+@member_free_event_name+"")
  end

  def free_screening_event
    @driver.find_element(:name =>""+@screening_free_event_name+"")
  end

  def free_gym_event
    @driver.find_element(:name =>""+@gym_free_event_name+"")
  end

  def planner_member_event
    @driver.find_element(:name =>""+$planner_member_event+"")
  end

  def planner_gym_event
    @driver.find_element(:name =>""+$planner_gym_event+"")
  end

  def member_event_section(section)
    @driver.find_element(:name => ""+section+"")
  end

  def booking_status
    @driver.find_element(:xpath => "//XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText")
  end

  def icon_plus
    @driver.find_element(:name =>"iconPlusSmall")
  end

  def icon_minus
    @driver.find_element(:name =>"iconMinusSmall")
  end

  def buy_tickets
    @driver.find_element(:name =>"Buy tickets")
  end

  def invite_guests
    @driver.find_element(:name =>"Invite guests")
  end

  def buy_tickets_2
    @driver.find_element(:name =>"Buy ticket(s)")
  end

  def book_and_pay
    @driver.find_element(:name =>"Book & pay")
  end

  def book
    @driver.find_element(:name =>"Book")
  end

  def you_are_on_the_guest_list
    @driver.find_element(:name =>"YOU'RE ON THE GUEST LIST")
  end

  def you_are_one_guest_going
    @driver.find_element(:name =>"YOU AND 1 GUEST(S) ARE GOING")
  end

  def guest1
    @driver.find_element(:name =>"Guest 1")
  end

  def icon_close
    @driver.find_element(:name =>"iconXSmall")
  end

  def ok_button
    @driver.find_element(:name =>"OK")
  end

  def cancel_booking
    @driver.find_element(:name =>"Cancel booking")
  end

  def icon_left
    @driver.find_element(:name =>"iconLeft")
  end

  def confirm_deposit
    # @driver.find_element(:name =>"Confirm deposit")
    @driver.find_element(:xpath => "//XCUIElementTypeButton[@name='Confirm deposit']")
  end

  def your_houses
    @driver.find_elements(:xpath => "//XCUIElementTypeStaticText[@name='Your Houses']//parent::XCUIElementTypeCell/following-sibling::XCUIElementTypeCell[1]//XCUIElementTypeStaticText")
  end

  def tap_europe
    @driver.find_element(:name =>"Europe")
  end

  def tap_soho_berlin
    @driver.find_element(:name =>"Soho House Berlin")
  end

  def confirm
    @driver.find_element(:name =>"Confirm")
  end

  def filter_results
    @driver.find_element(:name =>"Results")
  end

  def berlin_result
    @driver.find_element(:name => "Soho House Berlin")
  end

  def active_members_only
    @driver.find_element(:xpath => "//XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[2]")
    # @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name=#{@active_gym_event}]/preceding-sibling::XCUIElementTypeStaticText[1]")
  end

  def soho_warehouse_location
    @driver.find_element(:xpath => "//XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[1]")
  end

  def find_out_more
    @driver.find_element(:name => "Find out more")
  end

  def icon_info
    @driver.find_element(:name => "iconInfo")
  end

  def text_displayed(content)
    @driver.find_element(:name => "#{content}")
  end

  def subscribe_to_active
    @driver.find_element(:name => "Subscribe to Active membership")
  end

  def subscribe_to_active_plus
    @driver.find_element(:name => "Subscribe to Active Plus membership")
  end

  def membership_enquiry
    @driver.find_element(:xpath => "//XCUIElementTypeTable/XCUIElementTypeCell[6]/XCUIElementTypeStaticText")
  end

  def enquiry_topic
    @driver.find_element(:xpath => "//XCUIElementTypeTable/XCUIElementTypeCell[8]/XCUIElementTypeStaticText")
  end

  def get_it_free
    @driver.find_element(:name =>"Get it free")
  end

  def tap_uk
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[contains(@name, 'UK')]")
  end

  def tap_shoreditch
    @driver.find_element(:name =>"Shoreditch House")
  end

end


class Android_Whatson_Objects

  def initialize(driver, driver_appium)

    @driver_appium = driver_appium
    @driver = driver

    config       = {props: YAML.load_file(File.join(File.dirname(__FILE__), '../../config/testdata.yml'))}
    # run_id       = config[:props]["data"]["run-id"]
    @member_paid_event_name         = config[:props]["data"]["event"]["paid-event"]
    @screening_paid_event_name       = config[:props]["data"]["screen"]["paid-event"]
    @gym_paid_event_name             = config[:props]["data"]["Gym"]["paid-event"]
    @member_free_event_name         = config[:props]["data"]["event"]["free-event"]
    @screening_free_event_name       = config[:props]["data"]["screen"]["free-event"]
    @gym_free_event_name             = config[:props]["data"]["Gym"]["free-event"]
    @active_member_event            = config[:props]["data"]["active-site"]["member-event"]
    @active_gym_event            = config[:props]["data"]["active-site"]["gym-event"]

  end

  def whatson_filter
    @driver.find_element(:id => "#{$currentPackage+':id'+'/filter'}")
  end

  def whatson_options(button)
    @driver.find_element(:xpath => "//android.widget.TextView[@text = \"#{button}\"]")
  end

  def whatson_title
    @driver.find_element(:id => "#{$currentPackage+':id'+'/whats_on_header'}")
  end

  def paid_member_event
    @driver.find_element(:xpath =>"//android.widget.TextView[@text =" + "'" +@member_paid_event_name+ "'" +"]")
  end

  def paid_screening_event
    @driver.find_element(:xpath =>"//android.widget.TextView[@text =" + "'" +@screening_paid_event_name+ "'" +"]")
  end

  def paid_gym_event
    @driver.find_element(:xpath =>"//android.widget.TextView[@text =" + "'" +@gym_paid_event_name+ "'" +"]")
  end

  def active_member_event
    # @driver.find_element(:name => ""+button+"")
    # @driver.find_element(:xpath =>"//android.widget.TextView[@text = #{@active_member_event}]")
    @driver.find_element(:xpath =>"//android.widget.TextView[@text =" + "'" +@active_member_event+ "'" +"]")
  end

  def active_gym_event
    @driver.find_element(:xpath =>"//android.widget.TextView[@text =" + "'" +@active_gym_event+ "'" +"]")
  end

  def free_member_event
    @driver.find_element(:xpath =>"//android.widget.TextView[@text =" + "'" +@member_free_event_name+ "'" +"]")
  end

  def free_screening_event
    @driver.find_element(:xpath =>"//android.widget.TextView[@text =" + "'" +@screening_free_event_name+ "'" +"]")
  end

  def free_gym_event
    @driver.find_element(:xpath =>"//android.widget.TextView[@text =" + "'" +@gym_free_event_name+ "'" +"]")
  end

  def cancel_yes
    @driver.find_element(:id => "android:id/button1")
  end

  def cancel_no
    @driver.find_element(:id => "android:id/button2")
  end

  def member_event_section(section)
    @driver.find_element(:xpath =>"//android.widget.TextView[@text =" + "'" +section+ "'" +"]")
  end

  def booking_status
    @driver.find_element(:id => "#{$currentPackage+':id'+'/booking_success_text'}")
  end

  def icon_plus
    @driver.find_element(:accessibility_id => "Add one")
  end

  def icon_minus
    @driver.find_element(:accessibility_id => "Remove one")
  end

  def buy_tickets
    @driver.find_element(:id => "#{$currentPackage+':id'+'/stepper_submit_button_small'}")
  end


  def invite_guests
    @driver.find_element(:id => "#{$currentPackage+':id'+'/stepper_submit_button_small'}")
  end

  def buy_tickets_2
    @driver.find_element(:id => "#{$currentPackage+':id'+'/buy_button'}")
  end

  def book_and_pay
    @driver.find_element(:id => "#{$currentPackage+':id'+'/stepper_submit_button_large'}")
  end

  def book
    @driver.find_element(:xpath =>"//android.widget.Button")
  end

  def you_are_on_the_guest_list
    @driver.find_element(:xpath =>"//android.widget.TextView[contains(@text, 'ON THE GUEST LIST')]")
  end

  def you_are_one_guest_going
    @driver.find_element(:xpath =>"//android.widget.TextView[@text = 'YOU AND 1 GUEST(S) ARE GOING']")
  end

  def guest1
    @driver.find_element(:id => "#{$currentPackage+':id'+'/guest_name_text'}")
  end

  def icon_close
    @driver.find_element(:id => "#{$currentPackage+':id'+'/close_button'}")
  end

  def ok_button
    @driver.find_element(:id => "#{$currentPackage+':id'+'/done_button'}")
  end

  def cancel_booking
    @driver.find_element(:xpath =>"//android.widget.Button[@text = 'Cancel booking']")
  end

  def icon_left
    @driver.find_element(:accessibility_id => "Go back")
  end

  def confirm_deposit
    @driver.find_element(:id => "#{$currentPackage+':id'+'/buy_button'}")
  end

  def your_houses
    @driver.find_elements(:xpath => "//android.widget.TextView[@text ='All Houses']/parent::android.view.ViewGroup/preceding-sibling::android.view.ViewGroup//android.view.ViewGroup")
  end

  def tap_europe
    @driver.find_element(:xpath =>"//android.widget.TextView[contains(@text, 'Europe')]")
  end

  def tap_soho_berlin
    @driver.find_element(:xpath =>"//android.widget.TextView[contains(@text, 'Soho House Berlin')]")
  end

  def confirm
    @driver.find_element(:id => "#{$currentPackage+':id'+'/filter_button'}")
  end

  def filter_results
    @driver.find_element(:xpath =>"//android.widget.TextView[contains(@text, 'Results')]")
  end

  def berlin_result
    @driver.find_element(:xpath =>"//android.widget.TextView[contains(@text, 'Soho House Berlin')]")
  end

  def active_members_only
    @driver.find_element(:id => "#{$currentPackage+':id'+'/component_event_status_text'}")
  end

  def soho_warehouse_location
    @driver.find_element(:id => "#{$currentPackage+':id'+'/event_location_name'}")
  end

  def find_out_more
    @driver.find_element(:id => "#{$currentPackage+':id'+'/stepper_submit_button_large'}")
  end

  def icon_info
    @driver.find_element(:id => "#{$currentPackage+':id'+'/info_icon'}")
  end

  def text_displayed(content)
    @driver.find_element(:xpath =>"//android.widget.TextView[@text =" + "'" +content+ "'" +"]")
  end

  def subscribe_to_active
    @driver.find_element(:id => "#{$currentPackage+':id'+'/subscribe_active'}")
  end

  def subscribe_to_active_plus
    @driver.find_element(:id => "#{$currentPackage+':id'+'/subscribe_active_plus'}")
  end

  def membership_enquiry
    @driver.find_element(:xpath =>"//android.widget.TextView[contains(@text, 'Membership enquiry')]")
  end

  def enquiry_topic
    @driver.find_element(:xpath =>"//android.widget.TextView[contains(@text, 'Add Active membership')]")
  end

  def get_it_free
    @driver.find_element(:id => "#{$currentPackage+':id'+'/subscribe'}")
  end

  def submit
    @driver.find_element(:id => "#{$currentPackage+':id'+'/submit_button'}")
  end

  def house_icon
    @driver.find_element(:id => "#{$currentPackage+':id'+'/house_icon'}")
  end

  def booking_status
    @driver.find_element(:id => "#{$currentPackage+':id'+'/booking_success_text'}")
  end

  def booking_status1
    @driver.find_element(:id => "#{$currentPackage+':id'+'/guest_wait_list_text'}")
  end

  def button_r
    @driver.find_element(:id => "#{$currentPackage+':id'+'/stepper_submit_button_small'}")
  end

  def card_number
    @driver.find_element(:xpath => "//android.view.View[@text='Card Number']/parent::android.view.View/preceding-sibling::android.widget.EditText")
  end

  def card_expiry
    @driver.find_element(:xpath => "//android.view.View[@text='EXPIRY YEAR']/parent::android.view.View/preceding-sibling::android.widget.Spinner")
  end

  def element_text(text)
    @driver.find_element(:xpath => "//*[@text='"+text+"']")
  end

  def card_cvv
    @driver.find_element(:xpath => "//android.view.View[@text='CVV']/parent::android.view.View/preceding-sibling::android.widget.EditText")
  end

  def cancel_event
    @driver.find_element(:id => "#{$currentPackage+':id'+'/leave_guest_wait_list_button'}")
  end

  def tabs
    @driver.find_element(:id => "#{$currentPackage+':id'+'/tab_layout'}")
  end

  def delete_guest
    @driver.find_element(:id => "#{$currentPackage+':id'+'/guest_delete_button'}")
  end

end