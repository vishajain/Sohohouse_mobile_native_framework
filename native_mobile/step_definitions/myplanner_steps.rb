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

  begin
    sleep 2
    $homescreen.verify_myplanner_click
    $myplannerscreen = MyplannerScreen.new

  rescue => e

    puts e.inspect

    Common.scenario_failed_and_noquit

  end

end

Then("user sees my planner screen title") do
  Common.swipe_top
    sleep 2
    $myplannerscreen = MyplannerScreen.new
    $whatsonscreen = WhatsonScreen.new
    $myplannerscreen.myplanner_navigate
    assert_true($myplannerscreen.verify_myplanner_title,"My planner title is not present")


end

Then("Events section is present") do

    sleep 2

    assert_true($myplannerscreen.verify_events_section,"Events section is not present")

end


When("Events list is present") do

    assert_true($myplannerscreen.verify_events_list,"Events list is not present")

end



Then("user taps on the first event to navigate to event details screen") do

    assert_true($myplannerscreen.verify_events_list_click,"Unable to validate / navigate the events list")


end

When("no Event bookings are present") do

    assert_true($myplannerscreen.verify_no_events_list,"Unable to validate if no event bookings are present")

end


Then("user taps on the explore events button to navigate to What's on screen") do

    assert_true($myplannerscreen.verify_no_events_list_click,"Unable to explore events button")


end

Then("Screenings section is present") do

    assert_true($myplannerscreen.verify_screenings_section,"Screenings section is not present")

end


Then("user taps on the first screening event to navigate to event details screen") do

    assert_true($myplannerscreen.verify_screenings_list_click,"Screening event bookings not present")

end


When("no screening event bookings are present") do

    assert_true($myplannerscreen.verify_no_screenings_list,"Unable to validate if no event bookings are present")

end

Then("user taps on the explore screenings button to navigate to What's on screen") do

    assert_true($myplannerscreen.verify_no_screenings_list_click,"Unable to find explore events button as the screening events are present")

end

Then("Classes section is present") do

  Common.swipe_down

    assert_true($myplannerscreen.verify_classes_section,"Classes section is not present")

end

Then("user taps on the first Gym class event to navigate to event details screen") do

    assert_true($myplannerscreen.verify_classes_list_click,"Gym classes event bookings not present")

end

When("no gym event bookings are present") do

    assert_true($myplannerscreen.verify_no_classes_list,"Gym event bookings are present")

end

Then("user taps on the Explore gym classes button to navigate to What's on screen") do

    assert_true($myplannerscreen.verify_no_classes_list_click,"Unable to find Explore gym events button as the screening events are present")


end

  Then("stay section is present") do

    Common.swipe_down

      assert_true($myplannerscreen.verify_stay_section,"Stay section is not present")

  end


Then("member clicks on view bedroom bookings link and navigate back to my planner") do

      assert_true($myplannerscreen.verify_view_bedroom_bookings,"Unable to click on View bedroom bookings link")

  end
