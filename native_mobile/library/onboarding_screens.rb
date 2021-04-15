require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require "test/unit"
require 'yaml'
require_relative '../../common/functions_common'
require_relative '../pageobjects/onboarding_objects'


class OnboardingScreens

  def initialize()

    if $device == "ios"

      @device_onboarding_objects = Ios_Onboarding_Objects.new($driver, $driver_appium)

    else

      @device_onboarding_objects = Android_Onboarding_Objects.new($driver, $driver_appium)

    end

  end

  def verify_user_is_on_login_page()

    if  Common.wait_for(5) {@device_onboarding_objects.welcome_home.displayed?}

      return true

    end

  end


  def close_app

    $driver = $driver_appium.quit_driver

  end

  def user_enters_email_password(validity)

    if validity == "valid"

      config     = {props: YAML.load_file(File.join(File.dirname(__FILE__), '../../config/environments.yml'))}

      email      = $email

      $password   = $pass

      $name = config[:props]["env"][$env][$email]["name"]

      $house = config[:props]["env"][$env][$email]["house"]

      $profile = config[:props]["env"][$env][$email]["profile"]

      if $device == 'ios'

        @device_onboarding_objects.email_textfield.click

      end

      @device_onboarding_objects.email_textfield.send_keys(email)

      @device_onboarding_objects.password_textfield.send_keys($password)

    end

  end

  def user_enters_email_changed_password(validity)

    config     = {props: YAML.load_file(File.join(File.dirname(__FILE__), '../../config/testdata.yml'))}

    email      = config[:props]["data"][validity]
    $device == "ios"?(@device_onboarding_objects.email_textfield.click):(sleep 1)
    @device_onboarding_objects.email_textfield.clear

    @device_onboarding_objects.email_textfield.send_keys(email)

    @device_onboarding_objects.password_textfield.clear

    @device_onboarding_objects.password_textfield.send_keys("password1")

  end

  def dismiss_invalid_credential

    begin

    Common.wait_for(30){@device_onboarding_objects.invalid_credential_dialog.displayed?}

    Common.wait_for(30){@device_onboarding_objects.ok_button}.click

    sleep 2

    rescue StandardError => e

      puts e.message

    end

  end

  def user_clicks_go()

    Common.wait_for(30){@device_onboarding_objects.go_button}.click

  end

  def verify_user_signin()


  end

  def verify_app_launch_screen()
    if  Common.wait_for(30) {@device_onboarding_objects.main_home.displayed?}

      return true

    end
  end

  def user_clicks_membership()
    sleep 3
    Common.wait_for(20){@device_onboarding_objects.main_home}.click
  end

  def user_main_screen()

    Common.wait_for(2){@device_onboarding_objects.main_home.displayed?}
  end

  def verify_user_is_on_onboarding_screen()

    return Common.wait_for(20) {@device_onboarding_objects.terms_text.displayed?}

  end

  def verify_user_is_on_membership_screen()

    return Common.wait_for(20) {@device_onboarding_objects.welcome_text.displayed?}

  end


  def user_accepts_Terms

    sleep 2

    Common.wait_for(25){@device_onboarding_objects.accept_terms}.click

  end

  def user_clicks_remind_later
    sleep 2
    Common.wait_for(25){@device_onboarding_objects.remind_later}.click

  end


  def verify_user_is_on_helpus_screen()

    return Common.wait_for(20){@device_onboarding_objects.helpus_text.displayed?}

  end

  def verify_user_is_on_memberbenifits_screen()

    return Common.wait_for(20){@device_onboarding_objects.memberbenifits_text.displayed?}

  end


  def verify_user_is_on_housepay_screen()

    return Common.wait_for(20){@device_onboarding_objects.housepay_text.displayed?}

  end



  def user_allows_helpus()

    Common.wait_for(20){@device_onboarding_objects.allow_improve}.click

  end


  def verify_user_on_house_rules_screen()

    return Common.wait_for(20){@device_onboarding_objects.houserules_text.displayed?}

  end


  def user_accepts_house_rules()

    sleep 15

    Common.wait_for(20){@device_onboarding_objects.next_button}.click

  end


  def verify_user_on_myplanner_screen()

    return Common.wait_for(20){@device_onboarding_objects.myplanner_text.displayed?}

  end


  def user_continue_without_sync()

    Common.wait_for(20){@device_onboarding_objects.continue_without_sync}.click

  end

  def verify_user_welcome_screen()

    return Common.wait_for(10){@device_onboarding_objects.welcome_text.displayed?}

  end

  def verify_sync_with_calendar()

    return Common.wait_for(10){@device_onboarding_objects.sync_text.displayed?}

  end


  def user_continues_from_welcome()

    Common.wait_for(20){@device_onboarding_objects.next_button_1}.click

  end


  def verify_make_personal_screen()


    return Common.wait_for(20){@device_onboarding_objects.makepersonal_text.displayed?}

  end

  def verify_payment_button()

    Common.wait_for(20){@device_onboarding_objects.update_payment.displayed?}

  end

  def verify_frozen_screen()

    Common.wait_for(25){@device_onboarding_objects.frozen_screen.displayed?}

  end

  def verify_expired_screen()

    Common.wait_for(25){@device_onboarding_objects.expired_screen.displayed?}

  end

  def verify_suspended_screen()

    Common.wait_for(15){@device_onboarding_objects.suspended_screen.displayed?}

  end

  def user_continues_from_makePersonal()

    sleep 3

    Common.wait_for(10){@device_onboarding_objects.makepersonal_continue}.click

  end


  def verify_Intro_Notice_screen()

    return Common.wait_for(15){@device_onboarding_objects.intronotice_text.displayed?}

  end


  def user_clickson_Continue()

    if $device == "ios"

      Common.wait_for(20){@device_onboarding_objects.continue_button}.click

    else

      Common.wait_for(20) {@device_onboarding_objects.let_me_in_button}.click

    end



  end

  def verify_Noticeboard_screen()

    return Common.wait_for(10){@device_onboarding_objects.noticeboard_text.displayed?}

  end

  def user_clicks_next()

    Common.wait_for(25){@device_onboarding_objects.next_button}.click

  end


  def user_clicks_continue()

    Common.wait_for(22){@device_onboarding_objects.continue_button}.click

  end

  def user_clicks_done()

    Common.wait_for(22){@device_onboarding_objects.done_button}.click

  end

  def user_clicks_continue_to_notify_pref()

    Common.wait_for(30){@device_onboarding_objects.next_button}.click

  end

  def user_turnsOn_notifications()

    Common.wait_for(30){@device_onboarding_objects.notifications_on}.click

  end


  def verify_Notification_pref_screen()

    return Common.wait_for(20){@device_onboarding_objects.notification_pref_text.displayed?}

  end

  def user_clicks_OK()

    Common.wait_for(22){@device_onboarding_objects.ok_button}.click

  end

  def verify_youareset_screen()

    return Common.wait_for(10){@device_onboarding_objects.you_are_set_text.displayed?}

  end

  def verify_house_introduction

    if Common.wait_for(20){@device_onboarding_objects.house_introduction.displayed?}

      Common.swipe_down

      return true

    end

  end

  def chasing_payment

    Common.wait_for(20){@device_onboarding_objects.chasing_payment_text.displayed?}
  end

  def update_later_button

    Common.wait_for(20){@device_onboarding_objects.update_later}.click
  end

  def contact_membership_team_onboarding

    Common.wait_for(5){@device_onboarding_objects.contact_membership_team}.click

  end


  def tap_contact_membership_team

    Common.wait_for(10){@device_onboarding_objects.contact_membership_team}.click

    sleep 15

    if Common.wait_for(25){@device_onboarding_objects.get_back_shortly}.text.include? "Thanks for your booking request"

      Common.wait_for(10){@device_onboarding_objects.ok_button}.click

      sleep 2

      Common.wait_for(10){@device_onboarding_objects.next_button}.click

      return Common.wait_for(20){@device_onboarding_objects.houserules_text.displayed?}

    else

      return false

    end

  end

  def verify_membership_card()

    Common.wait_for(40){@device_onboarding_objects.membership_card.displayed?}

  end

  def verify_member_benefits()

    Common.wait_for(25){@device_onboarding_objects.member_benefit.displayed?}

  end

end
