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

  def free_member_event
    @driver.find_element(:name =>""+@member_free_event_name+"")
  end

  def free_screening_event
    @driver.find_element(:name =>""+@screening_free_event_name+"")
  end

  def free_gym_event
    @driver.find_element(:name =>""+@gym_free_event_name+"")
  end

  def member_event_section(section)
    @driver.find_element(:name => ""+section+"")
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

  def confirm_payment
    @driver.find_element(:name =>"Confirm payment")
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

end


class Android_Whatson_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def whatson_filter
    @driver.find_element(:id => "com.sohohouse.seven:id/filter_btn")
  end

  def whatson_options(button)

    @driver.find_element(:xpath => "//android.widget.TextView[@text = \"#{button}\"]")

  end

  def whatson_title
    @driver.find_element(:id => "com.sohohouse.seven:id/whats_on_header")
  end

  def member_event
    # @member_event_name = name + " " + run_id\
     @driver.find_element(:xpath => "android.widget.TextView[@text = \"#{@member_event_name}\"]")
     # @driver.find_elements(:xpath =>"'android.widget.TextView[@text = "+member_event_name+"]'")
  end

end