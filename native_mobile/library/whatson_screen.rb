require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require "test/unit"
require 'yaml'
require 'json'
require_relative '../pageobjects/whatson_objects'
require_relative '../../common/functions_common'
require_relative '../../common/common_objects'
require_relative '../../common/api_call'

class WhatsonScreen


  def initialize()

    if $device == "ios"
      @device_home_objects = Ios_Home_Objects.new($driver, $driver_appium)
      @device_whatson_objects = Ios_Whatson_Objects.new($driver, $driver_appium)
      @device_account_objects = Ios_Account_Objects.new($driver, $driver_appium)
      @device_guestinvitation_objects = Ios_GuestInvitation_Objects.new($driver, $driver_appium)
      @device_common_objects = Ios_Common_Objects.new($driver, $driver_appium)


    else
      @device_home_objects = Android_Home_Objects.new($driver, $driver_appium)
      @device_whatson_objects = Android_Whatson_Objects.new($driver, $driver_appium)
      @device_account_objects = Android_Account_Objects.new($driver, $driver_appium)
      @device_guestinvitation_objects = Android_GuestInvitation_Objects.new($driver, $driver_appium)
      @device_common_objects = Android_Common_Objects.new($driver, $driver_appium)

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

    sleep 1

    if $device =="ios"

      $common_screen.click_element_with_partial_text(button)

    else
      sleep 1

      Common.home_panel_swipe(@device_whatson_objects.tabs,"right")

      i=0

      loop do

        begin

          if @device_whatson_objects.whatson_options(button).displayed?

            @device_whatson_objects.whatson_options(button).click

            break

          else

            raise StandardError.new "This is an exception"

          end

        rescue


          Common.home_panel_swipe(@device_whatson_objects.tabs,"left")
          sleep 2
          i=i+1
          if i>3
            break
          end
        end
      end
    end

  end

  def  verify_multiple_events

    if Common.wait_for(2){@device_whatson_objects.mutiple_events.size} > 0

    end

  end

  def find_paid_event(section)

    sleep 2

    @i = 0

    while @i <  12

      begin

        if section == "Events"

              if Common.wait_for(12){@device_whatson_objects.paid_member_event.displayed?}

                sleep 2

                Common.wait_for(5){@device_whatson_objects.paid_member_event.click}

                sleep 2

                begin

                  if Common.wait_for(3){@device_whatson_objects.cancel_booking.displayed?}

                    Common.wait_for(3){@device_whatson_objects.cancel_booking}.click

                  end

                rescue

                end

                return true

              end


        elsif section == "Screenings"

               if Common.wait_for(12){@device_whatson_objects.paid_screening_event.displayed?}

                 sleep 2

                 Common.wait_for(5){@device_whatson_objects.paid_screening_event.click}

                 sleep 2

                 begin

                   if Common.wait_for(3){@device_whatson_objects.cancel_booking.displayed?}

                     Common.wait_for(3){@device_whatson_objects.cancel_booking}.click

                   end

                 rescue

                 end

                 return true

               end


        elsif section == "Gym classes"

              if Common.wait_for(12){@device_whatson_objects.paid_gym_event.displayed?}

                sleep 2

                Common.wait_for(5){@device_whatson_objects.paid_gym_event.click}

                sleep 2

                begin

                  if Common.wait_for(3){@device_whatson_objects.cancel_booking.displayed?}

                    Common.wait_for(3){@device_whatson_objects.cancel_booking}.click

                  end

                rescue

                end

                return true

              end

        elsif section == "SW Events"

              if Common.wait_for(12){@device_whatson_objects.active_member_event.displayed?}

                sleep 2

                Common.wait_for(5){@device_whatson_objects.active_member_event}.click

                sleep 2

                begin

                  if Common.wait_for(3){@device_whatson_objects.cancel_booking.displayed?}

                    Common.wait_for(3){@device_whatson_objects.cancel_booking}.click

                  end

                rescue

                end

                return true

              end

        elsif section == "SW Gym"

              if Common.wait_for(12){@device_whatson_objects.active_gym_event.displayed?}

                sleep 2

                Common.wait_for(5){@device_whatson_objects.active_gym_event.click}

                sleep 2

                begin

                  if Common.wait_for(3){@device_whatson_objects.cancel_booking.displayed?}

                    Common.wait_for(3){@device_whatson_objects.cancel_booking}.click

                  end

                rescue

                end

                return true

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

    while i <  12

      begin

        if section == "Events"

          Common.wait_for(12){@device_whatson_objects.free_member_event.displayed?}

          sleep 2

          Common.wait_for(5){@device_whatson_objects.free_member_event.click}

          sleep 2

          begin

            if Common.wait_for(3){@device_whatson_objects.cancel_booking.displayed?}

              Common.wait_for(3){@device_whatson_objects.cancel_booking}.click

            end

          rescue

          end

          return true

        elsif section == "Screenings"

          Common.wait_for(12){@device_whatson_objects.free_screening_event.displayed?}

          sleep 2

          Common.wait_for(5){@device_whatson_objects.free_screening_event.click}

          begin

            sleep 2

            if Common.wait_for(3){@device_whatson_objects.cancel_booking.displayed?}

              Common.wait_for(3){@device_whatson_objects.cancel_booking}.click

            end

          rescue

          end

          return true

        elsif section == "Gym classes"

          Common.wait_for(12){@device_whatson_objects.free_gym_event.displayed?}

          sleep 2

          Common.wait_for(5){@device_whatson_objects.free_gym_event.click}

          begin

            sleep 2

            if Common.wait_for(3){@device_whatson_objects.cancel_booking.displayed?}

              Common.wait_for(3){@device_whatson_objects.cancel_booking}.click

            end

          rescue

          end

          return true

        elsif section == "My planner member"

          Common.wait_for(12){@device_whatson_objects.planner_member_event.displayed?}

          sleep 2

          Common.wait_for(5){@device_whatson_objects.planner_member_event.click}

          begin

            sleep 2

            if Common.wait_for(3){@device_whatson_objects.cancel_booking.displayed?}

              Common.wait_for(3){@device_whatson_objects.cancel_booking}.click

            end

          rescue

          end

          return true

        elsif section == "My planner gym"

          Common.wait_for(12){@device_whatson_objects.planner_gym_event.displayed?}

          sleep 2

          Common.wait_for(5){@device_whatson_objects.planner_gym_event.click}

          sleep 2

          begin

            if Common.wait_for(3){@device_whatson_objects.cancel_booking.displayed?}

              Common.wait_for(3){@device_whatson_objects.cancel_booking}.click

            end

          rescue

          end

          return true

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

      sleep 1

      $driver.action.move_to(@device_whatson_objects.icon_plus).click.perform

      $driver.action.move_to(@device_whatson_objects.buy_tickets).click.perform

  end

  def book_no_guests_member_event

    sleep 1

    $driver.action.move_to(@device_whatson_objects.buy_tickets).click.perform

  end

  def invite_guests_click

    $driver.action.move_to(@device_whatson_objects.icon_plus).click.perform

    $driver.action.move_to(@device_whatson_objects.invite_guests).click.perform

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

    begin

      return Common.wait_for(10){@device_whatson_objects.you_are_on_the_guest_list.displayed?}

    rescue

      return false

    end


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

     $driver.action.move_to(@device_whatson_objects.confirm_deposit).click.perform

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

    while i < Common.wait_for(2){@device_whatson_objects.your_houses.size}

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

  def setFilterLocation

    sleep 3

    $device=="ios"?reset_text="Reset":reset_text="RESET FILTERS"

    @device_whatson_objects.whatson_filter.click

    @device_account_objects.ElementsWithText("Reset to defaults").click

    begin
      (Common.wait_for(5){ @device_guestinvitation_objects.ButtonWithText(reset_text)}.click)
    rescue
    end

    $device=="android"?$common_screen.click_element_with_partial_text("UK"):()

    element_count = Common.wait_for(10){@device_whatson_objects.filter_remove_house.size}

    element=@device_whatson_objects.filter_remove_house
    i=0

    if element_count > 0

      loop do

        element[i].click
        sleep 1

        i = i+1

        if i>=element_count

          break

        end

      end

    end

    $accountscreen.select_76_dean_house

    @device_whatson_objects.confirm.click

  end

  def click_and_book_ticket(event_name,event_type,button_name,ticket_no)

    $scenario.setContext("event_type",event_type.split(",")[0])

    sleep 3

    if button_name.include?","

      button=button_name.split(",")

      button_name=button[0]

      button_name1=button[1]

    end

    i=0

    Common.little_swipe_down

    loop do

      begin

        if Common.wait_for(20){@device_account_objects.ElementsWithText(event_name)}.displayed?

          if ! $device == "ios"
            Common.verifyNavBar(@device_account_objects.ElementsWithText(event_name))
          end

          @device_account_objects.ElementsWithText(event_name).click

          sleep 2

          break

        end

      rescue

        Common.little_swipe_down

        i=i+1

        if i>4

          return false

        end

      end

    end

    if ticket_no=="NA" or ticket_no.to_i>0

      if ticket_no!="NA"

        for i in 1..(ticket_no.to_i) do

          Common.wait_for(5){@device_home_objects.book_plus}.click

        end

      end

      sleep 2

      @device_common_objects.element_with_text(button_name).click

    if event_type.split(",")[0].include?"Paid"

      begin

        $whatsonscreen.add_payment

        Common.wait_for(5){@device_account_objects.ElementsWithText("Choose payment method")}.click

        @device_account_objects.element_contains_text("5111111111111100".split(//).last(4).join.to_s).click

      rescue

        @device_account_objects.element_contains_text("5111111111111100".split(//).last(4).join.to_s).displayed?
        begin
          @device_guestinvitation_objects.ButtonWithText(button_name1).displayed?
        rescue
          @device_account_objects.icon_left.click
        end
      end

      @device_guestinvitation_objects.ButtonWithText(button_name1).click

    end
      $device=="ios"?$common_screen.wait_for(30){$common_screen.click_element_with_text("Done")}:(Common.wait_for(15){@device_whatson_objects.ok_close_button}.click)

    end

    return true

  end

  def verify_booking_status(status)
    begin
      !($scenario.getContext("event_type").eql?("ticketless"))?(Common.wait_for(5){@device_whatson_objects.booking_status1}.text.include?status):(sleep 1)
      return  true
    rescue
      return  false
    end
  end

  def add_payment

    Common.wait_for(5){@device_account_objects.ElementsWithText("Choose payment method")}.click

    @device_guestinvitation_objects.ButtonWithText("Continue").click

    Common.wait_for(20){@device_whatson_objects.card_number}.click

    @device_whatson_objects.card_number.send_keys("5111111111111100")

    year=@device_whatson_objects.card_expiry("YEAR").text.to_i+2

    @device_whatson_objects.card_expiry("YEAR").click

    Common.wait_for(5){@device_whatson_objects.element_text(year.to_s)}.click

    Common.wait_for(5){@device_whatson_objects.card_cvv}.click

    @device_whatson_objects.card_cvv.send_keys("123")

    Common.hideKeyboard

    @device_guestinvitation_objects.ButtonWithText("Save card details").click

    sleep 20

    $homescreen.go_Back

  end

  def whatson_to_home

    @device_home_objects.homeBtn.click

  end

  def inviteGuest(event_type,ticket_no)

    if ticket_no=="NA" or ticket_no.to_i>0

      for i in 1..(ticket_no.to_i) do
        sleep 1
        Common.wait_for(5){@device_home_objects.book_plus}.click

      end

      @device_guestinvitation_objects.ButtonWithText("Invite guests").click

      if event_type.split(",")[0].include?"Paid"

        $whatsonscreen.add_payment

        Common.wait_for(5){@device_account_objects.ElementsWithText("Choose payment method")}.click

        @device_account_objects.element_contains_text("5111111111111100".split(//).last(4).join.to_s).click

        @device_guestinvitation_objects.ButtonWithText(button_name).click

      end
      sleep 1

      $device=="ios"?$common_screen.click_element_with_text("Done"):(Common.wait_for(5){@device_whatson_objects.ok_close_button}.click)

    end

  end

  def cancel_event
    sleep 2
    Common.wait_for(5){@device_whatson_objects.cancel_event}.click

    $device=="ios"?(@popup_text="Yes"):(@popup_text="YES")
    begin
      Common.wait_for(5){@device_guestinvitation_objects.ButtonWithText(@popup_text)}.click
    rescue
    end

    sleep 2

  end

  def decreaseGuest

    i=0

    loop do

      begin

        Common.wait_for(5){@device_whatson_objects.delete_guest}.click

        begin
          $device == "ios"?(@device_guestinvitation_objects.ButtonWithText("Confirm").click):(@device_guestinvitation_objects.ButtonWithText("CONFIRM").click)
        rescue
        end
        sleep 5

        2.times{Common.swipe_top}

        sleep 2

        break

      rescue

        Common.little_swipe_down

        i=i+1

        if i>3

          break

        end

      end

    end

  end

  def back_from_events

      Common.wait_for(3){@device_whatson_objects.back_from_event}.click

  end


  def select_house(country,house)
    print $android_dimensions_height
    $common_screen=CommonScreen.new
    $common_screen.click_element_with_text(country)
    sleep 1
    $device == "android"?$common_screen.swipeByLocation(50,$android_dimensions_height*0.75,50,20):(sleep 1)
    $device == "ios"?$common_screen.click_element_with_partial_text(house):$common_screen.click_element_with_partial_text(house)
    $common_screen.click_element_with_text("Confirm")
  end

  def select_date(start_date,end_date)
    $common_screen.wait_for($common_screen.fiveSecondsTimeout){@device_whatson_objects.select_dates}.click
    $common_screen=CommonScreen.new
    str=Date.today
    @date = [(str+start_date.to_i).strftime("%b %d %Y").to_s,(str+end_date.to_i).strftime("%b %d %Y").to_s]
    @date.each_index do |j|
      i=0
      loop do
        begin
          @device_whatson_objects.book_date(@date[j]).click
         break
        rescue
          $common_screen.swipeByLocation(50,$dimensions_height*0.75,50,$dimensions_height*0.65)
          sleep 1
        end
        i= i+1
        if i >2
          break
        end
      end
    end
    $common_screen.click_element_with_text("Confirm")
    sleep 2
  end

  def select_guest(guests_no)

    @device_whatson_objects.select_guests.click
    for i in 1..(guests_no.to_i-2)
      @device_whatson_objects.add_guest_adult.click
    end
    $common_screen.click_element_with_text("Confirm")

  end

  def click_browse_bedroom
    @device_whatson_objects.browse_bedroom.click
  end

  def click_select_bedroom
    room_type=@device_whatson_objects.room_type
    room_type_list=[]
    for i in room_type
      room_type_list.append(i.text)
    end
    room_type_name = room_type_list.sample
    $common_screen.find_element{@device_whatson_objects.select_bedroom(room_type_name).displayed?}
    $scenario.setContext('roomType',room_type_name)
    @device_whatson_objects.view_details(room_type_name).click
    $scenario.setContext('dateFrom',@device_whatson_objects.check_in_out("Check-in").text)
    $scenario.setContext('dateTo',@device_whatson_objects.check_in_out("Checkout").text)
    @device_whatson_objects.web_back.click
    sleep 2
    @device_whatson_objects.web_fwd.click
    $common_screen.clickByCoordinated(50,$dimensions_height*0.25)
    @device_whatson_objects.select_bedroom(room_type_name).click
    $scenario.setContext("Room",room_type_name)
  end

  def verify_date_room

    assert_true((@device_whatson_objects.check_in_out("Check-in").text).include?$scenario.getContext("dateFrom"))
    assert_true((@device_whatson_objects.check_in_out("Checkout").text).include?$scenario.getContext("dateTo"))
  end

  def verify_room_type
    assert_true((@device_whatson_objects.check_in_out("Bedroom type").text).include?$scenario.getContext("roomType"))
  end

  def accept_TnC

    $common_screen.swipe_down
    tnc = @device_whatson_objects.term_n_conditions
    for element in tnc
      $common_screen.find_element{element.click}
    end

  end

  def clickonDeposit

    @device_whatson_objects.deposit("Book and pay").click

  end

  def saveDepositAmount

    $scenario.setContext("deposit", @device_whatson_objects.deposit("Select bedroom").text)

  end

  def verifySaveBookingSummary(value)
    sleep 5

    case value

    when 'Booking Details'
      assert_true((@device_whatson_objects.check_in_out("Check-in").text).include?($scenario.getContext("dateFrom")),"Check in date not correct")
      assert_true((@device_whatson_objects.check_in_out("Checkout").text).include?($scenario.getContext("dateTo")),"Check in date not correct")
    when 'Amend Booking'
      assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_text("Find out more")},"Find out more not displayed")
      assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_text("Change booking")},"Change booking not displayed")
    when 'Cancel Booking'
      assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_text("Cancel booking")},"Cancel booking displayed")
    when 'Confirmation Number'
      $scenario.setContext("confirmation_number",@device_whatson_objects.check_in_out("Confirmation Number").text)

  end
  end

  def cancel_room_booking
    sleep 5
    $common_screen.click_button_with_text("Cancel booking")
    assert_true($common_screen.verify_element_displayed_with_text("Booking details"),"Not Cancellation screen")
    $common_screen.click_button_with_text("Cancel booking")
    $common_screen.click_button_with_text("Confirm")
    sleep 1
    assert_true($common_screen.verify_element_displayed_with_text("Booking cancelled"),"Not Booking Cancellation Confirmation screen")
    assert_true((@device_whatson_objects.check_in_out("Confirmation Number").text).include?($scenario.getContext("confirmation_number")),"Confirmation Number not correct")
    $accountscreen.navigate_back_to_account
    sleep 4
  end

  def getAllPaymentCards
    $api=API_Functions.new
    token=$api.generate_access_token($email,$password)
    response=$api.get_request(ENV['API']+"/payments/cards?filter[venue]=GRS&filter[purpose]=TRANSACTIONAL",token)
    return response
  end

  def getCardTypeViaAPI(type)
    cardId=[]
    card_data= JSON.parse(getAllPaymentCards.body)['data']
    case type
    when "master"
      for card in card_data
        if card['attributes']['card_type']=='MASTERCARD'
          cardId.push(card['id'])
        end
      end
    when "amex"
      for card in card_data
        if card['attributes']['card_type']=='AMEX'
          cardId.push(card['id'])
        end
      end
    when "visa"
      for card in card_data
        if card['attributes']['card_type']=='VISA'
          cardId.push(card['id'])
        end
      end
    end
    return  cardId
  end

  def removeAllExistingCardsViaAPI(cards)
    begin
    for card in cards
      token=$api.generate_access_token($email,$password)
      response=$api.delete_request(ENV['API']+"/payments/cards/"+card,token)
      assert_true(response.code.to_s.include?("204"),card+" Card not deleted")
    end
      return true
    rescue
      return false
    end
  end
  def add_payment_details(cardType)
    @config = JSON.parse(File.read('./config/jsonFiles/'+cardType+'_payment_card_details.json'))
    sleep 5
    Common.wait_for(20){@device_whatson_objects.card_number}.click
    @device_whatson_objects.card_number.send_keys(@config["Card Number"])
    $device=="ios"?$common_screen.click_element_with_text("Done"):(sleep 1)
    month_year=["MONTH->"+ @config["Expiry Month"],"YEAR->"+ @config["Expiry Year"]]
    for option in month_year
      @device_whatson_objects.card_expiry(option.split("->")[0]).click
      if $device == "ios"
        @device_whatson_objects.picker.send_keys(option.split("->")[1])
        $common_screen.click_element_with_text("Done")
      else
        Common.wait_for(5){@device_whatson_objects.element_text(option.split("->")[1])}.click
      end
    end
    Common.wait_for(5){@device_whatson_objects.card_cvv}.click
    @device_whatson_objects.card_cvv.send_keys(@config["CVV"])
    $device=="ios"?$common_screen.click_element_with_text("Done"):(sleep 1)
    $common_screen.click_button_with_text("Save card details")
    $common_screen.click_button_with_text("Submit")
    sleep 21

  end

  def verify_full_house_not_displayed
    if $common_screen.verify_element_displayed_with_partial_text("Full house")
      $common_screen.wait_for(15){@device_whatson_objects.full_house_options}.click
      $common_screen.click_element_with_text("Confirm selection")
    end
  end

  def back_to_shop_page

    begin

      sleep 2

      $device=="ios"?$common_screen.click_element(@device_whatson_objects.navigate_back_to_shop):(sleep 1)

    rescue

      Common.swipe_top

    end

  end

  def accept_the_cookies
    puts "::inside accept cookies method::"
    sleep 5
    $device=="ios"?(sleep 10; $common_screen.click_element(@device_whatson_objects.accept_Cookies)):(sleep 1)
  end
end