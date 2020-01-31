
require 'rubygems'
require 'appium_lib'
# require 'watir'
require 'selenium-webdriver'
require "test/unit"
require 'yaml'
require_relative '../pageobjects/login_objects'
require_relative '../pageobjects/home_objects'
require_relative '../pageobjects/account_objects'
require_relative '../../common/functions_common'

class AccountScreen

  def initialize()

    if $device == "ios"
      @device_login_objects = Ios_Login_Objects.new($driver, $driver_appium)
      @device_home_objects = Ios_Home_Objects.new($driver, $driver_appium)
      @device_account_objects = Ios_Account_Objects.new($driver, $driver_appium)

    else
      @device_login_objects = Android_Login_Objects.new($driver, $driver_appium)
      @device_home_objects = Android_Home_Objects.new($driver, $driver_appium)
      @device_account_objects = Android_Account_Objects.new($driver, $driver_appium)

    end

  end


  def verify_account_title


    if Common.wait_for(20) {@device_account_objects.account_title}.displayed?

      @device_account_objects.account_title.click

      if Common.wait_for(20) {@device_account_objects.edit_profile_screen}.displayed?

        if $device == "ios"

          Common.wait_for(20){@device_account_objects.icon_left}.click

          return true

        else

          Common.wait_for(20){@device_account_objects.navigate_up}.click

          return true

        end

      end

    end

  end

  def tap_View_Profile

    sleep 5

    Common.swipe_top

    sleep 2

    $driver.action.move_to(@device_account_objects.account_title).click.perform

    # Common.wait_for(15){@device_account_objects.account_title}.click

  end


  def tap_edit_link

    Common.wait_for(10) {@device_account_objects.edit_profile_screen}.click

  end


  def verify_your_membership


    if Common.wait_for(20) {@device_account_objects.your_membership.displayed?}

      @device_account_objects.your_membership.click

      if Common.wait_for(20) {@device_account_objects.your_membership.displayed?}

        Common.wait_for(20){@device_account_objects.icon_left}.click

        return true

      end

    end

  end

  def verify_perks


    if Common.wait_for(20) {@device_account_objects.perks.displayed?}

      @device_account_objects.perks.click

      if Common.wait_for(20) {@device_account_objects.houseperks_title.displayed?}

        Common.wait_for(20){@device_account_objects.icon_left}.click

        return true

      end

    end

  end


  def verify_payment

    if Common.wait_for(20) {@device_account_objects.payment.displayed?}

      @device_account_objects.payment.click

      if Common.wait_for(20) {@device_account_objects.payment.displayed?}

        Common.wait_for(20){@device_account_objects.icon_left}.click

        return true

      end

    end

  end


  def verify_past_bookings

    if Common.wait_for(20) {@device_account_objects.past_bookings.displayed?}

      @device_account_objects.past_bookings.click

      if Common.wait_for(20) {@device_account_objects.past_bookings.displayed?}

        sleep 2

        Common.wait_for(20){@device_account_objects.icon_left}.click

        return true

      end

    end

  end


  def verify_change_password

    sleep 2

    Common.swipe_down

    if Common.wait_for(20) {@device_account_objects.change_password.displayed?}

      @device_account_objects.change_password.click

      if Common.wait_for(20) {@device_account_objects.change_password.displayed?}

        Common.wait_for(20){@device_account_objects.icon_left}.click

        return true

      end

    end

  end

  def verify_favourite_houses

    sleep 2

    if Common.wait_for(20) {@device_account_objects.favourite_houses.displayed?}

      @device_account_objects.favourite_houses.click

      if Common.wait_for(20) {@device_account_objects.favourite_houses.displayed?}

        if $device == "ios"

          Common.wait_for(20){@device_account_objects.icon_left}.click

          return true

        else

          Common.wait_for(20){@device_account_objects.navigate_up}.click

          return true

        end

      end

    end

  end

  def verify_notification_preferences

    Common.swipe_down

    if Common.wait_for(20) {@device_account_objects.notification_preferences.displayed?}

      @device_account_objects.notification_preferences.click

      if Common.wait_for(20) {@device_account_objects.notification_preferences.displayed?}

        Common.wait_for(20){@device_account_objects.icon_left}.click

        return true

      end

    end

  end

  def verify_sync_calendar

    if Common.wait_for(20) {@device_account_objects.sync_calendar.displayed?}

      Common.wait_for(20) {@device_account_objects.sync_calendar}.click

      if Common.wait_for(20) {@device_account_objects.myplanner_title.displayed?}

        Common.wait_for(20){@device_account_objects.icon_left}.click

        return true

      end

    end

  end

  def verify_contact_us

    if Common.wait_for(20) {@device_account_objects.contact_us.displayed?}

      @device_account_objects.contact_us.click

      if Common.wait_for(20) {@device_account_objects.contact_us.displayed?}

        Common.wait_for(20){@device_account_objects.icon_left}.click

        return true

      end

    end

  end

  def verify_faq


    if Common.wait_for(20) {@device_account_objects.faq.displayed?}

      @device_account_objects.faq.click

      # if Common.wait_for(20) {@device_account_objects.faq}.displayed?
      sleep 20

      Common.wait_for(20){@device_account_objects.icon_left}.click

        return true

      # end

    end

  end

  def verify_policies


    if Common.wait_for(20) {@device_account_objects.policies.displayed?}

      @device_account_objects.policies.click

      if Common.wait_for(20) {@device_account_objects.policies.displayed?}

        Common.wait_for(20){@device_account_objects.icon_left}.click

        return true

      end

    end

  end

  def home_screen_navigate

    Common.wait_for(5){@device_account_objects.homeBtn.click}

    return true

  end

  def tap_perks

    Common.wait_for(20) {@device_account_objects.perks.click}

    return true

  end

  def verify_perks_title

    sleep 1

    return Common.wait_for(20) {@device_account_objects.perkTitle.displayed?}

  end

  def verify_perks_location

    return Common.wait_for(30) {@device_account_objects.perkLocation.displayed?}

  end

  def tap_first_perk

    $driver.action.move_to(@device_account_objects.perkTitle).click.perform

    # Common.wait_for(5) {@device_account_objects.perkTitle.click}

    return true

  end

  def verify_perk_content_image

    return Common.wait_for(20) {@device_account_objects.perkContentImage.displayed?}


  end

  def verify_perk_content_location

    return Common.wait_for(20) {@device_account_objects.perkContentLocation.displayed?}

  end

  def verify_perk_content_title

    return Common.wait_for(20) {@device_account_objects.perkContentTitle.displayed?}

  end

  def verify_perk_content_desc

    return Common.wait_for(20) {@device_account_objects.perkContentDesc.displayed?}

  end

  def iconLeft

    if $device == "ios"

      sleep 1

      Common.wait_for(20){@device_account_objects.icon_left}.click

      return true

    else

      Common.wait_for(20){@device_account_objects.navigate_up}.click

      return true

    end

  end

  def tap_change_password

    Common.wait_for(5){@device_account_objects.change_password}.click

  end

  def provide_current_password

    @device_account_objects.current_password.send_keys($password)

  end

  def provide_new_password

    @device_account_objects.new_password.send_keys("password1")

  end

  def provide_confirm_password

    @device_account_objects.confirm_password.send_keys("password1")

  end

  def tap_save_btn

    $action.press({:x => ($dimensions_width*0.5), :y => ($dimensions_height*0.5)}).release.perform

    Common.wait_for(5){@device_account_objects.save_btn}.click

  end

  def provide_changed_password

    @device_account_objects.current_password.send_keys("password1")

  end

  def provide_orignal_new_password

    @device_account_objects.new_password.send_keys($password)

  end

  def provide_orignal_confirm_password

    @device_account_objects.confirm_password.send_keys($password)

  end

  def tap_sign_out

    sleep 2

    Common.swipe_down

    sleep 1

    Common.wait_for(5){@device_account_objects.sign_out}.click

    if $device == "android"
      Common.wait_for(5){@device_account_objects.cancel_yes}.click
    end

    return Common.wait_for(5){@device_login_objects.welcome_home.displayed?}

  end

  def verify_password_saved

    return Common.wait_for(20) {@device_account_objects.notification_preferences.displayed?}

  end

  def tap_reset

    Common.wait_for(5){@device_account_objects.reset}.click

  end

  def verify_local_house_displayed

    return Common.wait_for(20) {@device_account_objects.local_house.displayed?}

  end

  def tap_favourite_houses

    sleep 10

    Common.wait_for(10){@device_account_objects.favourite_houses}.click

  end

  def tap_save_changes

    Common.wait_for(5){@device_account_objects.save_changes}.click

  end

  def select_40_greek_street

    Common.wait_for(5){@device_account_objects.tap_uk}.click

    Common.wait_for(5){@device_account_objects.greek_St}.click

  end

  def verify_40_greek_st_displayed

    sleep 5

    return Common.wait_for(5){@device_account_objects.greek_St.displayed?}

  end

  def tap_notification_preferences

    Common.wait_for(10){@device_account_objects.notification_preferences}.click

  end

  def tap_notification_pref_switch_off(link)

    Common.wait_for(10){@device_account_objects.notification_pref_switch(link)}.click

    sleep 2

    Common.wait_for(10){@device_account_objects.notification_pref_switch(link)}.click

  end

  def verify_notification_pref_switch_value(link, value)

    str = Common.wait_for(10){@device_account_objects.notification_pref_switch_value(link)}

    return str.include? value

  end

  def tap_notification_pref_switch_on(link)

    Common.wait_for(10){@device_account_objects.notification_pref_switch(link)}.click

    sleep 1

  end

  def  tap_contact_us

    sleep 1

    Common.swipe_down

    Common.wait_for(10){@device_account_objects.contact_us}.click

  end

  def select_enquiry_type(input)

    Common.wait_for(10){@device_account_objects.enquiry_type}.click

    sleep 1

    @device_account_objects.enquiry_type.send_keys(input)

  end

  def select_enquiry_topic(input)

    Common.wait_for(10){@device_account_objects.enquiry_topic1}.click

    sleep 1

    @device_account_objects.enquiry_topic1.send_keys(input)

  end

  def input_message(input)

    @device_account_objects.enquiry_message.send_keys(input)

  end

  def tap_submit

    Common.wait_for(10){@device_account_objects.done}.click

    Common.wait_for(10){@device_account_objects.submit}.click

    sleep 8

  end

  def tap_icon_left

    Common.wait_for(20){@device_account_objects.icon_left}.click

  end

end


