
require 'rubygems'
require 'appium_lib'
# require 'watir'
require 'selenium-webdriver'
require "test/unit"
require 'yaml'
require_relative '../pageobjects/home_objects'
require_relative '../pageobjects/houseboard_objects'
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

    return Common.wait_for(20) {@device_blackslate_objects.house_name.displayed?}

  end

  def verify_house_name_click

    Common.wait_for(20) {@device_blackslate_objects.house_name}.click

    # if Common.wait_for(20) {@device_blackslate_objects.house_name}.displayed?
    #
      Common.wait_for(20) {@device_blackslate_objects.browse_houses_back_button}.click

      return true

    # else
    #
    #   return false

    # end

  end

  def verify_membership_card

    if Common.wait_for(20) {@device_blackslate_objects.membership_card}.displayed?

      Common.wait_for(10){@device_blackslate_objects.membership_card}.click

      Common.wait_for(20) {@device_blackslate_objects.membership_card_back_button}.click

      return true

    end

  end

  def verify_book_a_bedroom

    if Common.wait_for(20) {@device_blackslate_objects.book_a_bedroom}.displayed?

      Common.wait_for(10){@device_blackslate_objects.book_a_bedroom}.click

      sleep 12

      Common.wait_for(20) {@device_blackslate_objects.icon_left}.click

      return true

    end

  end

  def verify_contact_a_house

    if Common.wait_for(20) {@device_blackslate_objects.contact_a_house}.displayed?

      Common.wait_for(10){@device_blackslate_objects.contact_a_house}.click

      sleep 20

      Common.wait_for(20) {@device_blackslate_objects.icon_left}.click

      return true

    end

  end

  def verify_house_rules

    if Common.wait_for(20) {@device_blackslate_objects.house_rules}.displayed?

      Common.wait_for(10){@device_blackslate_objects.house_rules}.click

      sleep 20

      Common.wait_for(20) {@device_blackslate_objects.icon_left}.click

      return true

    end

  end

  def home_screen_navigate

    # Common.wait_for(5){@device_blackslate_objects.close_blackslate.click}

    $driver.action.move_to(@device_blackslate_objects.close_blackslate).click.perform

    return true

  end

  def verify_upcoming_bookings

    return Common.wait_for(20) {@device_blackslate_objects.upcoming_bookings}.displayed?

  end

  def verify_upcoming_bookings_events

    if Common.wait_for(20) {@device_blackslate_objects.event}.size >= 4
      return true
    else
      return false
    end

  end

  def verify_event_status

    if Common.wait_for(20) {@device_blackslate_objects.event_status_one_event}.text.include? "YOU'RE ON THE GUEST LIST"
      return true
    elsif Common.wait_for(20) {@device_blackslate_objects.event_status_multi_event}.text.include? "YOU'RE ON THE GUEST LIST"
      return true
    end

  end

  def verify_multi_events_present

    if Common.wait_for(20) {@device_blackslate_objects.event}.size > 4
      return true
    else
      return false
    end

  end

  def verify_scroll_left

    locat = Common.wait_for(20) {@device_blackslate_objects.upcoming_bookings}.location

    x =  locat["x"]
    y =  locat["y"]

    startY = y+55
    endY = y+55

    before_swipe_string = Common.wait_for(20) {@device_blackslate_objects.event_title_first_event}.text

    Common.swipe_left(startY,endY)

    sleep 3

    after_swipe_string = Common.wait_for(20) {@device_blackslate_objects.event_title_first_event}.text

    if  before_swipe_string == after_swipe_string
      return false
    else
      return true
    end

  end

  def verify_max_seven_events

    locat = Common.wait_for(20) {@device_blackslate_objects.upcoming_bookings}.location

    x =  locat["x"]
    y =  locat["y"]

    startY = y+55
    endY = y+55
    @events_count = 1

    before_swipe_string = Common.wait_for(20) {@device_blackslate_objects.event_title_first_event}.text

    sleep 3

    loop do

      puts Common.wait_for(20) {@device_blackslate_objects.event_title_first_event}.text
      puts @events_count

      Common.swipe_left(startY,endY)

      after_swipe_string = Common.wait_for(20) {@device_blackslate_objects.event_title_first_event}.text

      if  before_swipe_string.equal? after_swipe_string

        break

      else

        @events_count = @events_count + 1

        before_swipe_string = Common.wait_for(20) {@device_blackslate_objects.event_title_first_event}.text

        sleep 3

      end

    end

    if @events_count > 7

      return false

    else

      return true

    end

  end

end