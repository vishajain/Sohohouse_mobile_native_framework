require 'rubygems'
require 'cucumber'
require 'selenium-webdriver'
require 'test/unit/assertions'
require_relative '../support/drivers/base_driver'
require_relative '../library/home_screen'
require_relative '../library/whatson_screen'
require_relative '../pageobjects/whatson_objects'
require_relative '../pageobjects/home_objects'
require_relative '../../common/functions_common'

include Test::Unit::Assertions

When("user clicks on what's on button") do

    sleep 2
    $homescreen.verify_whatson_click
    $whatsonscreen = WhatsonScreen.new

end

Then("user sees what's on screen title") do

    sleep 2

    $whatsonscreen = WhatsonScreen.new

    assert_true($whatsonscreen.verify_whatson_title,"What's on title is not present")

end

Then("user sees what's on filter icon") do

    assert_true($whatsonscreen.verify_whatson_filter,"What's on filter is not present")


end

Then(/^(.*) button is visible/) do |button|

    assert_true($whatsonscreen.verify_whatson_options(button),  ""+button+"" +  "is not present" )

end

When("there are multiple events") do

  $whatsonscreen.verify_multiple_events

end

When(/^the paid (.*) event is found/) do |section|

  # $whatsonscreen.events_click(section)

  $whatsonscreen.find_paid_event(section)

end

When(/^the free (.*) event is found/) do |section|

  # $whatsonscreen.events_click(section)

  $whatsonscreen.find_free_event(section)

end

Then(/^the (.*) section is present/) do |section|

  assert_true($whatsonscreen.verify_member_section(section),"section not present")

end

Given("user sees how many tickets to buy question") do

  assert_true($whatsonscreen.verify_member_section("How many tickets would you like?"),"Tickets question not present")

end

When("user taps on buy tickets on event screen") do

  $whatsonscreen.book_member_event

end

When("user taps on invite guests on event screen") do

  $whatsonscreen.invite_guests_click

end

When("user taps on book tickets on event screen") do

  $whatsonscreen.book_free_member_event

end

When("user taps on book gym tickets on event screen") do

  $whatsonscreen.book_free_gym_event

end

And("user sees confirm payment screen") do

  assert_true($whatsonscreen.verify_member_section("Confirm payment"),"Confirm payment screen not displayed")

end

And("user taps on buy tickets on confirm payment screen") do

    $whatsonscreen.buy_tickets_click

end


Then("user sees you are on the guest list screen") do

  assert_true($whatsonscreen.verify_you_on_guest_list("YOU'RE ON THE GUEST LIST"),"You are on the guest list screen not shown")

end

Then("user taps on OK button") do

  $whatsonscreen.ok_btn_click

end


Then("user sees the event booking status as you are on the guest list on event details screen") do

  assert_true($whatsonscreen.verify_guest_list_status_on_event_screen,"You are on the guest list status is not shown on the event details screen")

end


Then("user cancels the event booking") do

  assert_true($whatsonscreen.verify_cancel_booking, "Unable to cancel the booking")

end

Then("user navigates back to the events list") do

  $whatsonscreen.navigate_to_events_list

end

Given(/^user sees the (.*) tab/) do |section|

  assert_true($whatsonscreen.scroll_to_top(section), "Unable to find the screenings tab")

end

And(/^tap on (.*) tab/) do |section|

  $whatsonscreen.events_click(section)

end

And("user sees confirm deposit screen") do

  assert_true($whatsonscreen.verify_member_section("Confirm deposit"),"Confirm deposit screen not displayed")

end

And("user taps on Confirm deposit on confirm deposit screen") do

  $whatsonscreen.confirm_deposit_click

end

When("user taps on buy tickets on screening event screen") do

  $whatsonscreen.book_screening_event

end

When("user taps on buy tickets on gym event screen") do

  $whatsonscreen.book_gym_event

end

Then("user sees Guest 1 on you are on the guest list screen") do

  assert_true($whatsonscreen.verify_content("Guest 1"),"Guest 1 not shown")

end

Then("user sees Guest 1 under Guests up to section") do

  assert_true($whatsonscreen.verify_content("Guest 1"),"Guest 1 not shown")

end

Then("user sees the event booking status as you and 1 guest going on event details screen") do

  assert_true($whatsonscreen.verify_content("YOU AND 1 GUEST(S) ARE GOING"),"You and 1 guests going status not shown")

end

When("user cancels Guest 1 booking") do

  $whatsonscreen.cancel_guest_booking

end

Then("Guest 1 booking should be cancelled") do

  assert_true($whatsonscreen.verify_guest_list_status_on_event_screen,"You are on the guest list status is not shown on the event details screen")

end


When("user taps on the filter") do

  $whatsonscreen.filter_click

end

And("user selects Soho House Berlin house") do

  $whatsonscreen.soho_berlien_click

end

Then("user should see the events of Soho House Berlin only") do

  assert_true($whatsonscreen.results_check, "Filter not working as expected")

end