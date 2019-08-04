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

Given(/^user clicks on go button and sees T & C screen$/) do

  sleep 5

  begin

    assert_true($onboardingscreens.verify_user_is_on_onboarding_screen,"User is unable to land on 'Terms & conditions' screen")

  rescue => e

    puts e.inspect

    Common.scenario_failed

  end

end

Then(/^user accepts T & C$/) do

  $onboardingscreens.user_accepts_Terms

end

Given(/^user accepts T & C and sees Help us improve screen$/) do

  sleep 3

  begin

  assert_true($onboardingscreens.verify_user_is_on_helpus_screen,"User is unable to land on 'Help us improve' screen")

  rescue => e

    puts e.inspect

    Common.print_scenario_failed
    Common.scenario_failed

  end

end

Then(/^user allows to help us$/) do

  $onboardingscreens.user_allows_helpus

end


Given(/^user allows help improve and sees House rules screen$/) do

  sleep 3

  begin

  assert_true($onboardingscreens.verify_user_on_house_rules_screen,"User is unable to land on House rules screen")

  rescue => e

    puts e.inspect

    Common.scenario_failed

  end

end


Then(/^user accepts House rules$/) do

  $onboardingscreens.user_accepts_house_rules

end


Given(/^user accepts House rules and sees my planner screen$/) do

  begin

  assert_true($onboardingscreens.verify_user_on_myplanner_screen,"User is unable to land on My planner screen")

  rescue => e

    puts e.inspect

    Common.scenario_failed

  end

end

Then(/^user continue without syncing$/) do

  $onboardingscreens.user_continue_without_sync

end

Given(/^user continue without syncing and sees welcome screen$/) do

  begin

  assert_true($onboardingscreens.verify_user_welcome_screen,"User is unable to land on welcome screen")

  rescue => e

    puts e.inspect

    Common.scenario_failed

  end

end

Then(/^user continue from welcome screen$/) do

  $onboardingscreens.user_continues_from_welcome

end

Given(/^user continues from welcome screen and sees make it personal screen$/) do

  sleep 3

  begin

  assert_true($onboardingscreens.verify_make_personal_screen,"User is unable to land on Make it personal screen")

  rescue => e

    puts e.inspect

    Common.scenario_failed

  end

end

Then(/^user selects the favourite houses$/) do

end


And(/^user continue from make it personal screen$/) do

  $onboardingscreens.user_continues_from_makePersonal

end

Given("user continues from make it personal and sees Introducing Noticeboard screen") do

  begin

  assert_true($onboardingscreens.verify_Intro_Notice_screen,"User is unable to land on Introducing Noticeboard screen")

  rescue => e

    puts e.inspect

    Common.scenario_failed

  end

end

Then("user clicks on continue") do

  $onboardingscreens.user_continues_from_IntroNotice

end

Given("user continues from Notice intro and sees Noticeboard screen") do

  begin

  assert_true($onboardingscreens.verify_Noticeboard_screen,"User is unable to land on Noticeboard screen")

  rescue => e

    puts e.inspect

    Common.scenario_failed

  end

end

Then("user clicks on next") do

  $onboardingscreens.user_clicks_next

end

Given("user continues from Noticeboard and sees Notification preferences screen") do

  begin

  assert_true($onboardingscreens.verify_Notification_pref_screen,"User is unable to land on Notification preferences screen")

  rescue => e

    puts e.inspect

    Common.scenario_failed

  end

end

Then("user clicks on OK") do

  $onboardingscreens.user_clicks_OK

end

And("user shown with alert to allow") do

end

Given("user continues from Notification preferences and sees You're all set screen") do

  begin

  assert_true($onboardingscreens.verify_youareset_screen,"User is unable to land on You're set screen screen")

  rescue => e

    puts e.inspect

    Common.scenario_failed

  end

end