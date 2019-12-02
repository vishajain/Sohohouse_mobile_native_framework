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
    @member_event_name         = config[:props]["data"]["event"]["name"]
    # @member_event_name = name + " " + run_id
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

  def member_event
    @driver.find_element(:name =>""+@member_event_name+"")
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

  def confirm_payment
    @driver.find_element(:name =>"Confirm payment")
  end

  def buy_tickets_2
    @driver.find_element(:name =>"Buy ticket(s)")
  end

  def you_are_on_the_guest_list
    @driver.find_element(:name =>"YOU'RE ON THE GUEST LIST")
  end

  def OK_button
    @driver.find_element(:name =>"OK")
  end

  def cancel_booking
    @driver.find_element(:name =>"Cancel booking")
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