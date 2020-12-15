require 'rubygems'
require 'cucumber'
require 'selenium-webdriver'
require 'test/unit/assertions'
require_relative '../support/drivers/base_driver'
require_relative '../library/onboarding_screens'
require_relative '../pageobjects/onboarding_objects'
require_relative '../../common/functions_common'

include Test::Unit::Assertions

Given(/^app is launched$/) do

  Base_driver.setapp()

  $onboardingscreens = OnboardingScreens.new

  assert_true($onboardingscreens.verify_app_launch_screen, "App installed successfully")


end

Then("app is closed") do

  $onboardingscreens.close_app

end

And(/^user is on sign in screen$/) do

  $onboardingscreens = OnboardingScreens.new

  assert_true($onboardingscreens.verify_user_is_on_login_page, "User is on the sign-in screen")

end

When(/^user enters (.*) email address and password$/) do |validity|

  $onboardingscreens.user_enters_email_password(validity)

  $onboardingscreens = OnboardingScreens.new

  $homescreen = HomeScreen.new

  $whatsonscreen = WhatsonScreen.new

  $onboardingscreens.user_clicks_go

end

And(/^user clicks on go button$/) do

  $onboardingscreens.user_clicks_go

  $onboardingscreens = OnboardingScreens.new

  $homescreen = HomeScreen.new

  $whatsonscreen = WhatsonScreen.new

end

And(/^the user is on main screen$/) do

  $onboardingscreens = OnboardingScreens.new

  $onboardingscreens.user_main_screen

  $onboardingscreens.user_clicks_membership

  assert_true($onboardingscreens.verify_user_is_on_login_page, "User is on the sign-in screen")

end

When(/^the user goes through ios Onboarding screen$/) do


  assert_true($onboardingscreens.verify_user_is_on_onboarding_screen,"User is unable to land on 'Terms & conditions' screen")

  $onboardingscreens.user_accepts_Terms

  sleep 3

  assert_true($onboardingscreens.verify_user_is_on_helpus_screen,"User is unable to land on 'Help us improve' screen")

  $onboardingscreens.user_allows_helpus

end

When(/^user goes through housepay screens$/) do

  assert_true($onboardingscreens.verify_user_is_on_housepay_screen,"User is unable to land on 'Housepay' screen")

  $onboardingscreens.user_clicks_remind_later

  sleep 1

  assert_true($onboardingscreens.verify_sync_with_calendar,"User is unable to land on sync with calendar screen")

  $onboardingscreens.user_continue_without_sync


end


And(/^user enters (.*) email address and changed password$/) do |validity|

  $onboardingscreens.dismiss_invalid_credential

  $onboardingscreens.user_enters_email_changed_password(validity)

  $onboardingscreens = OnboardingScreens.new

  $homescreen = HomeScreen.new

  $whatsonscreen = WhatsonScreen.new

  $accountscreen = AccountScreen.new

  $onboardingscreens.user_clicks_go

end

Given(/^user sees T & C screen$/) do

  sleep 5

  assert_true($onboardingscreens.verify_user_is_on_onboarding_screen,"User is unable to land on 'Terms & conditions' screen")

end

Given(/^user sees Membership screen$/) do

  sleep 2

  assert_true($onboardingscreens.verify_user_is_on_membership_screen,"User is unable to land on 'Membership Screen' screen")

  $onboardingscreens.user_clicks_continue

  sleep 2

  assert_true($onboardingscreens.verify_user_is_on_memberbenifits_screen,"User is unable to land on 'memberbenifits' screen")

  $onboardingscreens.user_clicks_continue

end


When(/^user accepts T & C$/) do

  $onboardingscreens.user_accepts_Terms

end


Then(/^user sees Help us improve screen$/) do

  sleep 3

  assert_true($onboardingscreens.verify_user_is_on_helpus_screen,"User is unable to land on 'Help us improve' screen")


end


When(/^user allows to help us$/) do

  $onboardingscreens.user_allows_helpus

end


Then(/^user sees House rules screen$/) do

  assert_true($onboardingscreens.verify_user_on_house_rules_screen,"User is unable to land on House rules screen")

end


When(/^user accepts House rules$/) do

  $onboardingscreens.user_accepts_house_rules

end


Then(/^user sees my planner screen$/) do

  assert_true($onboardingscreens.verify_user_on_myplanner_screen,"User is unable to land on My planner screen")

end


When(/^user continue without syncing$/) do
  sleep 3

  $onboardingscreens.user_continue_without_sync

end

Then(/^user sees welcome screen$/) do

  sleep 3

  assert_true($onboardingscreens.verify_user_welcome_screen,"User is unable to land on welcome screen")

  $onboardingscreens.user_clicks_next

end


Given(/^user continue from welcome screen$/) do

  sleep 5

  $onboardingscreens.user_continues_from_welcome

end


And(/^user continue from make it personal screen$/) do

  assert_true($onboardingscreens.verify_make_personal_screen,"User is unable to land on Make it personal screen")

  $onboardingscreens.user_continues_from_makePersonal

end


Then("user sees Introducing Noticeboard screen") do

  assert_true($onboardingscreens.verify_Intro_Notice_screen,"User is unable to land on Introducing Noticeboard screen")

end


When("user clicks on continue") do

  sleep 2

  $onboardingscreens.user_clicks_continue

end


Then("user sees Noticeboard screen") do

  assert_true($onboardingscreens.verify_Noticeboard_screen,"User is unable to land on Noticeboard screen")

end


