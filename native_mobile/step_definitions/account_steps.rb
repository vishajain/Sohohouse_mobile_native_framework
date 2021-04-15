require 'rubygems'
require 'cucumber'
require 'selenium-webdriver'
require 'test/unit/assertions'
require_relative '../support/drivers/base_driver'
require_relative '../library/home_screen'
require_relative '../library/whatson_screen'
require_relative '../library/account_screen'
require_relative '../pageobjects/home_objects'
require_relative '../pageobjects/account_objects'
require_relative '../../common/functions_common'

include Test::Unit::Assertions


Given("I click on Account button on home screen") do

  sleep 2

  $accountscreen = AccountScreen.new

  $whatsonscreen = WhatsonScreen.new

  $homescreen = HomeScreen.new

  $homescreen.verify_account_click

end

When(/^I verify the profile screen title$/) do

  $common_screen=CommonScreen.new

  $accountscreen.tap_View_Profile

  $accountscreen.tap_edit_link

  assert_true($accountscreen.verify_edit_profile_screen_title,"Unable to land on Edit profile screen")

end

Then(/^I navigate to ([^"]*) tab$/) do |text|

  begin

    assert_true($accountscreen.verify_setting_tab(text),"Unable to navigate to the right screen")

  rescue StandardError => e

    puts e.message

  end

end

Then("member is not on home screen from account screen") do

  assert_true($accountscreen.home_screen_navigation,"Unable to navigate to home screen")

end

Then("user goes back to the account screen") do

    $accountscreen.tap_icon_left

end

Given("user taps on change password") do

    $accountscreen.tap_change_password

end

When("I update the password") do

    assert_true($accountscreen.verify_current_password,"current password is not visible")

    $accountscreen.provide_current_password

    $accountscreen.provide_new_password

    $accountscreen.provide_confirm_password

    $accountscreen.tap_save_btn

    $accountscreen.dismiss_dialog
end

And("user provides new password") do

   $accountscreen.provide_new_password

end

And("user provides confirm password") do

    $accountscreen.provide_confirm_password

end

And("user taps on Save button") do

    $accountscreen.tap_save_btn

end

Then("the new password is saved") do

    assert_true($accountscreen.verify_password_saved,"New password is not saved")

end

When("user provides changed password in current password") do

    $accountscreen.provide_changed_password

end

And("user provides original password in new password") do

    $accountscreen.provide_orignal_new_password

end

And("user provides original password in confirm password") do

    $accountscreen.provide_orignal_confirm_password

end

Then("user sign-off from the account") do

    assert_true($accountscreen.tap_sign_out, "Unable to sign out the user")

end

When("user taps on favourite houses") do

    $accountscreen.tap_favourite_houses

end

When("user taps on Reset") do

    $accountscreen.tap_reset

end

And("tap on Save changes") do

    $accountscreen.tap_save_changes

end

Then("user see only the local house in the favourite houses list") do

   assert_true($accountscreen.verify_local_house_displayed, "Favourite houses reset is not working")

end

And("user selects 40 Greek Street") do

    $accountscreen.select_40_greek_street

    $accountscreen.tap_save_changes

end

Given("I tap on settings") do

    assert_true($accountscreen.verify_settings, "Settings link is not displayed")

    $accountscreen.tap_settings

end

Given("I tap on Contact us form") do

    $accountscreen.tap_contact_us

end

When(/^I provides (.*) as (.*)$/) do |type,input|

  $accountscreen.select_type_topic(type,input)

end

When(/^I enter enquiry message as (.*)$/) do |input|

    $accountscreen.input_message(input)

end

Then("I submits the enquiry") do

    $accountscreen.tap_submit

end

Then(/^I navigate back and sign out of the app$/) do

  $accountscreen.tap_icon_left

  assert_true($accountscreen.tap_sign_out, "Unable to sign out the user")

  $onboardingscreens.close_app

end

When(/^the user taps on sync and verifies the popup message$/) do

    $accountscreen.tap_sync

    assert_true($accountscreen.verify_subscribe, "Unable to see subscribe to calendar message")

end

When(/^I revert the password$/) do

    assert_true($accountscreen.verify_current_password,"current password is not visible")

    $accountscreen.provide_changed_password

    $accountscreen.provide_orignal_new_password

    $accountscreen.provide_orignal_confirm_password

    $accountscreen.tap_save_btn

    $accountscreen.dismiss_dialog

end

And(/^user goes back to the home screen$/) do

  $homescreen.go_back_to_home_screen

  assert_true($homescreen.verify_greetings,"Greetings not present")

  $homescreen.event_swipe("right")

end

Given(/^When the user accepts notifications$/) do

  assert_true($onboardingscreens.verify_Notification_pref_screen,"User is unable to land on Notification preferences screen")

  $onboardingscreens.user_clicks_OK

end

Then(/^I navigate to confirmation screen$/) do

  assert_true($accountscreen.verify_confirmation_message,"Unable to view confirmation message")

end

And(/^verify push notifications preference for connect is displayed$/) do |table|
  data = table.hashes
  data.each do |row|
    row.each do |value|
      assert_true($accountscreen.verify_elementDisplayed(value[1].to_s), "Element not displayed")
    end
  end
end

When(/^the user adds below favourite houses and clicks save button$/) do |table|

  assert_true($accountscreen.favourite_houses_shown, "Unable to see favourite houses link")

  $accountscreen.tap_favourite_houses

  assert_true($accountscreen.verify_local_house_displayed, "Favourite houses reset is not working")

  data = table.hashes
  data.each do |row|
    row.each do |value|
      $accountscreen.select_favourite_locations(value[1].to_s)
    end
  end

  $accountscreen.tap_save_changes

  assert_true($accountscreen.favourite_houses_shown, "Unable to see favourite houses link")

  $accountscreen.tap_favourite_houses

end


Then(/^I verify "([^"]*)" is displayed$/) do |value|


  assert_true($accountscreen.favourite_location_displayed(value), "Unable to view  message")

  $accountscreen.select_favourite_locations(value)

  $accountscreen.tap_save_changes

  assert_true($accountscreen.favourite_houses_shown, "Unable to see favourite houses link")

  $accountscreen.tap_favourite_houses

  assert_true($accountscreen.verify_local_house_displayed, "Favourite houses reset is not working")

  $accountscreen.tap_save_changes

end

Then(/^the user navigates back$/) do

  $accountscreen.tap_icon_left

end

And(/^verify the toggle functionality$/) do |table|

  data = table.hashes
  data.each do |row|
    row.each do |value|
      $accountscreen.verifytoggle(value[1].to_s)
    end
  end

end

And(/^I verify all the links under account$/) do |table|

  $common_screen=CommonScreen.new

  sleep 3

  data = table.hashes

    data.each do |row|

    row.each do |key,value|

      sleep 2

      if key.eql?"Link"

        if $device == "ios"
          $common_screen.little_swipe_down
        end

        assert_true($common_screen.find_element{$common_screen.click_element_with_text(value)},value+" is not clicked")

      elsif key.eql?"Title"

        sleep 2

        assert_true($common_screen.verify_element_displayed_with_text(value),value+" is not displayed")

      end

    end

    $accountscreen.navigate_back_to_account

  end

  end

And(/^I verify edit profile links$/) do |table|

  $common_screen=CommonScreen.new

  $device=="ios"?$common_screen.swipeByLocation(50,100,50,70):$common_screen.swipeByLocation(50,200,50,10)

  config = {props: YAML.load_file(File.join(File.dirname(__FILE__), '../../config/testdata.yml'))}

  link=nil

  data = table.hashes

  data.each do |row|

    row.each do |key,value|

      sleep 1

      if key.eql?"Link"

        link=value

        $accountscreen.clickEditProfileLink(value)

      elsif key.eql?"Value"

        data = config[:props]["data"]["profile"]["profile1"][value]

        assert_true($accountscreen.getEditProfileText(link,data),value+" is not displayed")

        end

    end

  end

end

And(/^I verify the social account link$/) do |table|

  $accountscreen.tap_social_accounts

  sleep 1

  config = {props: YAML.load_file(File.join(File.dirname(__FILE__), '../../config/testdata.yml'))}

  data = table.hashes

  data.each do |row|

    row.each do |value|

      text = config[:props]["data"]["profile"]["profile1"][value[1].to_s.downcase]

      $accountscreen.clickSocial(value[1].to_s,text)

    end

  end

  $accountscreen.click_done

  $accountscreen.tap_save_changes
end

And(/^I verify the updated fields$/) do |table|
  sleep 2

  $common_screen=CommonScreen.new

  data = table.hashes

  data.each do |row|

    row.each do |value|

      assert_true($accountscreen.verifyLinks(value[1].to_s),value[1].to_s+" value Not displayed")
    end

  end

  $accountscreen.navigate_back_to_account

end

