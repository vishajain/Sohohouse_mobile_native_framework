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

  $accountscreen = AccountScreen.new

  $whatsonscreen = WhatsonScreen.new

  $homescreen = HomeScreen.new

  $homescreen.verify_account_click

end


Then(/^the amended fields should be shown on users profile screen$/) do

  assert_true( $accountscreen.verify_profession_value,"Profession value is not saved ")

  assert_true( $accountscreen.verify_city_value,"City value is not saved ")

  assert_true( $accountscreen.verify_about_me_value,"About me value on is not saved ")

  assert_true( $accountscreen.verify_lets_chat_value,"Lets chat value is not saved ")

  assert_true( $accountscreen.verify_interests_values, "Interests values are not saved properly")

  assert_true( $accountscreen.verify_website,"Website is not saved ")

  assert_true( $accountscreen.verify_instagram,"Instagram is not saved ")

  assert_true( $accountscreen.verify_twitter,"Twitter is not saved ")

  assert_true( $accountscreen.verify_linkedin,"Linkedin is not saved ")

  assert_true( $accountscreen.verify_spotify,"Spotify is not saved ")

  assert_true( $accountscreen.verify_youtube,"Youtube is not saved ")

  $homescreen.account_back

  $accountscreen.verify_sign_out

  assert_true($accountscreen.tap_sign_out, "Unable to sign out the user")

  $onboardingscreens.close_app

end

When(/^the user edits their profession$/) do

  $accountscreen.tap_View_Profile

  $accountscreen.tap_edit_link

  assert_true($accountscreen.verify_edit_profile_screen_title,"Unable to land on Edit profile screen")

  $accountscreen.user_enters_profession_value

end

And(/^the user provides industry and city value$/) do

  $accountscreen.user_enters_industry_value

  $accountscreen.user_enters_city_value

end

And(/^the user inputs about me and interests values$/) do

  $accountscreen.user_enters_about_me_value

  $accountscreen.user_enters_lets_chat_value

  $accountscreen.user_enters_interests_value


end

And(/^the user inputs connect social accounts values$/) do

  $accountscreen.tap_social_accounts

  $accountscreen.user_enters_website_value

  $accountscreen.user_enters_instagram_value

  $accountscreen.user_enters_twitter_value

  $accountscreen.user_enters_linkedin_value

  $accountscreen.user_enters_spotify_value

  $accountscreen.user_enters_youtube_value

  $accountscreen.user_taps_done

  $accountscreen.tap_save_changes

end

Then("user see and taps on perks link") do

    sleep 2

    assert_true($accountscreen.verify_perks,"Unable to tap on perks link")

end

Then("user see and taps on past bookings link") do

    sleep 2

    assert_true($accountscreen.verify_past_bookings,"Unable to tap on Past bookings link")

end

Then("user navigates to next tab") do

  begin

    assert_true($accountscreen.verify_sync_calendar,"Unable to navigate to the right screen")

  rescue StandardError => e

    puts e.message

  end

end

Then("member is not on home screen from account screen") do

    # assert_true($accountscreen.home_screen_navigate,"Unable to navigate to home screen")
    # home_screen_navigation
        assert_true($accountscreen.home_screen_navigation,"Unable to navigate to home screen")

end

When("user sees and taps on perks") do

    assert_true($accountscreen.tap_perks,"Unable to tap on perks link")

end

Then("user sees perk title") do

    assert_true($accountscreen.verify_perks_title,"Perks title not present")

end

Then("user sees perk location") do

    assert_true($accountscreen.verify_perks_location,"Perks location not present")

end

When("user taps on the first perk on perks list") do

    assert_true($accountscreen.tap_first_perk,"Unable to tap on the first perk")

end

Then("user sees perk image on perk screen") do

    assert_true($accountscreen.verify_perk_content_image,"Perk image not present")

end

Then("user sees perk location on perk screen") do

    assert_true($accountscreen.verify_perk_content_location,"Perk location not present")

end

Then("user sees perk title on perk screen") do

    assert_true($accountscreen.verify_perk_content_title,"Perk title not present")

end

