require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require "test/unit"
require 'yaml'
require_relative '../../common/functions_common'
require_relative '../pageobjects/home_objects'

class HomeScreen

  def initialize()
    #
    if $device == "ios"

      @device_onboarding_objects = Ios_Onboarding_Objects.new($driver, $driver_appium)
      @device_home_objects = Ios_Home_Objects.new($driver, $driver_appium)
      @device_whatson_objects = Ios_Whatson_Objects.new($driver, $driver_appium)
      @device_account_objects = Ios_Account_Objects.new($driver, $driver_appium)

    else

      @device_onboarding_objects = Android_Onboarding_Objects.new($driver, $driver_appium)
      @device_home_objects = Android_Home_Objects.new($driver, $driver_appium)
      @device_whatson_objects = Android_Whatson_Objects.new($driver, $driver_appium)
      @device_account_objects = Android_Account_Objects.new($driver, $driver_appium)


    end

  end

  def verify_house_name

    return Common.wait_for(20) {@device_home_objects.house_name.displayed?}

  end

  def verify_house_name_click

    Common.wait_for(5) {@device_home_objects.house_name}.click

    if Common.wait_for(20) {@device_home_objects.house_name_webview}.displayed?

      Common.wait_for(15) {@device_home_objects.browse_houses_back_button}.click

      return true

    else

      return false

    end

  end

  def verify_membership_card

    sleep 3

    if Common.wait_for(5) {@device_home_objects.membership_card}.displayed?

      @device_home_objects.membership_card.click

      if Common.wait_for(20) {@device_account_objects.your_membership.displayed?}

        Common.wait_for(20){@device_account_objects.icon_left}.click

        return true

       end

     end

  end

  def verify_book_a_bedroom

    sleep 5

    if Common.wait_for(5) {@device_home_objects.book_a_bedroom}.displayed?

     @device_home_objects.book_a_bedroom.click

      sleep 5

      Common.wait_for(5) {@device_home_objects.icon_left}.click

      return true

    end

  end

  def verify_contact_a_house

    if Common.wait_for(20) {@device_home_objects.contact_a_house}.displayed?

      Common.wait_for(10){@device_home_objects.contact_a_house}.click

      sleep 20

      Common.wait_for(20) {@device_home_objects.icon_left}.click

      return true

    end

  end

  def verify_house_rules

    sleep 5

    if Common.wait_for(5) {@device_home_objects.house_rules}.displayed?

      @device_home_objects.house_rules.click

      if Common.wait_for(10) {@device_home_objects.house_rules_webview}.displayed?

      @device_home_objects.icon_left.click

        return true

      end

    end

  end

  def home_screen_navigate

    $driver.action.move_to(@device_home_objects.close_blackslate).click.perform

    return true

    sleep 10

  end

  def verify_upcoming_bookings

    return Common.wait_for(20) {@device_home_objects.upcoming_bookings}.displayed?

  end

  def verify_upcoming_bookings_events

    if Common.wait_for(20) {@device_home_objects.event}.size >= 4
      return true
    else
      return false
    end

  end

  def verify_event_status

    if Common.wait_for(20) {@device_home_objects.event_status_one_event}.text.include? "YOU'RE ON THE GUEST LIST"
      return true
    elsif Common.wait_for(20) {@device_home_objects.event_status_multi_event}.text.include? "YOU'RE ON THE GUEST LIST"
      return true
    end

  end

  def verify_multi_events_present

    if Common.wait_for(20) {@device_home_objects.event}.size > 4
      return true
    else
      return false
    end

  end

  def verify_scroll_left

    locat = Common.wait_for(20) {@device_home_objects.upcoming_bookings}.location

    x =  locat["x"]
    y =  locat["y"]

    startY = y+55
    endY = y+55

    before_swipe_string = Common.wait_for(20) {@device_home_objects.event_title_first_event}.text
    before_swipe_date = Common.wait_for(20) {@device_home_objects.event_date_first_event}.text

    Common.swipe_left(startY,endY)

    sleep 4

    after_swipe_string = Common.wait_for(20) {@device_home_objects.event_title_first_event}.text
    after_swipe_date = Common.wait_for(20) {@device_home_objects.event_date_first_event}.text

    if  before_swipe_string == after_swipe_string && before_swipe_date == after_swipe_date
      return false
    else
      return true
    end

  end

  def verify_max_seven_events

    locat = Common.wait_for(20) {@device_home_objects.upcoming_bookings}.location

    x =  locat["x"]
    y =  locat["y"]

    startY = y+55
    endY = y+55
    @events_count = 1

    before_swipe_string = Common.wait_for(20) {@device_home_objects.event_title_first_event}.text
    before_swipe_date = Common.wait_for(20) {@device_home_objects.event_date_first_event}.text

    loop do

      Common.swipe_left(startY,endY)

      sleep 3

      after_swipe_string = Common.wait_for(20) {@device_home_objects.event_title_first_event}.text
      after_swipe_date = Common.wait_for(20) {@device_home_objects.event_date_first_event}.text

      if  before_swipe_string.equal? after_swipe_string

        if before_swipe_date.equal? after_swipe_date

          break

        end

      else

        @events_count = @events_count + 1

        before_swipe_string = Common.wait_for(20) {@device_home_objects.event_title_first_event}.text
        before_swipe_date = Common.wait_for(20) {@device_home_objects.event_date_first_event}.text

        sleep 3

      end

    end

    if @events_count > 7

      return false

    else

      return true

    end

  end

  def tap_first_event

    Common.wait_for(20) {@device_home_objects.event_title_first_event}.click

  end

  def verify_event_details_screen_navigation

    return Common.wait_for(20) {@device_home_objects.section_displayed("Tickets")}.displayed?

  end

  def tap_navigate_back

    Common.wait_for(20) {@device_home_objects.icon_left}.click

  end

  def verify_see_all_button

    return Common.wait_for(20) {@device_home_objects.section_displayed("See all")}.displayed?

  end

  def tap_see_all_btn

    Common.wait_for(20) {@device_home_objects.section_displayed("See all")}.click

  end

  def verify_my_bookings

    return Common.wait_for(20) {@device_home_objects.section_displayed("My bookings")}.displayed?

  end

  def verify_planner_booking_event(event)

    locat = Common.wait_for(20) {@device_home_objects.upcoming_bookings}.location

    y =  locat["y"]

    startY = y+55
    endY = y+55

    Common.swipe_right(startY,endY)

    if event.include? "My planner member"

      planner_event_name = $planner_member_event

    elsif event.include? "My planner gym"

      planner_event_name = $planner_gym_event

    end

    i = 0

    while i < 8

      begin

        Common.wait_for(20) {@device_home_objects.section_displayed(planner_event_name).displayed?}

        return true

      rescue

        Common.swipe_left(startY,endY)

      end

      i = i+1

    end

  end

  def verify_greetings()

    str = Common.wait_for(2){@device_home_objects.greetings}.text

    if str == "Good morning," || str == "Good evening," || str == "Good afternoon,"
      return true
    else
      return false
    end

  end

  def verify_username()

    return Common.wait_for(5) {@device_home_objects.username.displayed?}

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

        return Common.wait_for(2) {@device_home_objects.past_digital_events.displayed?}

      rescue

        Common.swipe_down

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

        if i > 5

          return false

        end

      end

    end

  end

  def verify_post_button()

    i = 1

    loop do

      begin

        return Common.wait_for(3){@device_home_objects.post_link.displayed?}

      rescue

        Common.swipe_down

        i = i + 1

        if i > 5

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

  def verify_noticeboard()

    Common.swipe_down

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

    Common.wait_for(15){@device_home_objects.whats_on_1}.click

  end

  def ios_back
    Common.wait_for(15){@device_home_objects.left_link}.click
  end


  def verify_myplanner_click

    Common.wait_for(15){@device_home_objects.myplanner_btn}.click

  end

  def verify_account_click

    Common.wait_for(5){@device_home_objects.account_button}.click

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

    Common.wait_for(3){@device_home_objects.post_link}.click


  end

  def verify_noticeboard_title

    return Common.wait_for(3){@device_home_objects.noticeboard_title.displayed?}

  end

  def input_text

    sleep 3

    $driver.action.move_to(@device_home_objects.noticeboard_text_input).click.perform

    @device_home_objects.noticeboard_text_input.send_keys("How are you all")

    Common.wait_for(5){@device_home_objects.noticeboard_title}.click


  end

  def amend_text

    sleep 3

    $driver.action.move_to(@device_home_objects.noticeboard_text_input).click.perform

    @device_home_objects.noticeboard_text_input.send_keys(" doing")

    Common.wait_for(5){@device_home_objects.noticeboard_title}.click

  end

  def verify_post_created

    sleep 5

    Common.swipe_down

    str = Common.wait_for(10){@device_home_objects.view_post}.text

    return str.include? "How are you all"

  end

  def verify_post_amended

    sleep 2

    Common.swipe_down

    str = Common.wait_for(5){@device_home_objects.view_post}.text

    return str.include? "How are you all doing"

  end

  def tap_delete_post

    Common.wait_for(2) {@device_home_objects.delete_post.displayed?}

    Common.wait_for(10){@device_home_objects.delete_post}.click

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

    Common.little_swipe_down

    Common.wait_for(5){@device_home_objects.browsehouses_title}.click

    Common.wait_for(5){@device_home_objects.soho_house_berlin.displayed?}

    Common.wait_for(5){@device_home_objects.soho_house_berlin}.click

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

    sleep 1

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

    Common.wait_for(5){@device_home_objects.left_link}.click

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

    locat = Common.wait_for(20) {@device_home_objects.happening_now}.location

    y =  locat["y"]

    startY = y+55
    endY = y+55

    Common.swipe_right(startY,endY)

    i = 1

    while i < 8

      begin

        if Common.wait_for(20) {@device_home_objects.event_name(event_name).displayed?}

          @device_home_objects.event_name(event_name).click

          return true

        end

      rescue

        Common.swipe_left(startY,endY)

        i = i+ 1

      end

    end

  end

  def verify_user_navigation(event_name)

      return Common.wait_for(20) {@device_home_objects.event_name(event_name).displayed?}

  end

  def verify_book_event


    begin

      Common.wait_for(2) {@device_whatson_objects.you_are_on_the_guest_list.displayed?}

      return true

    rescue


    end

    begin

      Common.wait_for(2) {@device_whatson_objects.buy_tickets.displayed?}

      paid_event = true

    rescue

      paid_event = false

    end

    begin

      Common.wait_for(2) {@device_whatson_objects.buy_tickets.enabled?}

      guests_allowed = false

    rescue

      guests_allowed = true

    end

    begin

      Common.wait_for(2) {@device_whatson_objects.book.displayed?}

      free_event = true

    rescue

      free_event = false

    end

    begin

      Common.wait_for(2) {@device_whatson_objects.book_and_pay.displayed?}

      gym_paid_event = true

    rescue

      gym_paid_event = false

    end

    if paid_event == true && guests_allowed == true

      $whatsonscreen.book_member_event

      $whatsonscreen.verify_member_section("Confirm payment")

      $whatsonscreen.buy_tickets_click

      $whatsonscreen.verify_you_on_guest_list

      $whatsonscreen.ok_btn_click

    elsif paid_event == true && guests_allowed == false

      $whatsonscreen.book_no_guests_member_event

      $whatsonscreen.verify_member_section("Confirm payment")

      $whatsonscreen.buy_tickets_click

      $whatsonscreen.verify_you_on_guest_list

      $whatsonscreen.ok_btn_click

    elsif paid_event == false && free_event == true

      $whatsonscreen.book_no_guests_free_member_event

      $whatsonscreen.verify_you_on_guest_list

      $whatsonscreen.ok_btn_click

    elsif gym_paid_event == true

      $whatsonscreen.book_gym_event

      $whatsonscreen.verify_member_section("Confirm payment")

      $whatsonscreen.buy_tickets_click

      $whatsonscreen.verify_you_on_guest_list

      $whatsonscreen.ok_btn_click

    end

    if $whatsonscreen.verify_guest_list_status_on_event_screen

      return true

    end

  end

  def user_navigate_to_home_screen

    begin

      Common.wait_for(10){@device_whatson_objects.icon_close.click}

    rescue

    end


    begin

      Common.wait_for(10){@device_whatson_objects.icon_left.click}

    rescue

    end

    begin

      Common.wait_for(10){@device_whatson_objects.icon_left.click}

    rescue

    end

  end

  def verify_perks_homescreen

    Common.swipe_down

    Common.wait_for(5) {@device_home_objects.house_perks.displayed?}

  end


end