require 'rubygems'
require 'appium_lib'
# require 'watir'
require 'selenium-webdriver'
require "test/unit"
require 'yaml'
require_relative '../../common/functions_common'
require_relative '../pageobjects/home_objects'

class HomeScreen

  def initialize()
    #
    if $device == "ios"

      @device_home_objects = Ios_Home_Objects.new($driver, $driver_appium)

    else

      @device_home_objects = Android_Home_Objects.new($driver, $driver_appium)

    end

  end

  def verify_greetings()

    str = Common.wait_for(20){@device_home_objects.greetings}
    if str == "Good morning," || str == "Good evening," || str == "Good afternoon,"
      return true
    else
      return false
    end

  end


  def verify_username()

    if Common.wait_for(20) {@device_home_objects.username.displayed?}

      return true

    end

  end

  def verify_happening_now

    if Common.wait_for(5) {@device_home_objects.happening_now.displayed?}

      return true

    end

  end


  def verify_house_notes()

    if Common.wait_for(10){@device_home_objects.house_notes.displayed?}

      return true

    end

  end


  def verify_see_all_stories()

    if Common.wait_for(2){@device_home_objects.see_all_stories.size} > 0

      locat = @device_home_objects.see_all_stories[0].location

      x =  locat["x"]
      y =  locat["y"]
      if (y > $dimensions_height)
        Common.swipe_down
      elsif (x==0 and y==100)
        Common.swipe_down
      end
    else
      return false
    end

      i = 1

      loop do

         if Common.wait_for(2){@device_home_objects.see_all_stories.size} > 0
           return true
           break
         else
           puts i
           i = i+1
           Common.swipe_down
         end

         if i < 4
           return false
           break
         end

      end
  end

  def verify_noticeboard()

    if Common.wait_for(5){@device_home_objects.noticeboard.displayed?}

      return true

    end

  end

  def verify_house_perks()

    if Common.wait_for(5){@device_home_objects.house_perks.displayed?}

      return true

    end

  end

  def verify_browse_houses()

    if Common.wait_for(5){@device_home_objects.browse_houses.displayed?}

      return true

    end

  end

  def verify_footer_buttons(button)

    if Common.wait_for(5){@device_home_objects.footer_buttons(button).displayed?}

      return true

    end

  end

  def verify_whatson_click

    Common.wait_for(5){@device_home_objects.whatson.click}

  end


end