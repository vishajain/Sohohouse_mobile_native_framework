require 'rubygems'
require 'cucumber'
require 'selenium-webdriver'
require 'test/unit/assertions'
require_relative '../support/drivers/base_driver'
require_relative '../library/home_screen'
require_relative '../library/account_screen'
require_relative '../pageobjects/home_objects'
require_relative '../pageobjects/account_objects'
require_relative '../../common/functions_common'

include Test::Unit::Assertions


When("user clicks on Account button on home screen") do

    sleep 2

    $homescreen.verify_account_click

    $accountscreen = AccountScreen.new

end


Then("user sees and taps on view profile link") do

    sleep 2

    $whatsonscreen = WhatsonScreen.new

    assert_true($accountscreen.verify_account_title,"Unable to tap on View profile link")

end


Then("user sees and taps on your membership link") do

    sleep 2

    assert_true($accountscreen.verify_your_membership,"Unable to tap on your membership link")

end


Then("user sees and taps on perks link") do

    sleep 2

    assert_true($accountscreen.verify_perks,"Unable to tap on perks link")

end


Then("user sees and taps on payment link") do

    sleep 2

    assert_true($accountscreen.verify_payment,"Unable to tap on Payment link")

end


Then("user sees and taps on past bookings link") do

    sleep 2

    assert_true($accountscreen.verify_past_bookings,"Unable to tap on Past bookings link")

end


 Then("user sees and taps on change password link") do

    sleep 4

    assert_true($accountscreen.verify_change_password,"Unable to tap on change password link")

end


Then("user sees and taps on favourite houses link") do

    sleep 2

    assert_true($accountscreen.verify_favourite_houses,"Unable to tap on favourite houses link")

end


Then("user sees and taps on notification preferences link") do

    sleep 2

    assert_true($accountscreen.verify_notification_preferences,"Unable to tap on Notification preferences link")


end


Then("user sees and taps on sync calendar link") do

    sleep 2

    assert_true($accountscreen.verify_sync_calendar,"Unable to tap on Sync calendar link")


end


Then("user sees and taps on contact us link") do

    sleep 2

    assert_true($accountscreen.verify_contact_us,"Unable to tap on Contact us link")


end


Then("user sees and taps on faq link") do

    sleep 2

    assert_true($accountscreen.verify_faq,"Unable to tap on FAQ link")

end


Then("user sees and taps on policies link") do

    sleep 2

    assert_true($accountscreen.verify_policies,"Unable to tap on Policies link")


end