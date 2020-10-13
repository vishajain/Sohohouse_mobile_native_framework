
require 'rubygems'
require 'appium_lib'
# require 'watir'
require 'selenium-webdriver'
require "test/unit"
require 'yaml'
require_relative '../pageobjects/onboarding_objects'
require_relative '../pageobjects/home_objects'
require_relative '../pageobjects/account_objects'
require_relative '../../common/functions_common'

class AccountScreen

  def initialize()

    if $device == "ios"
      @device_onboarding_objects = Ios_Onboarding_Objects.new($driver, $driver_appium)
      @device_home_objects = Ios_Home_Objects.new($driver, $driver_appium)
      @device_account_objects = Ios_Account_Objects.new($driver, $driver_appium)

    else
      @device_onboarding_objects = Android_Onboarding_Objects.new($driver, $driver_appium)
      @device_home_objects = Android_Home_Objects.new($driver, $driver_appium)
      @device_account_objects = Android_Account_Objects.new($driver, $driver_appium)

    end

  end


  def verify_account_title


    if Common.wait_for(20) {@device_account_objects.account_title}.displayed?

      @device_account_objects.account_title.click

      if Common.wait_for(20) {@device_account_objects.edit_profile_screen}.displayed?

        if $device == "ios"

          Common.wait_for(20){@device_account_objects.icon_left}.click

          return true

        else

          Common.wait_for(20){@device_account_objects.navigate_up}.click

          return true

        end

      end

    end

  end

  def tap_View_Profile

    sleep 3

    Common.swipe_top

    sleep 2

    $driver.action.move_to(@device_account_objects.account_title).click.perform

    # Common.wait_for(15){@device_account_objects.account_title}.click

  end


  def tap_edit_link

    Common.wait_for(10) {@device_account_objects.edit_profile_screen}.click

  end


  def verify_your_membership


    if Common.wait_for(20) {@device_account_objects.membership.displayed?}

      @device_account_objects.membership.click

      if Common.wait_for(20) {@device_account_objects.your_membership.displayed?}

        Common.wait_for(20){@device_account_objects.icon_left}.click

        return true

      end

    end

  end

  def verify_bookings

    if Common.wait_for(10) {@device_account_objects.your_bookings.displayed?}

      @device_account_objects.your_bookings.click

      if Common.wait_for(10) {@device_account_objects.booking_history.displayed?}

        Common.wait_for(10){@device_account_objects.icon_left}.click

        return true
      end

    end

  end

  def verify_perks


    if Common.wait_for(20) {@device_account_objects.perks.displayed?}

      @device_account_objects.perks.click

      if Common.wait_for(20) {@device_account_objects.houseperks_title.displayed?}

        Common.wait_for(20){@device_account_objects.icon_left}.click

        return true

      end

    end

  end


  def verify_payment

    if Common.wait_for(20) {@device_account_objects.payment.displayed?}

      @device_account_objects.payment.click

      if Common.wait_for(20) {@device_account_objects.payment.displayed?}

        Common.wait_for(20){@device_account_objects.icon_left}.click

        return true

      end

    end

  end


  def verify_past_bookings

    if Common.wait_for(20) {@device_account_objects.past_bookings.displayed?}

      @device_account_objects.past_bookings.click

      if Common.wait_for(20) {@device_account_objects.past_bookings.displayed?}

        sleep 2

        Common.wait_for(20){@device_account_objects.icon_left}.click

        return true

      end

    end

  end


  def verify_change_password

    sleep 2

    Common.swipe_down

    if Common.wait_for(20) {@device_account_objects.change_password.displayed?}

      @device_account_objects.change_password.click

      if Common.wait_for(20) {@device_account_objects.change_password.displayed?}

        Common.wait_for(20){@device_account_objects.icon_left}.click

        return true

      end

    end

  end

  def verify_favourite_houses

    sleep 2

    if Common.wait_for(20) {@device_account_objects.favourite_houses.displayed?}

      @device_account_objects.favourite_houses.click

      if Common.wait_for(20) {@device_account_objects.favourite_houses.displayed?}

        if $device == "ios"

          Common.wait_for(20){@device_account_objects.icon_left}.click

          return true

        else

          Common.wait_for(20){@device_account_objects.navigate_up}.click

          return true

        end

      end

    end

  end

  def favourite_houses_shown

    i = 1

    loop do

      begin

        return Common.wait_for(5) {@device_account_objects.favourite_houses.displayed?}

      rescue

        Common.swipe_down

        i = i + 1

        if i > 2

          return false

        end

      end

    end

  end

  def verify_notification_preferences

    Common.swipe_down

    if Common.wait_for(20) {@device_account_objects.settings.displayed?}

      @device_account_objects.settings.click

      if Common.wait_for(20) {@device_account_objects.notification_preferences.displayed?}

        Common.wait_for(20){@device_account_objects.icon_left}.click

        return true

      end

    end

  end

  def verify_sync_calendar

      locat = Common.wait_for(3) {@device_account_objects.notification}.location

      y =  locat["y"]

      startY = y+55

      endY = y+55

      before_swipe_string = Common.wait_for(5) {@device_account_objects.notification}.text

      Common.swipe_left(startY,endY)

      after_swipe_string = Common.wait_for(5) {@device_account_objects.sync_calendar}.text

      if  before_swipe_string == after_swipe_string

        return false

      else

        return true

      end

   end

  def change_password_tab

    if $device == "ios"

      locat = Common.wait_for(3) {@device_account_objects.sync_calendar}.location

      y =  locat["y"]

      startY = y+55
      endY = y+55

      before_swipe_string = Common.wait_for(5) {@device_account_objects.sync_calendar}.text

      Common.swipe_left(startY,endY)

      after_swipe_string = Common.wait_for(5) {@device_account_objects.change_password}.text

      if  before_swipe_string == after_swipe_string
        return false
      else
        return true
      end

    elsif $device == "android"

      Common.wait_for(3) {@device_account_objects.notification.displayed?}

      Common.wait_for(3) {@device_account_objects.change_password}.click

      sleep 2

      return true

    end


  end


  def tap_sync

    if Common.wait_for(10) {@device_account_objects.sync.displayed?}

      Common.wait_for(5) {@device_account_objects.sync}.click

      return true

    end

  end

  def verify_contact_us

    if Common.wait_for(20) {@device_account_objects.contact_us.displayed?}
      return true
    end

  end


  def assert_contact_us

    Common.wait_for(2) {@device_account_objects.contact_us.displayed?}

  end

  def verify_faq


    if Common.wait_for(20) {@device_account_objects.faq.displayed?}

      @device_account_objects.faq.click

      # if Common.wait_for(20) {@device_account_objects.faq}.displayed?
      sleep 20

      Common.wait_for(20){@device_account_objects.icon_left}.click

      return true

      # end

    end

  end

  def verify_policies


    if Common.wait_for(20) {@device_account_objects.policies.displayed?}

      # @device_account_objects.policies.click

      # if Common.wait_for(20) {@device_account_objects.policies.displayed?}
      #
      #   Common.wait_for(20){@device_account_objects.icon_left}.click
      #
      # return true
      #
      # end
      return true
    end

  end

  def home_screen_navigation

    @device_account_objects.homeBtn.click

    Common.swipe_top

    Common.wait_for(5) {@device_home_objects.username.displayed?}

    return true

  end

  def navigate_to_home

    @device_home_objects.navigates_back.click

    return true

  end

  def tap_perks

    Common.wait_for(20) {@device_account_objects.perks.click}

    return true

  end

  def verify_perks_title

    sleep 1

    return Common.wait_for(20) {@device_account_objects.perkTitle.displayed?}

  end

  def verify_perks_location

    return Common.wait_for(30) {@device_account_objects.perkLocation.displayed?}

  end

  def tap_first_perk

    $driver.action.move_to(@device_account_objects.perkTitle).click.perform

    # Common.wait_for(5) {@device_account_objects.perkTitle.click}

    return true

  end

  def verify_perk_content_image

    return Common.wait_for(20) {@device_account_objects.perkContentImage.displayed?}


  end

  def verify_perk_content_location

    return Common.wait_for(20) {@device_account_objects.perkContentLocation.displayed?}

  end

  def verify_perk_content_title

    return Common.wait_for(20) {@device_account_objects.perkContentTitle.displayed?}

  end

  def verify_perk_content_desc

    return Common.wait_for(20) {@device_account_objects.perkContentDesc.displayed?}

  end

  def iconLeft

    if $device == "ios"

      sleep 1

      Common.wait_for(20){@device_account_objects.icon_left}.click

      return true

    else

      Common.wait_for(20){@device_account_objects.navigate_up}.click

      return true

    end

  end

  def tap_change_password

    Common.wait_for(5){@device_account_objects.change_password}.click

  end

  def provide_current_password

    @device_account_objects.current_password_input.click

    @device_account_objects.current_password_input.send_keys("password")

  end

  def verify_current_password

    return Common.wait_for(20) {@device_account_objects.current_password.displayed?}

  end

  def provide_new_password

    @device_account_objects.new_password_input.send_keys("password1")

    Common.hideKeyboard

    Common.swipe_down

  end

  def provide_confirm_password

    @device_account_objects.confirm_password_input.send_keys("password1")


  end

  def tap_save_btn

    if $device == "ios"

      $action.press({:x => ($dimensions_width*0.5), :y => ($dimensions_height*0.5)}).release.perform

    end

    Common.wait_for(5){@device_account_objects.save_btn}.click

  end

  def dismiss_dialog
    begin

      Common.wait_for(2) {@device_account_objects.password_update_dialog.displayed?}

      Common.wait_for(5){@device_account_objects.password_dialog_dismiss}.click

    rescue StandardError => e

      puts e.message

    end

  end

  def provide_changed_password

    @device_account_objects.current_password_input.send_keys("password1")

  end

  def provide_orignal_new_password

    @device_account_objects.new_password_input.send_keys("password")

  end

  def provide_orignal_confirm_password

    @device_account_objects.confirm_password_input.send_keys("password")

  end

  def tap_sign_out

    sleep 2

    Common.swipe_down

    sleep 1

    Common.wait_for(5){@device_account_objects.sign_out_account}.click

    if $device == "android"
      Common.wait_for(5){@device_account_objects.cancel_yes}.click
    end

    return Common.wait_for(5){@device_onboarding_objects.main_home.displayed?}

  end

  def verify_subscribe

    Common.wait_for(10) {@device_account_objects.subscribe.displayed?}

    if $device == "android"
      Common.wait_for(5){@device_account_objects.cancel_yes}.click
    end

    return Common.wait_for(10){@device_account_objects.sync.displayed?}

  end

  def tap_signout_onboarding

    Common.wait_for(10) {@device_account_objects.sign_out.displayed?}

    Common.wait_for(5){@device_account_objects.sign_out}.click

  end

  def verify_password_saved

    return Common.wait_for(20) {@device_account_objects.notification_preferences.displayed?}

  end

  def tap_reset

    Common.wait_for(3){@device_account_objects.reset}.click

  end

  def verify_local_house_displayed

    return Common.wait_for(5) {@device_account_objects.local_house.displayed?}

  end

  def tap_favourite_houses

    Common.wait_for(3){@device_account_objects.favourite_houses}.click

  end

  def tap_save_changes

    sleep 2

    Common.wait_for(10){@device_account_objects.save_changes}.click

  end

  def select_40_greek_street

    Common.wait_for(2){@device_account_objects.tap_uk}.click

    Common.wait_for(2){@device_account_objects.greek_St}.click

    Common.wait_for(2){@device_account_objects.kettners}.click

    Common.wait_for(2){@device_account_objects.tap_uk}.click


  end

  def select_shoreditch_house

    tap_reset

    sleep 5

    Common.wait_for(10){@device_account_objects.tap_uk}.click

    Common.swipe_down

    sleep 5

    Common.wait_for(10){@device_account_objects.shoreditch_house}.click

  end

  def select_lhm_house
    tap_reset

    sleep 5

    Common.wait_for(10){@device_account_objects.tap_uk}.click

    Common.swipe_down

    sleep 5

    Common.wait_for(10){@device_account_objects.little_house_mayfair}.click
  end

  def verify_40_greek_st_displayed

    sleep 5

    return Common.wait_for(5){@device_account_objects.greek_St.displayed?}


  end

  def verify_shoreditch_displayed

    sleep 5

    return Common.wait_for(5){@device_account_objects.shoreditch_house.displayed?}

  end

  def tap_settings

    Common.wait_for(5){@device_account_objects.settings}.click

  end

  def verify_settings
    sleep 2

    Common.swipe_down

    sleep 1

    Common.wait_for(10){@device_account_objects.settings.displayed?}

  end

  def tap_notification_pref_switch_off(link)

    Common.wait_for(3){@device_account_objects.notification_pref_switch(link)}.click

    Common.wait_for(3){@device_account_objects.notification_pref_switch(link)}.click

  end

  def verify_notification_pref_switch_value(link, value)

    str = Common.wait_for(3){@device_account_objects.notification_pref_switch_value(link)}

    return str.include? value

  end

  def tap_notification_pref_switch_on(link)

    Common.wait_for(3){@device_account_objects.notification_pref_switch(link)}.click

    sleep 1

  end

  def  tap_contact_us

    sleep 1

    Common.swipe_down

    Common.wait_for(10){@device_account_objects.contact_us}.click

  end

  def select_enquiry_type(input)

    Common.wait_for(10){@device_account_objects.enquiry_type}.click

    sleep 1

    @device_account_objects.enquiry_type.send_keys(input)

  end

  def select_enquiry_topic(input)

    Common.wait_for(10){@device_account_objects.enquiry_topic1}.click

    sleep 1

    @device_account_objects.enquiry_topic1.send_keys(input)

  end

  def input_message(input)

    @device_account_objects.enquiry_message.send_keys(input)

  end

  def tap_submit

    Common.wait_for(10){@device_account_objects.done}.click

    Common.wait_for(10){@device_account_objects.submit}.click

    sleep 8

  end

  def tap_icon_left

    sleep 2
    Common.wait_for(3){@device_account_objects.icon_left}.click

  end

  def verify_edit_profile_screen_title

    if Common.wait_for(3) {@device_account_objects.edit_profile}.displayed?

      return true

    end

  end

  def user_enters_profession_value

    if Common.wait_for(5){@device_account_objects.profession_input}.text.include? "software"
      profile = "profile2"
    else
      profile = 'profile1'
    end

    config = {props: YAML.load_file(File.join(File.dirname(__FILE__), '../../config/testdata.yml'))}

    $profession_value = config[:props]["data"]["profile"][profile]["profession"]
    $industry_value = config[:props]["data"]["profile"][profile]["industry"]
    $city_value = config[:props]["data"]["profile"][profile]["city"]
    $about_me_value =  config[:props]["data"]["profile"][profile]["about-me"]
    $chat_value =  config[:props]["data"]["profile"][profile]["chat"]
    $interest1_value = config[:props]["data"]["profile"][profile]["interest1"]
    $interest2_value = config[:props]["data"]["profile"][profile]["interest2"]
    $website_value = config[:props]["data"]["profile"][profile]["website"]
    $instagram_value = config[:props]["data"]["profile"][profile]["instagram"]
    $twitter_value = config[:props]["data"]["profile"][profile]["twitter"]
    $linkedin_value = config[:props]["data"]["profile"][profile]["linkedin"]
    $spotify_value = config[:props]["data"]["profile"][profile]["spotify"]
    $youtube_value = config[:props]["data"]["profile"][profile]["youtube"]

    Common.wait_for(5){@device_account_objects.profession}.click

    Common.wait_for(5){@device_account_objects.text_input}.clear

    if $device == "ios"
      @device_account_objects.profession.send_keys($profession_value)
    else
      @device_account_objects.text_input.send_keys($profession_value)
    end

    $driver.action.move_to(@device_account_objects.done).click.perform

  end

  def user_enters_industry_value

    Common.wait_for(3){@device_account_objects.industry}.click

    if $device == "ios"
      @device_account_objects.industry_input.send_keys($industry_value)
      Common.wait_for(3){@device_account_objects.industry}.click
    else
      @device_account_objects.industry_input.replace_value($industry_value)
      @device_account_objects.industry_input.click
      @device_account_objects.industry.click
    end



  end

  def user_enters_city_value

    Common.wait_for(5){@device_account_objects.city}.click

    Common.wait_for(5){@device_account_objects.text_input}.clear

    @device_account_objects.city.send_keys($city_value)

    $driver.action.move_to(@device_account_objects.done).click.perform

  end

  def user_enters_about_me_value

    sleep 2

    # Common.little_swipe_down

    Common.wait_for(3){@device_account_objects.aboutme}.click

    Common.wait_for(3){@device_account_objects.large_text_input}.clear

    if $device == "ios"
      @device_account_objects.aboutme.send_keys($about_me_value)
    else
      @device_account_objects.large_text_input.send_keys($about_me_value)
    end

    $driver.action.move_to(@device_account_objects.done).click.perform

  end

  def user_enters_lets_chat_value

    Common.little_swipe_down

    Common.wait_for(5){@device_account_objects.chat}.click

    Common.wait_for(5){@device_account_objects.large_text_input}.clear

    if $device == "ios"
      @device_account_objects.chat.send_keys($chat_value)
    else
      @device_account_objects.large_text_input.send_keys($chat_value)
    end

    $driver.action.move_to(@device_account_objects.done).click.perform

  end

  def user_enters_interests_value

    Common.little_swipe_down

    Common.wait_for(10){@device_account_objects.interests}.click

    element_count = Common.wait_for(10){@device_account_objects.interests_remove.size}

    if element_count > 0

      until element_count == 0

        @device_account_objects.interests_remove[0].click

        element_count = element_count-1

      end

    end

    if $device == "ios"
      @device_account_objects.interests.send_keys("i")
    else
      @device_account_objects.interests_input1.send_keys("i")
    end

    @device_account_objects.interests_input($interest1_value).click

    @device_account_objects.interests_input($interest2_value).click

    $driver.action.move_to(@device_account_objects.done).click.perform

  end

  def tap_social_accounts

    Common.wait_for(3){@device_account_objects.social_accounts}.click

  end

  def user_enters_website_value

    Common.wait_for(2){@device_account_objects.website_text}.click

    Common.wait_for(2){@device_account_objects.website_text}.clear

    if $device == "ios"

      @device_account_objects.website.send_keys($website_value)

    else

      Common.wait_for(2){@device_account_objects.website_text.send_keys($website_value)}

    end

  end

  def user_enters_instagram_value

    Common.wait_for(2){@device_account_objects.instagram_text}.click

    Common.wait_for(2){@device_account_objects.instagram_text}.clear

    @device_account_objects.instagram_text.send_keys($instagram_value)


  end

  def user_enters_twitter_value

    Common.wait_for(2){@device_account_objects.twitter_text}.click

    Common.wait_for(2){@device_account_objects.twitter_text}.clear

    @device_account_objects.twitter_text.send_keys($twitter_value)

    Common.little_swipe_down

  end

  def user_enters_linkedin_value

    Common.wait_for(2){@device_account_objects.linkedin_text}.click

    Common.wait_for(2){@device_account_objects.linkedin_text}.clear

    @device_account_objects.linkedin_text.send_keys($linkedin_value)

  end

  def user_enters_spotify_value

    Common.wait_for(2){@device_account_objects.spotify_text}.click

    Common.wait_for(2){@device_account_objects.spotify_text}.clear

    @device_account_objects.spotify_text.send_keys($spotify_value)

  end

  def user_enters_youtube_value

    Common.wait_for(2){@device_account_objects.youtube_text}.click

    Common.wait_for(2){@device_account_objects.youtube_text}.clear

    @device_account_objects.youtube_text.send_keys($youtube_value)

  end

  def user_taps_done

    $driver.action.move_to(@device_account_objects.done).click.perform

  end

  def user_save_changes

    Common.wait_for(6){@device_account_objects.save_changes}.click

  end

  def verify_profession_value

    sleep 5

    return Common.wait_for(3){@device_account_objects.profession_value1}.text.include? $profession_value

  end

  def verify_interests_values

    if Common.wait_for(3){@device_account_objects.interests_value}.text.include? $interest1_value

      if Common.wait_for(3){@device_account_objects.interests_value}.text.include? $interest2_value

        return true

      end

    end

  end

  def verify_industry_value

    return Common.wait_for(3){@device_account_objects.industry_value}.text.include? $industry_value

  end

  def verify_city_value

    sleep 2

    return Common.wait_for(3){@device_account_objects.city_value}.text.include? $city_value

  end

  def verify_about_me_value

    return Common.wait_for(3){@device_account_objects.about_me_value}.text.include? $about_me_value

  end

  def verify_lets_chat_value

    Common.swipe_down

    return Common.wait_for(3){@device_account_objects.lets_chat_value}.text.include? $chat_value

  end

  def verify_website

    return Common.wait_for(3) {@device_account_objects.website_value}.displayed?

  end

  def verify_instagram

    return Common.wait_for(3) {@device_account_objects.instagram_value}.displayed?


  end

  def verify_twitter

    return Common.wait_for(3) {@device_account_objects.twitter_value}.displayed?

  end

  def verify_linkedin

    return Common.wait_for(3) {@device_account_objects.linkedin_value}.displayed?

  end

  def verify_spotify

    return Common.wait_for(3) {@device_account_objects.spotify_value}.displayed?

  end

  def verify_youtube

    return Common.wait_for(3) {@device_account_objects.youtube_value}.displayed?

  end

  def home_screen_navigate

    if $device == "ios"

      Common.wait_for(10){@device_account_objects.icon_left.click}

      Common.wait_for(10){@device_account_objects.homeBtn.click}

      return true

    else

      Common.wait_for(10){@device_account_objects.navigate_up.click}

      Common.wait_for(10){@device_account_objects.homeBtn.click}

      return true

    end

  end

  def change_password_tab_android

    Common.wait_for(3) {@device_account_objects.notification.displayed?}

    Common.wait_for(3) {@device_account_objects.change_password}.click

    sleep 2
    return true

  end


end


