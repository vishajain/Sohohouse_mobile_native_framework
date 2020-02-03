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


Then("user see and taps on view profile link") do

    sleep 2

    $whatsonscreen = WhatsonScreen.new

    assert_true($accountscreen.verify_account_title,"Unable to tap on View profile link")

end


Then("user see and taps on your membership link") do

    sleep 2

    begin
    assert_true($accountscreen.verify_your_membership,"Unable to tap on your membership link")
    rescue StandardError => msg
        puts msg.message
        raise
    end


end


Then("user see and taps on perks link") do

    sleep 2

    assert_true($accountscreen.verify_perks,"Unable to tap on perks link")

end


Then("user see and taps on payment link") do

    sleep 2

    assert_true($accountscreen.verify_payment,"Unable to tap on Payment link")

end


Then("user see and taps on past bookings link") do

    sleep 2

    assert_true($accountscreen.verify_past_bookings,"Unable to tap on Past bookings link")

end


 Then("user see and taps on change password link") do

    sleep 4

    assert_true($accountscreen.verify_change_password,"Unable to tap on change password link")

end


Then("user see and taps on favourite houses link") do

    sleep 2

    assert_true($accountscreen.verify_favourite_houses,"Unable to tap on favourite houses link")

end


Then("user see and taps on notification preferences link") do

    sleep 2

    assert_true($accountscreen.verify_notification_preferences,"Unable to tap on Notification preferences link")


end


Then("user see and taps on sync calendar link") do

    sleep 2

    assert_true($accountscreen.verify_sync_calendar,"Unable to tap on Sync calendar link")


end


Then("user see and taps on contact us link") do

    sleep 2

    assert_true($accountscreen.verify_contact_us,"Unable to tap on Contact us link")


end


Then("user see and taps on faq link") do

    sleep 2

    assert_true($accountscreen.verify_faq,"Unable to tap on FAQ link")

end


Then("user see and taps on policies link") do

    sleep 2

    assert_true($accountscreen.verify_policies,"Unable to tap on Policies link")


end

Then("member is not on home screen from account screen") do

    assert_true($accountscreen.home_screen_navigate,"Unable to navigate to home screen")

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

When("user provides current password") do

    $accountscreen.provide_current_password

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

end

And("user selects Shoreditch house") do

    $accountscreen.select_shoreditch_house

end

Then("user sees 40 Greek Street under favourite houses list") do

    assert_true($accountscreen.verify_40_greek_st_displayed, "Favourite houses reset is not working")

end

Then("user sees Shoreditch house under favourite houses list") do

    assert_true($accountscreen.verify_shoreditch_displayed, "Favourite houses reset is not working")

end

Given("user taps on notification preferences") do

    $accountscreen.tap_notification_preferences

end

When(/^unselect (.*) push notification preference$/) do |link|

    $accountscreen.tap_notification_pref_switch_off(link)

end

Then(/^(.*) push notification preference is switched off$/) do |link|

    assert_true($accountscreen.verify_notification_pref_switch_value(link,"0"), "Notification pref value is not unset")

end

When(/^select (.*) push notification preference$/) do |link|

    $accountscreen.tap_notification_pref_switch_on(link)

end

Then(/^(.*) push notification preference is switched on$/) do |link|

    assert_true($accountscreen.verify_notification_pref_switch_value(link,"1"), "Notification pref value is still unset")

end


Given("user taps on Contact us form") do

    $accountscreen.tap_contact_us

end

When(/^user provides enquiry type as (.*)$/) do |input|

    $accountscreen.select_enquiry_type(input)

end

When(/^user provides enquiry topic as (.*)$/) do |input|

    $accountscreen.select_enquiry_topic(input)

end


When(/^user provides enquiry message as (.*)$/) do |input|

    $accountscreen.input_message(input)

end

Then("user submits the enquiry") do

    $accountscreen.tap_submit

end

