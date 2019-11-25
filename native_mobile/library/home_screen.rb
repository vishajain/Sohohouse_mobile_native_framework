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

  def verify_blackslate_screen

      Common.wait_for(20) {@device_home_objects.username.click}

  end


  def verify_happening_now

    if Common.wait_for(15) {@device_home_objects.happening_now.displayed?}

      return true

    end

  end


  def verify_house_notes()

    i = 1

    loop do
      if Common.wait_for(3){@device_home_objects.house_notes.size} > 0

      return true

      else
        i = i+1
        Common.swipe_down
      end

      if i > 4
        return false
        break
      end

    end

  end


  def verify_see_all_stories()

      i = 1

      loop do
         if Common.wait_for(3){@device_home_objects.see_all_stories.size} > 0

           @device_home_objects.see_all_stories[0].click
           if Common.wait_for(10){@device_home_objects.house_notes_screen.displayed?}

              sleep 3
               Common.wait_for(10){@device_home_objects.navigate_back}.click
               return true
               break
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

  def verify_noticeboard()

    Common.swipe_down

    if Common.wait_for(5){@device_home_objects.noticeboard.displayed?}

      return true

    end

  end

  def verify_view_another_noticeboard()

    i = 1
    sleep 2
    loop do
      if Common.wait_for(3){@device_home_objects.view_another_noticeboard.size} > 0

        @device_home_objects.view_another_noticeboard[0].click
        if Common.wait_for(10){@device_home_objects.noticeboards_title.displayed?}
          sleep 3
          Common.wait_for(10){@device_home_objects.navigate_back.click}
          return true
          break
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
        Common.wait_for(10){@device_home_objects.navigate_back.click}
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
        Common.wait_for(10){@device_home_objects.browse_houses_navigate_back.click}
        return true
      end

      return true

    end

  end

  def verify_footer_buttons(button)

    if Common.wait_for(5){@device_home_objects.footer_buttons(button).displayed?}

      return true

    end

  end

  def verify_whatson_click

    Common.wait_for(15){@device_home_objects.whats_on[1].click}

  end

  def verify_myplanner_click

    Common.wait_for(15){@device_home_objects.myplanner_btn.click}

  end

  def verify_account_click

    sleep 5

    Common.wait_for(20){@device_home_objects.account_button.click}

  end

  def verify_home_btn()

    if Common.wait_for(5){@device_home_objects.homeBtn.size} > 0

      return true

    end

  end

  def verify_whats_on_btn()

    if Common.wait_for(5){@device_home_objects.whats_on.size} > 0

      return true

    end

  end

  def verify_my_planner_btn()

    if Common.wait_for(5){@device_home_objects.myplanner_btn_1.size} > 0

      return true

    end

  end

  def verify_account_btn()

    if Common.wait_for(5){@device_home_objects.account_btn.size} > 0

      return true

    end

  end

end