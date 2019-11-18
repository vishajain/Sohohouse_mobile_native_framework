
require 'rubygems'
require 'appium_lib'
# require 'watir'
require 'selenium-webdriver'
require "test/unit"
require 'yaml'
require_relative '../pageobjects/home_objects'
require_relative '../pageobjects/blackslate_objects'
require_relative '../../common/functions_common'

class BlackslateScreen

  def initialize()

    if $device == "ios"
      @device_home_objects = Ios_Home_Objects.new($driver, $driver_appium)
      @device_blackslate_objects = Ios_Blackslate_Objects.new($driver, $driver_appium)

    else
      @device_home_objects = Android_Home_Objects.new($driver, $driver_appium)
      @device_blackslate_objects = Android_Blackslate_Objects.new($driver, $driver_appium)

    end

  end

  def verify_house_name

    str = Common.wait_for(20) {@device_blackslate_objects.house_name}.text
    return str

  end

  def verify_house_name_click

    Common.wait_for(20) {@device_blackslate_objects.house_name.click}

    # if Common.wait_for(20) {@device_blackslate_objects.house_name.displayed?}
    #
      Common.wait_for(20) {@device_blackslate_objects.browse_houses_back_button.click}

      return true

    # else
    #
    #   return false

    # end

  end

  def verify_membership_card

    if Common.wait_for(20) {@device_blackslate_objects.membership_card.displayed?}

      Common.wait_for(10){@device_blackslate_objects.membership_card.click}

      Common.wait_for(20) {@device_blackslate_objects.membership_card_back_button.click}

      return true

    end

  end

  def verify_book_a_bedroom

    if Common.wait_for(20) {@device_blackslate_objects.book_a_bedroom.displayed?}

      Common.wait_for(10){@device_blackslate_objects.book_a_bedroom.click}

      sleep 12

      Common.wait_for(20) {@device_blackslate_objects.icon_left.click}

      return true

    end

  end

  def verify_contact_a_house

    if Common.wait_for(20) {@device_blackslate_objects.contact_a_house.displayed?}

      Common.wait_for(10){@device_blackslate_objects.contact_a_house.click}

      sleep 20

      Common.wait_for(20) {@device_blackslate_objects.icon_left.click}

      return true

    end

  end

  def verify_house_rules

    if Common.wait_for(20) {@device_blackslate_objects.house_rules.displayed?}

      Common.wait_for(10){@device_blackslate_objects.house_rules.click}

      sleep 20

      Common.wait_for(20) {@device_blackslate_objects.icon_left.click}

      return true

    end

  end

end