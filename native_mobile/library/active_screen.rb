
require 'rubygems'
require 'appium_lib'
# require 'watir'
require 'selenium-webdriver'
require "test/unit"
require 'yaml'
require_relative '../pageobjects/onboarding_objects'
require_relative '../pageobjects/home_objects'
require_relative '../pageobjects/account_objects'
require_relative '../pageobjects/whatson_objects'
require_relative '../../common/functions_common'

class ActiveScreens

  def initialize()

    if $device == "ios"

      @device_onboarding_objects = Ios_Onboarding_Objects.new($driver, $driver_appium)
      @device_home_objects = Ios_Home_Objects.new($driver, $driver_appium)
      @device_whatson_objects = Ios_Whatson_Objects.new($driver, $driver_appium)
      @device_account_objects = Ios_Account_Objects.new($driver, $driver_appium)
      # @device_active_objects = Ios_Active_Objects.new($driver, $driver_appium)

    else
      @device_onboarding_objects = Android_Onboarding_Objects.new($driver, $driver_appium)
      @device_home_objects = Android_Home_Objects.new($driver, $driver_appium)
      @device_whatson_objects = Android_Whatson_Objects.new($driver, $driver_appium)
      @device_account_objects = Android_Account_Objects.new($driver, $driver_appium)
      # @device_active_objects = Android_Active_Objects.new($driver, $driver_appium)
    end

  end

  def user_enters_email_address(email_address)

    config     = {props: YAML.load_file(File.join(File.dirname(__FILE__), '../../config/testdata.yml'))}

    email      = config[:props]["data"][email_address]

    $password   = $pass

    if $device == 'ios'

      @device_onboarding_objects.email_textfield.click

    end

    if $device == 'ios'

      @device_onboarding_objects.email_textfield.click

    end

    @device_onboarding_objects.email_textfield.send_keys(email)

    @device_onboarding_objects.password_textfield.send_keys($password)

  end

  def user_enters_password

    @device_onboarding_objects.password_textfield.send_keys("password")

  end

  def verify_active_members_only

    sleep 2

    return Common.wait_for(15) {@device_whatson_objects.active_members_only}.text.include? "ACTIVE MEMBERS"

  end

  def verify_house_members_only

    return @device_whatson_objects.active_members_only.text.include? "HOUSE MEMBERS"

  end


  def verify_soho_warehouse_location

    sleep 1

    return @device_whatson_objects.soho_warehouse_location.text.include? "Soho Warehouse"

  end

  def verify_find_out_more_btn

    return @device_whatson_objects.find_out_more.displayed?

  end

  def tap_active_members

    Common.swipe_down

    sleep 2

    Common.wait_for(15) {@device_whatson_objects.icon_info}.click

  end

  def verify_content_displayed(content)

    return Common.wait_for(10) {@device_whatson_objects.text_displayed(content).displayed?}

  end

  def tap_find_out_more

    @device_whatson_objects.find_out_more.click

  end

  def tap_link (link)

    Common.wait_for(10) {@device_whatson_objects.text_displayed(link)}.click

  end

  def tap_ok

    sleep 1

    if $device == "android"

      Common.wait_for(15) {@device_whatson_objects.cancel_yes}.click

    end

  end

  def tap_submit

    if $device == "ios"

      Common.wait_for(10) {@device_whatson_objects.text_displayed("Submit")}.click

    else

      Common.wait_for(10) {@device_whatson_objects.submit}.click

    end


  end

  def verify_membership_enquiry

    return @device_whatson_objects.membership_enquiry.text.include? "Membership enquiry"

  end


  def verify_add_active_membership

    return @device_whatson_objects.enquiry_topic.text.include? "Add Active membership"

  end


  def tap_left_btn

    sleep 3

    $driver.action.move_to(Common.wait_for(20) {@device_whatson_objects.icon_left}).click.perform

  end

end