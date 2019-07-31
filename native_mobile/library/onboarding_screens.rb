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

      @device_onboarding_objects = Android_Onboarding_Objects.new

    end

  end


  def verify_user_is_on_onboarding_screen()

    if Common.wait_for(20) {@device_onboarding_objects.terms_text.displayed?}

      return true

    end

  end

  def user_accepts_Terms

    @device_onboarding_objects.accept_terms.click

  end


  def verify_user_is_on_helpus_screen()

    if Common.wait_for(10){@device_onboarding_objects.helpus_text.displayed?}

      return true

    end

  end

  def user_allows_helpus()

    @device_onboarding_objects.allow_improve.click

  end

  def verify_user_on_house_rules_screen()

    if Common.wait_for(20){@device_onboarding_objects.houserules_text.displayed?}

      return true

    end

  end

  def user_accepts_house_rules()

    @device_onboarding_objects.next_button.click

  end

  def verify_user_on_myplanner_screen()

    if Common.wait_for(10){@device_onboarding_objects.myplanner_text.displayed?}

      return true

    end

  end

  def user_continue_without_sync()

    @device_onboarding_objects.continue_without_sync.click

  end

  def verify_user_welcome_screen()

    if Common.wait_for(10){@device_onboarding_objects.welcome_text.displayed?}

      return true

    end

  end

  def user_continues_from_welcome()

    @device_onboarding_objects.next_button.click

  end

  def verify_make_personal_screen()

    if Common.wait_for(10){@device_onboarding_objects.makepersonal_text.displayed?}

      return true

    end

  end

  def user_continues_from_makePersonal()

    @device_onboarding_objects.next_button.click

  end


  def verify_Intro_Notice_screen()

    if Common.wait_for(10){@device_onboarding_objects.intronotice_text.displayed?}

      return true

    end

  end

    def user_continues_from_IntroNotice()

      @device_onboarding_objects.continue_button.click

    end

  def verify_Noticeboard_screen()

    if Common.wait_for(10){@device_onboarding_objects.noticeboard_text.displayed?}

      return true

    end

  end

  def user_clicks_next()

    @device_onboarding_objects.next_button.click

  end

  def verify_Notification_pref_screen()

    if Common.wait_for(10){@device_onboarding_objects.notification_pref_text.displayed?}

      return true

    end

  end

  def user_clicks_OK()

    @device_onboarding_objects.ok_button.click

  end

  def verify_youareset_screen()

    if Common.wait_for(10){@device_onboarding_objects.youareset_text.displayed?}

      return true

    end

  end




  end
