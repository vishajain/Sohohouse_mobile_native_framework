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

  begin

    assert_true($whatsonscreen.verify_whatson_options(button),  ""+button+"" +  "is not present" )

  rescue => e

    puts e.message

  end


end

When("there are multiple events") do

  $whatsonscreen.verify_multiple_events

end

When("the member event is found") do
  $whatsonscreen.events_click("Events")
  $whatsonscreen.find_member_event

end

Then("tap on the member event") do

  $whatsonscreen.find_member_event_click

end


When("member is not on home screen") do

  $whatsonscreen.homescreen_navigate

end

Then("member is navigated to the home screen") do

end