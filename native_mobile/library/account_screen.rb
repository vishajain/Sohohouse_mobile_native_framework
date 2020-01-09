
require 'rubygems'
require 'appium_lib'
# require 'watir'
require 'selenium-webdriver'
require "test/unit"
require 'yaml'
require_relative '../pageobjects/home_objects'
require_relative '../pageobjects/account_objects'
require_relative '../../common/functions_common'

class AccountScreen

  def initialize()

    if $device == "ios"
      @device_home_objects = Ios_Home_Objects.new($driver, $driver_appium)
      @device_account_objects = Ios_Account_Objects.new($driver, $driver_appium)

    else
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

    Common.wait_for(10){@device_account_objects.account_title}.click

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

      @device_account_objects.sync_calendar.click

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

    if Common.wait_for(20) {@device_account_objects.perkTitle.displayed?}
      return true
    else
      return false
    end

  end

  def verify_perks_location

    if Common.wait_for(20) {@device_account_objects.perkLocation.displayed?}
      return true
    else
      return false
    end

  end

  def tap_first_perk

    $driver.action.move_to(@device_account_objects.perkTitle).click.perform

    # Common.wait_for(5) {@device_account_objects.perkTitle.click}

    return true

  end

  def verify_perk_content_image

    if Common.wait_for(20) {@device_account_objects.perkContentImage.displayed?}
      return true
    else
      return false
    end

  end

  def verify_perk_content_location

    if Common.wait_for(20) {@device_account_objects.perkContentLocation.displayed?}
      return true
    else
      return false
    end

  end

  def verify_perk_content_title

    if Common.wait_for(20) {@device_account_objects.perkContentTitle.displayed?}
      return true
    else
      return false
    end

  end

  def verify_perk_content_desc

    if Common.wait_for(20) {@device_account_objects.perkContentDesc.displayed?}
      return true
    else
      return false
    end

  end

  def iconLeft

    if $device == "ios"

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

end

