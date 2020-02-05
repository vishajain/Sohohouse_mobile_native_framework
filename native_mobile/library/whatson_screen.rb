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

    sleep 2

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


  def find_paid_event(section)

    sleep 2

    @i = 1

    while @i <  10

      begin

        if section == "Events"

              if Common.wait_for(12){@device_whatson_objects.paid_member_event.displayed?}

                sleep 2

                Common.wait_for(5){@device_whatson_objects.paid_member_event.click}

                return true

                break

              end


        elsif section == "Screenings"

               if Common.wait_for(12){@device_whatson_objects.paid_screening_event.displayed?}

                 sleep 2

                 Common.wait_for(5){@device_whatson_objects.paid_screening_event.click}

                 return true

                 break

               end


        elsif section == "Gym classes"

              if Common.wait_for(12){@device_whatson_objects.paid_gym_event.displayed?}

                sleep 2

                Common.wait_for(5){@device_whatson_objects.paid_gym_event.click}

                return true

                break

              end

        elsif section == "SW Events"

              if Common.wait_for(12){@device_whatson_objects.active_member_event.displayed?}

                sleep 2

                Common.wait_for(5){@device_whatson_objects.active_member_event}.click

                return true

                break

              end

        elsif section == "SW Gym"

              if Common.wait_for(12){@device_whatson_objects.active_gym_event.displayed?}

                sleep 2

                Common.wait_for(5){@device_whatson_objects.active_gym_event.click}

                return true

                break

              end

      end

      rescue

         Common.little_swipe_down

         @i = @i+1

      end

    end

  end

  def find_free_event(section)

    sleep 2

    i = 0

    while i <  10

      begin

        if section == "Events"

          Common.wait_for(12){@device_whatson_objects.free_member_event.displayed?}

          sleep 2

          Common.wait_for(5){@device_whatson_objects.free_member_event.click}

          return true

          break

        elsif section == "Screenings"

          Common.wait_for(12){@device_whatson_objects.free_screening_event.displayed?}

          sleep 2

          Common.wait_for(5){@device_whatson_objects.free_screening_event.click}

          return true

          break

        elsif section == "Gym classes"

          Common.wait_for(12){@device_whatson_objects.free_gym_event.displayed?}

          sleep 2

          Common.wait_for(5){@device_whatson_objects.free_gym_event.click}

          return true

          break

        end

      rescue

        Common.swipe_down

        i = i+1

      end

    end

  end


  def verify_member_section(section)


    if Common.wait_for(10){@device_whatson_objects.member_event_section(section).displayed?}

      Common.little_swipe_down

      return true

    end

  end

  def verify_content(section)

  if Common.wait_for(10){@device_whatson_objects.member_event_section(section).displayed?}

    return true

  end

  end

  def cancel_guest_booking

    Common.wait_for(10){@device_whatson_objects.icon_close.click}

  end


  def book_member_event

      # Common.wait_for(10){@device_whatson_objects.icon_plus.click}
      #
      sleep 1

      $driver.action.move_to(@device_whatson_objects.icon_plus).click.perform

      $driver.action.move_to(@device_whatson_objects.buy_tickets).click.perform

      # Common.wait_for(10){@device_whatson_objects.buy_tickets.click}

  end

  def book_no_guests_member_event
    #
    sleep 1

    $driver.action.move_to(@device_whatson_objects.buy_tickets).click.perform

  end

  def invite_guests_click

    # Common.wait_for(10){@device_whatson_objects.icon_plus.click}

    $driver.action.move_to(@device_whatson_objects.icon_plus).click.perform

    $driver.action.move_to(@device_whatson_objects.invite_guests).click.perform

    # Common.wait_for(10){@device_whatson_objects.buy_tickets.click}

  end

  def book_free_member_event

    $driver.action.move_to(@device_whatson_objects.icon_plus).click.perform

    $driver.action.move_to(@device_whatson_objects.book).click.perform

  end

  def book_no_guests_free_member_event

    $driver.action.move_to(@device_whatson_objects.book).click.perform

  end

  def book_free_gym_event

    $driver.action.move_to(@device_whatson_objects.book).click.perform

  end


  def buy_tickets_click

    # Common.wait_for(5){@device_whatson_objects.buy_tickets_2.click}

    $driver.action.move_to(@device_whatson_objects.buy_tickets_2).click.perform

  end

  def verify_you_on_guest_list

    sleep 18

    str = Common.wait_for(25){@device_whatson_objects.booking_status}.text

      if str.include?("YOU'RE ON THE GUEST LIST")
        return true
      elsif str.include?("we'll get back to you shortly")
        return true
      elsif str.include?("Thanks for your booking request")
        return true
      end

  end

  def verify_guest_list_status_on_event_screen

    sleep 1

    if $device == "ios"

       Common.swipe_top

    end

    return Common.wait_for(10){@device_whatson_objects.you_are_on_the_guest_list.displayed?}

  end

  def ok_btn_click

    Common.wait_for(10){@device_whatson_objects.ok_button.click}

  end

  def verify_cancel_booking

    Common.wait_for(10){@device_whatson_objects.cancel_booking.click}

    if $device == "android"

      Common.wait_for(10){@device_whatson_objects.cancel_yes.click}

    end

    begin

      Common.wait_for(10){@device_whatson_objects.cancel_booking.displayed?}

    rescue

      return true

    end

  end

  def navigate_to_events_list

    sleep 3

    Common.wait_for(10){@device_whatson_objects.icon_left.click}

  end

  def scroll_to_top (section)

    if $device == "ios"

      loop do

        begin

          Common.wait_for(10){@device_whatson_objects.whatson_options(section).displayed?}

          return true

          break

        rescue

          Common.swipe_top

        end

      end

    else

      while @i > 0

          sleep 2

          Common.swipe_top

          @i = @i - 1

      end

      return true

     end

    end

  def confirm_deposit_click

     # @device_whatson_objects.confirm_deposit.click

     $driver.action.move_to(@device_whatson_objects.confirm_deposit).click.perform
     #

  end

  def book_screening_event

    $driver.action.move_to(@device_whatson_objects.icon_plus).click.perform

    $driver.action.move_to(@device_whatson_objects.book_and_pay).click.perform

  end

  def verify_book_and_pay_displayed

    return Common.wait_for(10){@device_whatson_objects.book_and_pay.displayed?}

  end

  def book_gym_event

    sleep 3
    if $device == "ios"
      $driver.action.move_to(@device_whatson_objects.book_and_pay).click.perform
    else
      Common.wait_for(10){@device_whatson_objects.book_and_pay}.click
    end

  end

  def tap_get_it_free

    Common.wait_for(10){@device_whatson_objects.get_it_free.click}

  end

  def filter_click

    Common.wait_for(10){@device_whatson_objects.whatson_filter.click}

  end

  def soho_berlien_click

    i = 0

    # puts "count is"
    # puts Common.wait_for(2){@device_whatson_objects.your_houses.size}
    while i < Common.wait_for(2){@device_whatson_objects.your_houses.size}

      # puts Common.wait_for(2){@device_whatson_objects.your_houses[i]}.text

      Common.wait_for(2){@device_whatson_objects.your_houses[i].click}

      i=i+1

    end

    Common.wait_for(10){@device_whatson_objects.tap_europe.click}

    Common.wait_for(10){@device_whatson_objects.tap_soho_berlin.click}

    Common.wait_for(10){@device_whatson_objects.confirm.click}

  end

  def results_check

    return Common.wait_for(10){@device_whatson_objects.berlin_result.displayed?}

  end

end