Then("user sees perk description on perk screen") do

    assert_true($accountscreen.verify_perk_content_desc,"Perk image not present")

end

Then("user goes back to the account screen") do

    $accountscreen.tap_icon_left

    # $accountscreen.iconLeft

end

Given("user taps on change password") do

    $accountscreen.tap_change_password

end

When("user updates password") do

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

And("user selects Shoreditch house") do

    $accountscreen.select_shoreditch_house

end

And("user selects little house mayfair") do

  $accountscreen.select_lhm_house

end

Then("user sees 40 Greek Street under favourite houses list") do

    assert_true($accountscreen.verify_40_greek_st_displayed, "Favourite houses reset is not working")

    $accountscreen.tap_save_changes

end

Then("user sees Shoreditch house under favourite houses list") do

    assert_true($accountscreen.verify_shoreditch_displayed, "Favourite houses reset is not working")

end

Given("user taps on settings") do

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


When(/^the user adds a new favourite house$/) do

    assert_true($accountscreen.favourite_houses_shown,"Unable to see favourite houses link")

    $accountscreen.tap_favourite_houses

    assert_true($accountscreen.verify_local_house_displayed, "Favourite houses reset is not working")

    $accountscreen.select_40_greek_street

    $accountscreen.tap_save_changes
end

Then(/^the added house is shown on favourite houses list$/) do

    assert_true($accountscreen.favourite_houses_shown,"Unable to see favourite houses link")

    $accountscreen.tap_favourite_houses

    assert_true($accountscreen.verify_40_greek_st_displayed, "Favourite houses is not saved")

    $accountscreen.select_40_greek_street

    $accountscreen.tap_save_changes

    assert_true($accountscreen.favourite_houses_shown,"Unable to see favourite houses link")

    $accountscreen.tap_favourite_houses

    assert_true($accountscreen.verify_local_house_displayed, "Favourite houses reset is not working")

    $accountscreen.tap_save_changes

    $accountscreen.home_screen_navigation

    # assert_true($accountscreen.tap_sign_out, "Unable to sign out the user")
    #
    # $onboardingscreens.close_app
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

And(/^user navigates to change password$/) do

    sleep 2

    assert_true($accountscreen.change_password_tab,"Unable is not navigated to the right screen")

end


When(/^user reverts password$/) do

    assert_true($accountscreen.verify_current_password,"current password is not visible")

    $accountscreen.provide_changed_password

    $accountscreen.provide_orignal_new_password

    $accountscreen.provide_orignal_confirm_password

    $accountscreen.tap_save_btn

    $accountscreen.dismiss_dialog

      #$accountscreen.tap_icon_left

      #$accountscreen.home_screen_navigation

end


And(/^the user selects a favourite house for carousel$/) do

  $homescreen.verify_account_click

  $accountscreen = AccountScreen.new

  $whatsonscreen = WhatsonScreen.new

  $homescreen = HomeScreen.new

  $accountscreen.tap_favourite_houses

  $accountscreen.select_lhm_house

  $accountscreen.tap_save_changes

  assert_true($accountscreen.home_screen_navigation,"Unable to navigate to home screen")

  sleep 5

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

And(/^user navigates to change password screen$/) do

  sleep 2

  assert_true($accountscreen.change_password_tab_android,"Unable is not navigated to the right screen")

end

When(/^user provides the Name$/) do

  assert_true($accountscreen.enter_Name,"Unable to enter Name")

end

And(/^user provides the email$/) do

  assert_true($accountscreen.enter_mail_id,"Unable to enter Mail id")

end

And(/^user clicks on confirm$/) do

  assert_true($accountscreen.checks_confirm,"Unable to check on confirm")

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

  if $device == "ios"
    $common_screen.little_swipe_down
  end

  sleep 3

  data = table.hashes

    data.each do |row|

    row.each do |key,value|

      sleep 2

      if key.eql?"Link"

        assert_true($common_screen.find_element{$common_screen.click_element_with_text(value)},value+" is not clicked")

      elsif key.eql?"Title"

        assert_true($common_screen.verify_element_displayed_with_text(value),value+" is not displayed")

      end

    end

    $accountscreen.navigate_back_to_account

  end

  end