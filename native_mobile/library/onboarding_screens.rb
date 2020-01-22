require 'rubygems'
require 'appium_lib'
# require 'watir'
require 'selenium-webdriver'
require "test/unit"
require 'yaml'
require_relative '../../common/functions_common'
require_relative '../pageobjects/onboarding_objects'


class OnboardingScreens

  def initialize()
    #
    if $device == "ios"

      @device_onboarding_objects = Ios_Onboarding_Objects.new($driver, $driver_appium)

    else

      @device_onboarding_objects = Android_Onboarding_Objects.new($driver, $driver_appium)

    end

  end


  def verify_user_is_on_onboarding_screen()

    return Common.wait_for(20) {@device_onboarding_objects.terms_text.displayed?}

  end


  def user_accepts_Terms

    sleep 2

    Common.wait_for(25){@device_onboarding_objects.accept_terms}.click

  end


  def verify_user_is_on_helpus_screen()

    return Common.wait_for(20){@device_onboarding_objects.helpus_text.displayed?}

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


  def user_continues_from_welcome()

    Common.wait_for(20){@device_onboarding_objects.next_button}.click

  end


  def verify_make_personal_screen()

    return Common.wait_for(20){@device_onboarding_objects.makepersonal_text.displayed?}

  end


  def user_continues_from_makePersonal()

    sleep 6

      Common.wait_for(20){@device_onboarding_objects.makepersonal_continue}.click

  end


  def verify_Intro_Notice_screen()

    return Common.wait_for(15){@device_onboarding_objects.intronotice_text.displayed?}

  end


  def user_continues_from_IntroNotice()

    Common.wait_for(20){@device_onboarding_objects.continue_button}.click

  end

  def verify_Noticeboard_screen()

    return Common.wait_for(10){@device_onboarding_objects.noticeboard_text.displayed?}

  end

  def user_clicks_next()

    Common.wait_for(25){@device_onboarding_objects.next_button}.click

  end


  def user_clicks_continue()

    Common.wait_for(20){@device_onboarding_objects.continue_button}.click

  end

  def user_clicks_continue_to_notify_pref()

    Common.wait_for(25){@device_onboarding_objects.next_button}.click

  end


  def verify_Notification_pref_screen()

    return Common.wait_for(10){@device_onboarding_objects.notification_pref_text.displayed?}

  end

  def user_clicks_OK()

    Common.wait_for(20){@device_onboarding_objects.ok_button}.click

  end

  def verify_youareset_screen()

    return Common.wait_for(10){@device_onboarding_objects.you_are_set_text.displayed?}

  end

end
