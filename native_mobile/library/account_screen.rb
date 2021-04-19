
require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require "test/unit"
require 'yaml'
require_relative '../pageobjects/onboarding_objects'
require_relative '../pageobjects/home_objects'
require_relative '../pageobjects/account_objects'


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

  def tap_View_Profile

    if $device == 'ios'

      Common.swipe_top

      $driver.action.move_to(@device_account_objects.account_title).click.perform

    else

      Common.wait_for(10){@device_account_objects.account_title}
      sleep 3
      $driver.action.move_to(@device_account_objects.account_title).click.perform

    end

  end


  def tap_edit_link

    Common.wait_for(10) {@device_account_objects.edit_profile_screen}.click

  end

  def verify_change_password

    sleep 2

    Common.swipe_down

    if Common.wait_for(20) {@device_account_objects.change_password.displayed?}

      @device_account_objects.change_password.click

      if Common.wait_for(20) {@device_account_objects.change_password.displayed?}

        Common.navigateBack

        return true

      end

    end

  end

  def favourite_houses_shown

    Common.little_swipe_down

    i = 1

    loop do

      begin

        return Common.wait_for(5) {@device_account_objects.favourite_houses.displayed?}

      rescue

        Common.little_swipe_down

        i = i + 1

        if i > 2

          return false

        end

      end

    end

  end

  def verify_setting_tab(tab)

    ($device=="ios")?(startY = endY = $dimensions_height/2):(startY = endY = $android_dimensions_height/2)

     case tab

     when "Privacy"

       index=1

     when "Sync calendar"

       index=2

     when "Change Password"

       ($device=="ios")?index=3:index=1

     else

       index=0

     end

    for i in 0..index do

      Common.swipe_left(startY,endY)

     sleep 5

    end

    return true


   end

  def tap_sync

    if Common.wait_for(10) {@device_account_objects.sync.displayed?}

      Common.wait_for(5) {@device_account_objects.sync}.click

      return true

    end

  end



  def assert_contact_us

    Common.wait_for(2) {@device_account_objects.contact_us.displayed?}

  end

  def home_screen_navigation
    sleep 3

    $common_screen=CommonScreen.new
    $common_screen.navigate_to_tabs("Home")

    sleep 2

    Common.swipe_top

    Common.wait_for(5) {@device_home_objects.username.displayed?}

    return true

  end

  def navigate_to_home

    sleep 2
    $common_screen=CommonScreen.new
    $common_screen.navigate_to_tabs("Home")

    return true

  end

  def tap_change_password

    Common.wait_for(5){@device_account_objects.change_password}.click

  end

  def provide_current_password

    @device_account_objects.current_password_input.send_keys("password")

  end

  def verify_current_password

    return Common.wait_for(20) {@device_account_objects.current_password.displayed?}

  end

  def provide_new_password

    @device_account_objects.new_password_input.send_keys("password1")

   end

  def provide_confirm_password

    @device_account_objects.confirm_password_input.send_keys("password1")


  end

  def tap_save_btn

    Common.swipe_down

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
    if $device == "android"
      sleep 1
      Common.swipe_down
    end

    Common.wait_for(10){@device_account_objects.sign_out_account}.click

    if $device == "android"
      Common.wait_for(10){@device_account_objects.cancel_yes}.click
    end

    return Common.wait_for(5){@device_onboarding_objects.main_home.displayed?}

  end

  def verify_sign_out
    i = 1

    loop do

      begin

        return Common.wait_for(3){@device_account_objects.sign_out_account.displayed?}

      rescue StandardError => signout_is_not_visible

        Common.swipe_down

        i = i + 1

        if i > 3

          return false

        end

      end

    end

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
    begin
      Common.wait_for(3){@device_account_objects.reset_popup}.click
    rescue
    end

  end

  def verify_local_house_displayed
    sleep 2
    return Common.wait_for(5) {@device_account_objects.local_house.displayed?}

  end

  def tap_favourite_houses
    Common.little_swipe_down

    Common.wait_for(3){@device_account_objects.favourite_houses}.click

  end

  def tap_save_changes

    sleep 2

    Common.wait_for(10){@device_account_objects.save_changes}.click

  end

  def select_40_greek_street

    tap_reset

    sleep 5

    Common.wait_for(10){@device_account_objects.tap_uk}.click

    Common.swipeByLocation(50,250,50,20)
    i=0
    loop do
      begin

        Common.wait_for(2){@device_account_objects.greek_St}.click

        Common.wait_for(2){@device_account_objects.kettners}.click

        break

      rescue

        Common.swipeByLocation(50,250,50,20)
        i=i+1
        if i>2
          break
        end

      end
    end

    Common.wait_for(2){@device_account_objects.tap_uk}.click
  end

  def select_berlin

    sleep 5

    Common.wait_for(10){@device_account_objects.tap_europe}.click

    Common.swipeByLocation(50,250,50,20)
    i=0
    loop do
      begin

        $common_screen.click_element_with_text("Soho House Berlin")

        break

      rescue

        Common.swipeByLocation(50,250,50,20)
        i=i+1
        if i>2
          break
        end

      end
    end

    Common.wait_for(2){@device_account_objects.tap_uk}.click
  end

  def select_76_dean_house
    sleep 5

    Common.wait_for(10){@device_account_objects.tap_uk}.click

    Common.swipeByLocation(50,350,50,20)
    i=0
    loop do
      begin

        sleep 5
        Common.wait_for(10){@device_account_objects.dean_street}.click
        break
      rescue

        Common.swipeByLocation(50,250,50,20)
        i=i+1
        if i>2
          break
        end

      end
    end
  end

  def tap_settings

    Common.wait_for(5){@device_account_objects.settings}.click

  end

  def verify_settings

    Common.swipe_down

    Common.wait_for(10){@device_account_objects.settings.displayed?}

  end

 def select_favourite_locations (input)

   @device_account_objects.select_favourite(input).click

   $device=="ios"?(sleep 1):(sleep 15)


  end

  def favourite_location_displayed (input)

    Common.wait_for(3){@device_account_objects.select_favourite(input)}.displayed?
  end


  def verify_notification_pref_switch_value(input, value)
    i=0
    loop do
      begin
        pushtype=nil
        link = nil
        if input.include?"->"
          arr=input.split("->")
          link=arr[0].to_s
          pushtype=arr[1].to_s
        end
        if input.include?"->"
          str = Common.wait_for(3){@device_account_objects.notification_pref_notifType_value(link,pushtype)}
        else
          str = Common.wait_for(3){@device_account_objects.notification_pref_switch_value(input)}
        end
        if $device == "ios"

        return str.include? value

        else

          if value == "0"

            val =false

          else

            val=true

          end

          return str.to_s.eql?val.to_s
        end
      rescue
        Common.little_swipe_down
      end
    end
  end

  def tap_notification_pref_switch_on(link)

    Common.wait_for(3){@device_account_objects.notification_pref_switch(link)}.click

    sleep 1

  end

  def  tap_contact_us

    Common.swipe_down

    Common.swipe_down

    Common.wait_for(15){@device_account_objects.contact_us}.click

  end

  def select_type_topic(name,input)

    if Common.wait_for(20){@device_account_objects.enquiry_type(name)}.displayed?

      @device_account_objects.enquiry_type(name).click

      sleep 2

      if $device == "ios"

        @device_account_objects.enquiry_type(name).click

        @device_account_objects.enquiry_picker.send_keys(input)

        $common_screen.click_element_with_text("Done")

      else

        Common.wait_for(10){@device_account_objects.enquiry_topic_option(input)}.click

      end

    end

  end


  def input_message(input)
    sleep 2
    @device_account_objects.enquiry_message.send_keys(input)

  end

  def tap_submit

    Common.little_swipe_down

    Common.wait_for(10){@device_account_objects.submit}.click

    sleep 8

  end

  def tap_icon_left

    begin

      Common.wait_for(20) {@device_account_objects.icon_left}.click

    rescue

      begin

        Common.wait_for(20){@device_account_objects.close_webview}.click

      rescue
      end

    end

  end

  def verify_edit_profile_screen_title

    if Common.wait_for(3) {@device_account_objects.edit_profile}.displayed?

      return true

    end

  end

  def tap_social_accounts
     $common_screen.swipeByLocation(50,400,50,100)

     sleep 1
    begin
    Common.wait_for(3){@device_account_objects.social_accounts}.displayed?
    rescue
      Common.little_swipe_down
      ($common_screen.verify_element_displayed_with_text("Cancel") and $device == "android")?($common_screen.click_element_with_text("Cancel")):(sleep 1)
      sleep 1
    end
     Common.wait_for(3){@device_account_objects.social_accounts}.click

  end

  def user_save_changes

    Common.wait_for(6){@device_account_objects.save_changes}.click

  end

  def home_screen_navigate

    Common.navigateBack

    Common.wait_for(10){@device_home_objects.homeBtn}.click

    return true

  end

  def verify_confirmation_message

    Common.wait_for(10) {@device_account_objects.confirm_message}.displayed?

    return true

  end

  def tap_notifications_pref_switch_off(input,confirm_popup)
    pushtype=nil
    link = nil
    if input.include?"->"
      arr=input.split("->")
      link=arr[0].to_s
      pushtype=arr[1].to_s
    end
    i = 0

    loop do

      begin
        if input.include?"->"
          Common.wait_for(2){@device_account_objects.notification_pref_notifType(link,pushtype)}.click
        else
          Common.wait_for(2){@device_account_objects.notification_pref_switch(input)}.click

          if $device == "ios"

            Common.little_swipe_down

            sleep 3

            Common.wait_for(3){@device_account_objects.notification_pref_switch(input)}.click

          else

            if confirm_popup==1

              sleep 1

              @device_account_objects.ok_close_button.click

            end

          end

        end
        return true

      rescue StandardError => msg

        sleep 2

        Common.little_swipe_down

        i = i + 1

        if i > 3

          return false

        end

      end

    end

    if $device == "ios"

      Common.wait_for(3){@device_account_objects.notification_pref_switch(link)}.click

    end

  end

  def verify_elementDisplayed(elementText)
    i = 0

    loop do

      begin

        return Common.wait_for(2){@device_account_objects.ElementsWithText(elementText)}.displayed?

      rescue StandardError => msg

        Common.little_swipe_down

        i = i + 1

        if i > 4

          return false

        end

      end

    end

  end

  def verifytoggle(link)

    i=0
    loop do
      confirm_popup=0
    if verify_notification_pref_switch_value(link, "1")
      if $scenario.getContext("scenario").include?"preferences for events"
        confirm_popup=1
      end
      $accountscreen.tap_notifications_pref_switch_off(link,confirm_popup)
      assert_true(verify_notification_pref_switch_value(link, "0"), "Notification pref value is not unset")
    else
      $accountscreen.tap_notifications_pref_switch_off(link,confirm_popup)
      assert_true(verify_notification_pref_switch_value(link, "1"), "Notification pref value is not set")
    end
    i=i+1

    if i>=2
      break
    end
    end

  end

  def verify_elementWithPartialTextDisplayed(elementText)
    i = 0

    loop do

      begin

        return Common.wait_for(2){@device_account_objects.element_contains_text(elementText)}.displayed?

      rescue StandardError => msg

        Common.little_swipe_down

        i = i + 1

        if i > 4

          return false

        end

      end

    end

  end

  def navigate_back_to_account

    begin

      sleep 2
      $common_screen.click_element(@device_account_objects.navigate_back_to_account)

    rescue

      $device=="ios"?(Common.swipe_top):(Common.goBack)

    end

  end

  def close_edit_profile

    begin

      @device_account_objects.close_profile.click

    rescue
    end

  end


  def expand_editprofile

    return @device_account_objects.open_edit_profile.location

  end

  def getEditProfileText(text, value)

    case text


    when "What do you do","City"

      $common_screen.wait_for($common_screen.fiveSecondsTimeout){@device_account_objects.editProfileTextField}.clear

      @device_account_objects.editProfileTextField.send_keys(value)

    when "Interests"

      removewidget(value)

    when "About me","Let's chat"
      if $device=="ios"
        $common_screen.wait_for($common_screen.fiveSecondsTimeout){@device_account_objects.editProfileTextView}.clear
        @device_account_objects.editProfileTextView.send_keys(value)
      else
        $common_screen.wait_for($common_screen.fiveSecondsTimeout){@device_account_objects.editProfileTextField}.clear
        @device_account_objects.editProfileTextField.send_keys(value)
      end


    when "Industry"

      $common_screen.wait_for($common_screen.fiveSecondsTimeout){@device_account_objects.editProfilePicker}.send_keys(value)

    end

    begin

      click_done

    rescue
      $driver.action.move_to(@device_account_objects.editProfileLink(text)).click.perform
    end

    return true

  end

  def clickEditProfileLink(text)

    if $device == "ios"

      $driver.action.move_to(@device_account_objects.editProfileLink(text)).click.perform

    else

      @device_account_objects.editProfileLink(text).click

    end

  end

  def removewidget(text)
    if $device == "ios"

    element_count = Common.wait_for(10){@device_account_objects.profession_interests_remove.size}

    if (element_count > 0) or ($common_screen.verify_element_displayed_with_partial_text("Please choose"))

      until element_count == 0

        @device_account_objects.profession_interests_remove[0].click

        element_count = element_count-1

      end

    end

    else

      $common_screen.click_element_with_text("Reset")

    end

    for i in text

      if $device == "ios"

        @device_account_objects.editProfileTextField.clear

        @device_account_objects.editProfileTextField.send_keys(i.split(" ")[0])

      end

      clickWidget(i)

    end

    sleep 1

    $device == "android"?  ($common_screen.click_element_with_text("Confirm")):(sleep 1)

  end

  def select_pill(text)

    @device_account_objects.editProfileTextField.clear

    @device_account_objects.editProfileTextField.send_keys(text.split(" ")[0])

    clickWidget(text)

  end

  def clickWidget(text)

    begin

      Common.wait_for(3){@device_account_objects.profession_interests_input(text)}.click

    rescue

    end

  end

  def clickSocial(text,value)

    Common.wait_for(3){@device_account_objects.editSocialMedia(text)}.clear

    Common.wait_for(3){@device_account_objects.editSocialMedia(text)}.send_keys(value)

  end

  def verifyLinks(value)
    sleep 5

    config = {props: YAML.load_file(File.join(File.dirname(__FILE__), '../../config/testdata.yml'))}

    text = config[:props]["data"]["profile"]["profile1"][value.to_s.downcase]

    case value

    when "profession"

      return Common.wait_for(20){@device_account_objects.profession_value1}.text.downcase.include? text.downcase

    when "interest1"

      return Common.wait_for(3){@device_account_objects.interests_value}.text.include? text[1]

    when "about-me"

      return Common.wait_for(3){@device_account_objects.about_me_value}.text.include? text

    when "city"

      return Common.wait_for(5){@device_account_objects.city_value}.text.include? text

    when  "chat"

      return Common.wait_for(3){@device_account_objects.lets_chat_value}.text.include? text

    when "industry"

      return Common.wait_for(3){@device_account_objects.industry_value}.text.include? text

    else

      return Common.wait_for(3) {@device_account_objects.socialMediaValues(value)}.displayed?

    end

  end

  def click_done

    $driver.action.move_to(@device_account_objects.done).click.perform

  end

end



