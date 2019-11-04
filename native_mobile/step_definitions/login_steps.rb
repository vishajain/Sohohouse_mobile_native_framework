require 'rubygems'
require 'cucumber'
require 'selenium-webdriver'
require 'test/unit/assertions'
require_relative '../support/drivers/base_driver'
require_relative '../library/login_screen'
require_relative '../pageobjects/login_objects'
require_relative '../library/onboarding_screens'
include Test::Unit::Assertions

  Given(/^app is launched$/) do

    Base_driver.setapp()

    sleep 10

  end


  And(/^user is on sign in screen$/) do

    $loginscreen = LoginScreen.new

    assert_true($loginscreen.verify_user_is_on_login_page, "User is on the sign-in screen")

  end

  When(/^user enters (.*) email address and password$/) do |validity|

    $loginscreen.user_enters_email_password(validity)

  end

  And(/^user clicks on go button$/) do

    $loginscreen.user_clicks_go

    $onboardingscreens = OnboardingScreens.new

    $homescreen = HomeScreen.new

  end