require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require "test/unit"
require 'yaml'
require_relative '../../common/functions_common'
require_relative '../pageobjects/home_objects'

class HomeScreen

  def initialize()

    if $device == "ios"

      @device_onboarding_objects = Ios_Onboarding_Objects.new($driver, $driver_appium)
      @device_home_objects = Ios_Home_Objects.new($driver, $driver_appium)
      @device_whatson_objects = Ios_Whatson_Objects.new($driver, $driver_appium)
      @device_account_objects = Ios_Account_Objects.new($driver, $driver_appium)
      @device_guestinvitation_objects = Ios_GuestInvitation_Objects.new($driver, $driver_appium)

    else

      @device_onboarding_objects = Android_Onboarding_Objects.new($driver, $driver_appium)
      @device_home_objects = Android_Home_Objects.new($driver, $driver_appium)
      @device_whatson_objects = Android_Whatson_Objects.new($driver, $driver_appium)
      @device_account_objects = Android_Account_Objects.new($driver, $driver_appium)
      @device_guestinvitation_objects = Android_GuestInvitation_Objects.new($driver, $driver_appium)

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
    sleep 10
    str = Common.wait_for(50){@device_home_objects.greetings}.text
    if $device == "ios"
      if str == "Good morning," || str == "Good evening," || str == "Good afternoon,"
       return true
      else
        return false
      end
    else
      if str == "Good morning" || str == "Good evening" || str == "Good afternoon"
        return true
      else
        return false
      end
    end

  end

  def verify_username()

    return Common.wait_for(40) {@device_home_objects.username.displayed?}

  end

  def verify_homescreen()

    Common.wait_for(15) {@device_home_objects.chasing_username.displayed?}

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

  def verify_house_notes()

    i = 1

    loop do

      begin

        return Common.wait_for(1){@device_home_objects.house_notes_screen.displayed?}

      rescue

        Common.swipe_down

        i = i + 1

        if i > 6

          return false

        end

      end

    end

  end

  def verify_post_button()

    i = 0

    loop do

      begin

        Common.wait_for(2){@device_home_objects.post_link.displayed?}

        $device == "ios"? (sleep 2): (Common.verifyNavBar(@device_home_objects.post_link))

        return true

      rescue StandardError => msg
        Common.little_swipe_down

        i = i + 1

        if i > 10

          return false

        end

      end

    end

  end


  def verify_our_houses()

    Common.swipe_down

    Common.wait_for(5){@device_home_objects.our_houses.displayed?}

  end

  def verify_see_all_stories()

      i = 1

      loop do

        begin

          if Common.wait_for(3){@device_home_objects.see_all_stories.displayed?}

            Common.wait_for(3){@device_home_objects.see_all_stories}.click

            sleep 3

            if Common.wait_for(10){@device_home_objects.house_notes_screen.displayed?}

              Common.wait_for(10){@device_home_objects.navigate_back}.click

              return true

            end

          end

        rescue

          Common.swipe_down

          i = i + 1

          if i > 5

            return false

          end

        end

      end

  end

  def verify_noticeboard

    Common.wait_for(3){@device_home_objects.noticeboard.displayed?}

  end

  def verify_view_another_noticeboard

    i = 1
    sleep 2
    loop do
      if Common.wait_for(2){@device_home_objects.view_another_noticeboard}.size > 0

        @device_home_objects.view_another_noticeboard[0].click

        if Common.wait_for(3){@device_home_objects.noticeboards_title.displayed?}
          sleep 3
          Common.wait_for(3){@device_home_objects.navigate_back}.click
          return true
        else
          return false
        end
      else
        i = i+1
        Common.swipe_down
      end

      if i > 7
        return false
        break
      end

    end
  end

  def verify_house_perks()
    sleep 1
    Common.swipe_down
    if Common.wait_for(5){@device_home_objects.house_perks.displayed?}
      @device_home_objects.house_perks.click
      if Common.wait_for(10){@device_home_objects.houseperks_title.displayed?}
        sleep 2
        Common.wait_for(10){@device_home_objects.navigate_back}.click
        return true
      end
    end

  end



  def verify_browse_houses()
    sleep 1
    Common.swipe_down
    if Common.wait_for(5){@device_home_objects.browse_houses.displayed?}
      @device_home_objects.browse_houses.click
      if Common.wait_for(10){@device_home_objects.browsehouses_title.displayed?}
        sleep 2
        Common.wait_for(10){@device_home_objects.browse_houses_navigate_back}.click
        return true
      end

      return true

    end

  end

  def verify_footer_buttons(button)

    return Common.wait_for(5){@device_home_objects.footer_buttons(button).displayed?}

  end

  def verify_whatson_click

    $common_screen=CommonScreen.new

    $common_screen.navigate_to_tabs("Book")

  end


  def verify_account_click

    $common_screen=CommonScreen.new
    $common_screen.navigate_to_tabs("Account")


  end

  def verify_home_btn()

    if Common.wait_for(5){@device_home_objects.homeBtn}.size > 0

      return true

    end

  end

  def verify_whats_on_btn()

    if Common.wait_for(5){@device_home_objects.whats_on}.size > 0

      return true

    end

  end

  def verify_my_planner_btn()

    if Common.wait_for(5){@device_home_objects.myplanner_btn_1}.size > 0

      return true

    end

  end

  def verify_account_btn()

    if Common.wait_for(5){@device_home_objects.account_btn}.size > 0

      return true

    end

  end

  def verify_house_open

    return Common.wait_for(5){@device_home_objects.we_are_closed.displayed?}

  end


  def post_click

    sleep 2
    begin
         Common.wait_for(3){@device_home_objects.post_link}.click
    rescue
      Common.wait_for(3){@device_home_objects.post_button}.click
      begin
        Common.wait_for(3){@device_account_objects.ok_close_button}.click
      rescue
      end
    end

  end

  def verify_noticeboard_title

    return Common.wait_for(3){@device_home_objects.noticeboard_title.displayed?}

  end

  def input_text

    sleep 3

    @device_home_objects.noticeboard_text_input.send_keys("How are you all")
    $device == "ios"?(Common.swipe_top):( sleep 2)

  end

  def amend_text

    sleep 3

    if $device == "ios"
      $driver.action.move_to(@device_home_objects.noticeboard_text_input).click.perform
      @device_home_objects.noticeboard_text_input.send_keys(" doing")
    else

      @device_home_objects.noticeboard_text_input.click
      str=@device_home_objects.noticeboard_text_input.text
      @device_home_objects.noticeboard_text_input.send_keys(str+" doing")
      Common.hideKeyboard
    end

    Common.wait_for(5){@device_home_objects.noticeboard_title}.click

  end

  def verify_post_created

    sleep 5

    begin

      if Common.wait_for(3){@device_home_objects.view_post}.displayed?

        $device == "android"?(Common.verifyNavBar(@device_home_objects.view_post)):(sleep 1)

      end

    rescue

      Common.little_swipe_down

    end

    str = @device_home_objects.view_post.text

    return str.include? "How are you all"

  end

  def verify_post_amended

    sleep 2

    begin
    str = Common.wait_for(5){@device_home_objects.view_post}[1].text
    rescue
      str = Common.wait_for(5){@device_home_objects.view_post}.text
    end

    return str.include? "How are you all doing"

  end

  def tap_delete_post

    Common.wait_for(2) {@device_home_objects.delete_post.displayed?}

    Common.wait_for(10){@device_home_objects.delete_post}.click
    if $device == "android"

      Common.wait_for(2){@device_account_objects.ok_close_button}.click

    end

  end

  def verify_post_deleted

    sleep 3

    if Common.wait_for(5){@device_home_objects.delete_post_check}.size > 2
      return false
    else
      return true
    end

  end

  def tap_view_another_noticeboard

    Common.wait_for(3){@device_home_objects.view_another_noticeboard_1}.click

  end

  def tap_soho_house_berlin

    if $device == "ios"

      $common_screen.click_element_with_text("Refine")

      $accountscreen.select_berlin

      $common_screen.click_element_with_text("Apply filters")

    else

      Common.little_swipe_down

    Common.wait_for(5){@device_home_objects.browsehouses_title}.click

    Common.wait_for(5){@device_home_objects.soho_house_berlin.displayed?}

    Common.wait_for(5){@device_home_objects.soho_house_berlin}.click

    end

  end

  def verify_soho_berlin_noticeboard

    return Common.wait_for(5){@device_home_objects.soho_berlin_noticeboard_title.displayed?}

  end

  def verify_create_post_another_noticeboard

    sleep 3

    str = Common.wait_for(5){@device_home_objects.view_another_board_post}.text

    return str.include? "How are you all"

  end

  def verify_post_amended_another_noticeboard

    sleep 3

    str = Common.wait_for(5){@device_home_objects.view_another_board_post}.text

    return str.include? "How are you all doing"


  end

  def verify_post_deleted_another_noticeboard

    sleep 3

    if Common.wait_for(5){@device_home_objects.delete_another_board_post_check}.size > 1
      return false
    else
      return true
    end

  end

  def go_back_to_home_screen

    begin
      sleep 2
      Common.wait_for(5){@device_home_objects.left_link}.click
    rescue
      Common.wait_for(5){@device_home_objects.navigate_back}.click
    end

  end

  def verify_posts_count

    str = Common.wait_for(5){@device_home_objects.posts_today}.text

    str_split_comma = str.split(",")

    str_split_space = str_split_comma[1].split(" ")

    str_split_zeroth_index_to_num = Integer(str_split_space[0])

    if str_split_zeroth_index_to_num > 0

      return true

    else

      return false

    end

  end

  def tap_modal_close

    Common.wait_for(5){@device_home_objects.modal_close}.click

  end

  def tap_carousel(event_name)

    begin

        Common.wait_for(3){@device_home_objects.event_name_field[0]}.displayed?
        if $device=="android"
          Common.verifyNavBar(@device_home_objects.event_name_field[0])
        end


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

      $common_screen= CommonScreen.new
      i = 0

      loop do

        begin

          if Common.wait_for(10) { @device_account_objects.ElementsWithText(section) }.displayed?

            @device_account_objects.ElementsWithText(section).click

            if Common.wait_for(20) { @device_account_objects.ElementsWithText(heading) }.displayed?

              begin

                if $device =="ios"
                  if !$common_screen.verify_tab_icon

                    Common.swipe_top

                  end

                end

                 $common_screen.navigate_to_tabs("Home")

              rescue StandardError => e

                $device=="ios"?Common.swipe_top: @device_home_objects.icon_left.click

                $common_screen.navigate_to_tabs("Home")

              end

            end

          end

         return true

      rescue
        Common.home_panel_swipe(@device_home_objects.circle_icon[0],"left")

        if $device== "ios"

          Common.swipe_top

        end

        i = i + 1

        if i > 2

          return false

        end

        end

      end

    end

  def scrollTillUsername

    i=0

    loop do

      begin

        Common.wait_for(2){@device_account_objects.ElementsWithText("What can we help you with?")}.displayed?

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
        $device == "ios"?text="YOU HAVE JOINED THE LOTTERY":text="You have joined the lottery"
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

    Common.wait_for(5){@device_home_objects.connect}.click

  end

  def go_back_to_home
    if $device == "ios"
      @device_home_objects.homeBtn.click
    else
      $homescreen.go_back_to_home_screen
    end
  end

end