require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require "test/unit"
require 'yaml'
require_relative '../../common/functions_common'
require_relative '../../common/common_objects'
require_relative '../pageobjects/home_objects'

class HomeScreen

  def initialize()

    if $device == "ios"

      @device_onboarding_objects = Ios_Onboarding_Objects.new($driver, $driver_appium)
      @device_home_objects = Ios_Home_Objects.new($driver, $driver_appium)
      @device_whatson_objects = Ios_Whatson_Objects.new($driver, $driver_appium)
      @device_account_objects = Ios_Account_Objects.new($driver, $driver_appium)
      @device_guestinvitation_objects = Ios_GuestInvitation_Objects.new($driver, $driver_appium)
      @device_common_objects = Ios_Common_Objects.new($driver, $driver_appium)

    else

      @device_onboarding_objects = Android_Onboarding_Objects.new($driver, $driver_appium)
      @device_home_objects = Android_Home_Objects.new($driver, $driver_appium)
      @device_whatson_objects = Android_Whatson_Objects.new($driver, $driver_appium)
      @device_account_objects = Android_Account_Objects.new($driver, $driver_appium)
      @device_guestinvitation_objects = Android_GuestInvitation_Objects.new($driver, $driver_appium)
      @device_common_objects = Android_Common_Objects.new($driver, $driver_appium)
    end

  end

  def verify_house_name

    return Common.wait_for(20) {@device_home_objects.house_name.displayed?}

  end

  def verify_contact_a_house

    if Common.wait_for(20) {@device_home_objects.contact_a_house}.displayed?

      Common.wait_for(10){@device_home_objects.contact_a_house}.click

      sleep 20

      Common.navigateBack

      return true

    end

  end

  def home_screen_navigate
    i=0
    loop do
      begin
        $driver.action.move_to(@device_home_objects.close_blackslate).click.perform
        return true
      rescue
        Common.swipe_top
        i=i+1
        if i>2
          break
        end
      end
    end


    return true

    sleep 10

  end

  def verify_greetings()
    sleep 3
    i=0
    loop do
      begin
        if $device == "ios"
          assert_true($common_screen.verify_element_displayed_with_text("Share profile",80),"Home page not displayed")
          return true
        else
          str = Common.wait_for(50){@device_home_objects.greetings}.text
            if str == "Good morning" || str == "Good evening" || str == "Good afternoon"
              return true
            else
              return false
            end
        end
      rescue
        print "Try Again"
      end
      if i>2
        i=i+1
        break
      end
    end
  end

  def verify_username()

    return Common.wait_for(40) {@device_home_objects.username.displayed?}

  end

  def verify_homescreen()

    begin
      return Common.wait_for(15) {@device_home_objects.chasing_username.displayed?}
    rescue
      return false
    end
  end

  def verify_blackslate_screen

      Common.wait_for(20) {@device_home_objects.username}.click

  end

  def verify_happening_now

    return Common.wait_for(2) {@device_home_objects.happening_now.displayed?}

  end

  def verify_pastdigital_events

    i = 1

    loop do

      begin

        if Common.wait_for(2) {@device_home_objects.past_digital_events.displayed?}
          Common.little_swipe_down
          return true
        end
      rescue
        sleep 1
        Common.little_swipe_down

        i = i + 1

        if i > 2

          return false

        end

      end

    end

  end

  def verify_footer_buttons(button)

    return Common.wait_for(5){@device_home_objects.footer_buttons(button).displayed?}

  end

  def verify_whatson_click

    $common_screen=CommonScreen.new

    $common_screen.navigate_to_tabs("Book")
  end

  def verify_connect_click

    $common_screen=CommonScreen.new

    $common_screen.navigate_to_tabs("Connect")

  end

  def verify_account_click
    $common_screen=CommonScreen.new
    $common_screen.navigate_to_tabs("Account")

  end

  def go_back_to_home_screen

    begin
      sleep 2
      Common.wait_for(5){@device_home_objects.left_link}.click
    rescue
      Common.wait_for(5){@device_home_objects.navigate_back}.click
    end

  end

  def tap_carousel(event_name)

    begin

      $device=="ios"?$common_screen.find_element{@device_home_objects.event_name_field[0].click}:$common_screen.find_element{@device_home_objects.event_name_field[0].displayed?}

    rescue
          Common.little_swipe_down
        end

        i = 0

        loop do

          begin

            if Common.wait_for(10) {@device_home_objects.event_name(event_name)}.displayed?

              if !($device == "ios")
                Common.verifyNavBar(@device_account_objects.element_contains_text(event_name))
              end
              $common_screen.little_swipe_down
              @device_home_objects.event_name(event_name).click

            else

              raise "Not displayed"

            end

            return true

          rescue

            Common.home_panel_swipe(@device_home_objects.event_image[0],"left")

            Common.swipe_top

            i = i + 1

            if i > 5

              return false

            end

          end

    end

  end

  def verify_user_navigation(event_name)
    sleep 2
      return Common.wait_for(20) {@device_account_objects.element_contains_text(event_name)}.displayed?

  end

  def user_navigate_to_home_screen

    begin

      Common.wait_for(10){@device_whatson_objects.icon_close.click}

    rescue

    end


    begin

      Common.navigateBack

    rescue

    end

    begin

      Common.navigateBack

    rescue

    end

  end

  def verify_perks_homescreen

    Common.swipe_down

    Common.wait_for(5) {@device_home_objects.house_perks.displayed?}

  end

  def verify_elementDisplayed(elementText)
      i = 0

      loop do

        begin

          if Common.wait_for(2) { @device_account_objects.ElementsWithText(elementText) }.displayed?
            return true
          else
            raise StandardError.new "Element not visible"
          end

        rescue StandardError => msg

          Common.little_swipe_down

          i = i + 1

          if i > 5

            return false

          end

        end
      end

  end

    def verifyIcons(section, heading)
      i = 0

      loop do

        begin

          if Common.wait_for(10) { @device_account_objects.ElementsWithText(section) }.displayed?

            @device_account_objects.ElementsWithText(section).click

            sleep 1

            $common_screen.swipe_top

            if Common.wait_for(20) { @device_account_objects.ElementsWithText(heading) }.displayed?

              begin
                if $device == "ios"
                  if !@device_common_objects.tab_icon.displayed?
                    Common.swipe_top
                  end
                  if !@device_onboarding_objects.home_title.displayed?
                    @device_common_objects.tab_icon.click

                    (!(@device_common_objects.home_menu.displayed?))?($action.move_to(@device_common_objects.side_left_arrow).click.perform):(print "visible")

                    @device_common_objects.home_menu.click
                  end
                else
                  if !@device_home_objects.homeBtn.displayed?

                    Common.swipe_top

                  end

                  Common.wait_for(3){@device_home_objects.homeBtn}.click

                end

              rescue StandardError => e

                if $device=="ios"
                  if @device_common_objects.tab_icon.displayed?
                    @device_common_objects.tab_icon.click
                    sleep 1
                    @device_common_objects.home_menu.click
                  end
                else
                  @device_home_objects.icon_left.click
                end

              end

            end
          else
            raise StandardError.new "Element not visible"
          end

         return true

      rescue StandardError => e

        Common.home_panel_swipe(@device_home_objects.circle_icon[0],"left")

        sleep 1

        i = i + 1

        if i > 2

          return false

        end

        end

      end

    end

  def create_aroom_carosal_move_right
    Common.home_panel_swipe(@device_home_objects.circle_icon[0],"right")
  end

  def scrollTillUsername

    i=0

    loop do

      begin

        $device=="ios"?(@device_onboarding_objects.home_title):(Common.wait_for(2){@device_account_objects.ElementsWithText("What can we help you with?")}.click)

        $common_screen.swipe_top

        return true

      rescue

        Common.swipe_top

        i=i+1

        if i>7
          return false
        end

      end

    end

  end
  def clickElement(element)
    i=0

    loop do

      begin

        Common.wait_for(2){@device_account_objects.ElementsWithText(element)}.click

        return true

      rescue

        Common.little_swipe_down

        i=i+1

        if i>6
          return false
        end

      end

    end
  end

  def select_setUpYourApp(value)
    i=0
    loop do
      begin
        Common.wait_for(3){@device_account_objects.ElementsWithText(value)}.click
        return true
      rescue
        Common.little_swipe_down
        i=i+1
        if i>3
          return false
        end
      end
    end



  end

  def go_Back
    Common.goBack
  end

  def verifyTabNavigations(index,text)

    $common_screen=CommonScreen.new

    $common_screen.navigate_to_tabs(index)

      if Common.wait_for(50){@device_account_objects.ElementsWithText(text)}.displayed?

        return true

      end

    return false

  end

  def bookForEvent
    event=nil
    begin
    if Common.wait_for(5){@device_guestinvitation_objects.ButtonWithText("Join lottery")}.displayed?
      @device_home_objects.book_plus.click
      if @device_account_objects.ElementsWithText("1").displayed?
        @device_guestinvitation_objects.ButtonWithText("Join lottery").click
        sleep 2
        @device_account_objects.ok_close_button.click
       text="You have joined the lottery"
        assert_true(@device_home_objects.booking_status.text.include?text)
        $scenario.setContext("eventbooking","RE IN THE LOTTERY")
      end
      return true
    end
    rescue
      $device=="ios"?text="Book":text="Add to bookings"
      if Common.wait_for(5){@device_guestinvitation_objects.ButtonWithText(text)}.displayed?
        @device_guestinvitation_objects.ButtonWithText(text).click
        assert_true(Common.wait_for(5){@device_home_objects.status}.displayed?)
        @device_account_objects.ok_close_button.click
        return true
      end
    end
    return false
  end

  def cancel_booking
    Common.wait_for(10){@device_home_objects.cancel_event_booking}.click
    $device=="ios"?(sleep 4):(Common.wait_for(10){@device_guestinvitation_objects.ButtonWithText("YES")}.click)
    begin
      sleep 2
      if @device_home_objects.cancel_event_booking.displayed?
        return  false
      end
    rescue
      return true
    end
  end

  def event_swipe(direction)
    Common.home_panel_swipe(@device_home_objects.event_name_field[0],direction)
  end

  def clickOnConnect

    $common_screen.navigate_to_tabs("Connect")

  end

  def go_back_to_home
    if $device == "ios"
      $common_screen.navigate_to_tabs("Home")
    else
      $homescreen.go_back_to_home_screen
    end
  end

  def navigate_back_to_home

    begin

      sleep 1

      $device=="ios"?($common_screen.click_element(@device_home_objects.back_to_home)):(sleep 1)

    rescue

      Common.swipe_top

    end

  end

end