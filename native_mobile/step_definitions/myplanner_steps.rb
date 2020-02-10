require 'rubygems'
require 'cucumber'
require 'selenium-webdriver'
require 'test/unit/assertions'
require_relative '../support/drivers/base_driver'
require_relative '../library/home_screen'
require_relative '../library/whatson_screen'
require_relative '../library/myplanner_screen'
require_relative '../pageobjects/home_objects'
require_relative '../../common/functions_common'

include Test::Unit::Assertions

When("user clicks on my planner button") do
    sleep 2
    $homescreen.verify_myplanner_click
    $myplannerscreen = MyplannerScreen.new

end

Then("user sees my planner screen title") do

    sleep 2
    $whatsonscreen = WhatsonScreen.new
    $accountscreen = AccountScreen.new
    # $myplannerscreen.myplanner_navigate
    assert_true($myplannerscreen.verify_myplanner_title,"My planner title is not present")

end

When(/^user taps the (.*) tab/) do |text|

  $myplannerscreen.tap_link(text)

end

Then(/^user sees the (.*) description/) do |text|

  assert_true($myplannerscreen.verify_text(text),"My planner title is not present")

end


Then(/^user sees the (.*) event booking in the my planner/) do |event|

  assert_true($myplannerscreen.verify_events_on_my_planner(event),"Unable to see the event")

end

Then("user navigates back to the home screen from my planner") do

  assert_true($myplannerscreen.home_screen_navigate,"Unable to navigate to home screen")

end