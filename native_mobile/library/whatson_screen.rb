require 'rubygems'
require 'appium_lib'
# require 'watir'
require 'selenium-webdriver'
require "test/unit"
require 'yaml'
require_relative '../pageobjects/whatson_objects'
require_relative '../../common/functions_common'

class WhatsonScreen


  def initialize()

    if $device == "ios"
      @device_home_objects = Ios_Home_Objects.new($driver, $driver_appium)
      @device_whatson_objects = Ios_Whatson_Objects.new($driver, $driver_appium)

    else
      @device_home_objects = Android_Home_Objects.new($driver, $driver_appium)
      @device_whatson_objects = Android_Whatson_Objects.new($driver, $driver_appium)

    end

  end

  def verify_whatson_title


    if Common.wait_for(20) {@device_whatson_objects.whatson_title.displayed?}

      return true

    end

  end

  def verify_whatson_filter

    if Common.wait_for(5) {@device_whatson_objects.whatson_filter.displayed?}

      return true

    end

  end

  def verify_whatson_options(button)

    if Common.wait_for(5){@device_whatson_objects.whatson_options(button).displayed?}

      return true

    end

  end

  def events_click(button)

    Common.wait_for(5){@device_whatson_objects.whatson_options(button).click}

  end

  def  verify_multiple_events

    if Common.wait_for(2){@device_whatson_objects.mutiple_events.size} > 0

    end

  end



  # def find_member_event
  #
  #   swipe_down_count = 0
  #
  #   if Common.wait_for(2){@device_whatson_objects.member_event.size} > 0
  #
  #     locat = @device_whatson_objects.member_event[0].location
  #
  #     x =  locat["x"]
  #     y =  locat["y"]
  #
  #     if y > $dimensions_height
  #       swipe_down_count = swipe_down_count + 1
  #       Common.swipe_down
  #     elsif x==0 and y==100
  #       swipe_down_count = swipe_down_count + 1
  #       Common.swipe_down
  #     end
  #   end
  #
  #   loop do
  #     if Common.wait_for(5){@device_whatson_objects.member_event.size} > 0
  #        locat = @device_whatson_objects.member_event[0].location
  #         y =  locat["y"]
  #     end
  #     if Common.wait_for(5){@device_whatson_objects.member_event.size} > 0 and y > 0
  #       @found = 1
  #       break
  #     else
  #       if swipe_down_count < 6
  #          Common.swipe_down
  #          sleep 1
  #          swipe_down_count = swipe_down_count+1
  #       else
  #          @found = 0
  #          break
  #       end
  #     end
  #   end
  #   if @found == 1
  #     return true
  #   else
  #     return false
  #   end
  #
  # end
  #
  # def find_member_event_click
  #
  #   if @found == 1
  #    Common.wait_for(2){@device_whatson_objects.member_event[0].click}
  #   else
  #     puts "Member Event not found"
  #   end
  #
  # end


  def find_member_event

    sleep 5

    i = 0

    while i <  7

      if Common.wait_for(5){@device_whatson_objects.member_event}.displayed?

        Common.wait_for(5){@device_whatson_objects.member_event}.click

        return true

        break

      else

        Common.swipe_down

        i = i+1

      end

    end

  end

  def verify_member_section(section)

    Common.little_swipe_down

    if Common.wait_for(10){@device_whatson_objects.member_event_section(section)}.displayed?

      return true

    end

  end


  def book_member_event

      # Common.wait_for(10){@device_whatson_objects.icon_plus.click}

      $driver.action.move_to(@device_whatson_objects.icon_plus).click.perform

      $driver.action.move_to(@device_whatson_objects.buy_tickets).click.perform

      # Common.wait_for(10){@device_whatson_objects.buy_tickets.click}

  end

  def buy_tickets_click

    # Common.wait_for(5){@device_whatson_objects.buy_tickets_2.click}

    $driver.action.move_to(@device_whatson_objects.buy_tickets_2).click.perform

  end

  def verify_you_on_guest_list(section)

    if Common.wait_for(25){@device_whatson_objects.member_event_section(section)}.displayed?

      return true

    end

  end

end
