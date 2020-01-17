require 'rubygems'
require 'cucumber'
require 'selenium-webdriver'
require 'test/unit/assertions'
require_relative '../support/drivers/base_driver'
require_relative '../library/login_screen'
require_relative '../library/onboarding_screens'
require_relative '../pageobjects/login_objects'
require_relative '../../common/functions_common'

include Test::Unit::Assertions

Given(/^user sees T & C screen$/) do

    sleep 5

    assert_true($onboardingscreens.verify_user_is_on_onboarding_screen,"User is unable to land on 'Terms & conditions' screen")

end


When(/^user accepts T & C$/) do

  assert_true($onboardingscreens.user_accepts_Terms, "T & C not clicked")

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

  assert_true($onboardingscreens.verify_user_welcome_screen,"User is unable to land on welcome screen")

end


When(/^user continue from welcome screen$/) do

  $onboardingscreens.user_continues_from_welcome

end


Then(/^user sees make it personal screen$/) do

  assert_true($onboardingscreens.verify_make_personal_screen,"User is unable to land on Make it personal screen")

end


When(/^user selects the favourite houses$/) do

end


And(/^user continue from make it personal screen$/) do

  sleep 3

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

Then("user sees the home screen") do

  assert_true($homescreen.verify_username,"Username is not present")

end