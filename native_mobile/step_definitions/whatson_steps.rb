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

When("the member event is found") do

  $whatsonscreen.events_click("Events")

  $whatsonscreen.find_member_event

end


Then(/^the (.*) section is present/) do |section|

  assert_true($whatsonscreen.verify_member_section(section),"section not present")

end

Then("the Date and time setion is present") do

  assert_true($whatsonscreen.verify_member_section("Date and time"),"section not present")

end

Given("user sees how many tickets to buy question") do

  assert_true($whatsonscreen.verify_member_section("How many tickets would you like?"),"Tickets question not present")

end

When("user taps on buy tickets") do

  $whatsonscreen.book_member_event

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

When("member is not on home screen") do

  Common.homescreen_navigate

end

Then("member is navigated to the home screen") do

end