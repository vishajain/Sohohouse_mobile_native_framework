require 'rubygems'
require 'appium_lib'
# require 'watir'
require 'selenium-webdriver'
require "test/unit"
require 'yaml'
require_relative '../pageobjects/whatson_objects'
require_relative '../pageobjects/myplanner_objects'
require_relative '../pageobjects/home_objects'


class MyplannerScreen

  include Common

  def initialize()

    if $device == "ios"
      @device_home_objects = Ios_Home_Objects.new($driver, $driver_appium)
      @device_whatson_objects = Ios_Whatson_Objects.new($driver, $driver_appium)
      @device_myplanner_objects = Ios_Myplanner_Objects.new($driver, $driver_appium)

    else
      @device_home_objects = Android_Home_Objects.new($driver, $driver_appium)
      @device_whatson_objects = Android_Whatson_Objects.new($driver, $driver_appium)
      @device_myplanner_objects = Android_Myplanner_Objects.new($driver, $driver_appium)

    end

  end

  def verify_myplanner_title

    if Common.wait_for(20) {@device_myplanner_objects.myplanner_title.displayed?}

      return true

    end

  end

  def verify_events_section


    if Common.wait_for(5) {@device_myplanner_objects.events_section.displayed?}

      return true

    end

  end

  def verify_events_list

    if Common.wait_for(5) {@device_myplanner_objects.events_with_list.size} > 2

      return true

    end

  end


  def verify_events_list_click

    if Common.wait_for(5) {@device_myplanner_objects.explore_events_btn.size} < 1

      Common.wait_for(5) {@device_myplanner_objects.events_with_list[0]}.click

        @device_home_objects.navigate_back_to_my_planner.click

      return true

    else

      return false

    end

  end

  def verify_no_events_list

    if Common.wait_for(5) {@device_myplanner_objects.explore_events_btn.size} > 0

      return true

    else

      return false

    end

  end

  def verify_no_events_list_click

    if Common.wait_for(5) {@device_myplanner_objects.explore_events_btn.size} > 0

      Common.wait_for(5) {@device_myplanner_objects.explore_events_btn[0]}.click

      if Common.wait_for(20) {@device_whatson_objects.whatson_title.displayed?}

        $homescreen.verify_myplanner_click

        return true

      end
    else

      return false

    end

  end

  def verify_screenings_section

    if Common.wait_for(5) {@device_myplanner_objects.screenings_section.displayed?}

      return true

    end

  end

  def verify_screenings_list_click


    if Common.wait_for(5) {@device_myplanner_objects.explore_screenings_btn.size} == 0

      Common.wait_for(5) {@device_myplanner_objects.screenings_with_list[0]}.click

        @device_home_objects.navigate_back_to_my_planner.click

      return true
    else
      return false
    end
  end

  def verify_no_screenings_list

    if Common.wait_for(5) {@device_myplanner_objects.explore_screenings_btn.size} > 0

      return true

    else

      return false

    end

  end

  def verify_no_screenings_list_click

    if Common.wait_for(5) {@device_myplanner_objects.explore_screenings_btn.size} > 0

      Common.swipe_down

      Common.wait_for(5) {@device_myplanner_objects.explore_screenings_btn[0]}.click

      if Common.wait_for(20) {@device_whatson_objects.whatson_title.displayed?}

        $homescreen.verify_myplanner_click

        return true

      end

    else

      return false

    end

  end

  def verify_classes_section

    Common.swipe_down

    if Common.wait_for(5) {@device_myplanner_objects.classes_section.displayed?}

      return true

    end

  end

  def verify_classes_list_click
    Common.swipe_down
    Common.swipe_down

    if Common.wait_for(5) {@device_myplanner_objects.explore_classes_btn}.size == 0

      Common.wait_for(5) {@device_myplanner_objects.classes_with_list[0]}.click

        @device_home_objects.navigate_back_to_my_planner.click

      return true

    else

      return false
    end
  end

  def verify_no_classes_list
    Common.swipe_down
    Common.swipe_down

    if Common.wait_for(5) {@device_myplanner_objects.explore_classes_btn.size} > 0

      return true

    else

      return false

    end

  end

  def verify_no_classes_list_click

    if Common.wait_for(5) {@device_myplanner_objects.explore_classes_btn.size} > 0

      Common.wait_for(5) {@device_myplanner_objects.explore_classes_btn[0].click}

      if Common.wait_for(20) {@device_whatson_objects.whatson_title.displayed?}

        $homescreen.verify_myplanner_click

        return true

      end

    else

      return false

    end

  end

  def verify_stay_section
    Common.swipe_down
    Common.swipe_down
    Common.swipe_down
    Common.swipe_down
    if Common.wait_for(5) {@device_myplanner_objects.stay_section.displayed?}

      return true

    end

  end

  def verify_view_bedroom_bookings

    Common.wait_for(5) {@device_myplanner_objects.view_bedroom_bookings_click.click}

    sleep 15

    Common.wait_for(20) {@device_home_objects.navigate_back.click}

    return true

  end

  def home_screen_navigate

    Common.wait_for(5){@device_myplanner_objects.homeBtn.click}

    return true

  end

end