When("user clicks on next") do

  sleep 5

  $onboardingscreens.user_clicks_continue_to_notify_pref

end


Then("user sees Notification preferences screen") do

  assert_true($onboardingscreens.verify_Notification_pref_screen,"User is unable to land on Notification preferences screen")

  $onboardingscreens.user_turnsOn_notifications

  assert_true($onboardingscreens.verify_youareset_screen,"User is unable to land on You're set screen screen")

  $onboardingscreens.user_clicks_next

end


When("user clicks on OK") do

  sleep 2

  $onboardingscreens.user_clicks_OK

end


And("user shown with alert to allow") do

end


Then("user sees You're all set screen") do

  assert_true($onboardingscreens.verify_youareset_screen,"User is unable to land on You're set screen screen")

end


When("user clicks on next on all set screen") do

  $onboardingscreens.user_clicks_next

end

And("user sees the home screen") do

  assert_true($homescreen.verify_username,"Username is not present")

end


And("if user sees House introduction screen") do

  begin

    assert_true($onboardingscreens.verify_house_introduction,"House introduction screen is not present")

  rescue StandardError => e

    puts e.message

  end

end


And("user taps on contact membership team") do

  begin

    assert_true($onboardingscreens.tap_contact_membership_team,"Unable to navigate from contact memebership screen to house rules")

  rescue StandardError => e

    puts e.message

  end

end

And(/^goes through android onboarding screens$/) do

  assert_true($onboardingscreens.verify_make_personal_screen,"User is unable to land on Make it personal screen")

  $onboardingscreens.user_continues_from_makePersonal

  assert_true($onboardingscreens.verify_Intro_Notice_screen,"User is unable to land on Introducing Noticeboard screen")

  $onboardingscreens.user_clicks_continue

  assert_true($onboardingscreens.verify_Noticeboard_screen,"User is unable to land on Noticeboard screen")

  $onboardingscreens.user_clicks_continue_to_notify_pref

  assert_true($onboardingscreens.verify_Notification_pref_screen,"User is unable to land on Notification preferences screen")

  $onboardingscreens.user_clicks_OK

  assert_true($onboardingscreens.verify_youareset_screen,"User is unable to land on You're set screen screen")

end

Then(/^the user signs out and closes the app$/) do

  $homescreen.verify_account_click

  $accountscreen = AccountScreen.new
  $whatsonscreen = WhatsonScreen.new

  assert_true($accountscreen.verify_sign_out, "Unable to see sign out button")

  $accountscreen.tap_sign_out

  $onboardingscreens.close_app

end

And(/^user is shown with a chasing validation message$/) do

  $onboardingscreens.chasing_payment

  assert_true($onboardingscreens.verify_payment_button,"User is unable to see update payment method button")

  $onboardingscreens.update_later_button

  assert_true($homescreen.verify_homescreen,"Username is not present")


end

Then(/^user is shown with frozen validation message$/) do

  assert_true($onboardingscreens.verify_frozen_screen,"User is unable to see frozen screen")

  # $onboardingscreens.contact_membership_team_onboarding
  #
  # assert_true($accountscreen.assert_contact_us)
  #
  # $accountscreen.tap_icon_left

  $accountscreen.tap_signout_onboarding

  assert_true( $onboardingscreens.user_main_screen, "User is not on the main screen")

  $onboardingscreens.close_app

end

Then(/^user is shown with an expired validation message$/) do

  assert_true($onboardingscreens.verify_expired_screen,"User is unable to see expired screen")

  $accountscreen.tap_signout_onboarding

  assert_true( $onboardingscreens.user_main_screen, "User is not on the main screen")

  $onboardingscreens.close_app

end

Then(/^user is shown with a suspended validation message$/) do

  assert_true($onboardingscreens.verify_suspended_screen,"User is unable to see expired screen")

  $accountscreen.tap_signout_onboarding

  assert_true( $onboardingscreens.user_main_screen, "User is not on the main screen")

  $onboardingscreens.close_app

end


Given(/^user verifies his membership card and continues$/) do

  assert_true($onboardingscreens.verify_membership_card,"User is unable to see membership card")

  $onboardingscreens.user_clickson_Continue


end

And(/^user goes through the member benefits and continues$/) do

  assert_true($onboardingscreens.verify_member_benefits,"User is unable to see membership card")

  $onboardingscreens.user_clickson_Continue

end

When(/^the user accepts notifications$/) do

  assert_true($onboardingscreens.verify_Notification_pref_screen,"User is unable to land on Notification preferences screen")

  $onboardingscreens.user_clicks_OK

end

And(/^user is shown with a validation message (.*) for the (.*) account$/) do |message, login|
  $accountscreen=AccountScreen.new

  assert_true($accountscreen.verify_elementDisplayed(message),message+"not displayed")

  if login.include?"chasing"

    $onboardingscreens.update_later_button

    assert_true($homescreen.verify_homescreen,"Username is not present")

  end

end


Then(/^the clicks on signs out and closes the app for (.*)$/) do |login|

  $accountscreen = AccountScreen.new

  $whatsonscreen = WhatsonScreen.new

  if login.include?"chasing"

    $homescreen.verify_account_click
    assert_true($accountscreen.verify_sign_out, "Unable to see sign out button")
    $accountscreen.tap_sign_out
  else
    assert_true($accountscreen.verify_sign_out, "Unable to see sign out button")
    $homescreen.clickElement("Sign out")
    sleep 2
  end

  $onboardingscreens.close_app

end

