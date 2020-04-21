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

    $loginscreen = LoginScreen.new

    assert_true($loginscreen.verify_app_launch_screen, "App installed successfully")


  end

  Then("app is closed") do

    $loginscreen.close_app

  end

  And(/^user is on sign in screen$/) do

    $loginscreen = LoginScreen.new

    assert_true($loginscreen.verify_user_is_on_login_page, "User is on the sign-in screen")

  end

  When(/^user enters (.*) email address and password$/) do |validity|

    $loginscreen.user_enters_email_password(validity)

    $loginscreen.user_clicks_go

    $onboardingscreens = OnboardingScreens.new

    $homescreen = HomeScreen.new

    $whatsonscreen = WhatsonScreen.new


  end

  And(/^user clicks on go button$/) do

    $loginscreen.user_clicks_go

    $onboardingscreens = OnboardingScreens.new

    $homescreen = HomeScreen.new

    $whatsonscreen = WhatsonScreen.new

  end

And(/^the user is on main screen$/) do

  $loginscreen = LoginScreen.new

  $loginscreen.user_main_screen

  $loginscreen.user_clicks_membership

  assert_true($loginscreen.verify_user_is_on_login_page, "User is on the sign-in screen")

end

When(/^the user goes through ios Onboarding screen$/) do

  $onboardingscreens.user_accepts_Terms

  sleep 3

  assert_true($onboardingscreens.verify_user_is_on_helpus_screen,"User is unable to land on 'Help us improve' screen")

  $onboardingscreens.user_allows_helpus

end