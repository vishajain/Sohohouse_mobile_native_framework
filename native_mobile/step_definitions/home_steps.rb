
require 'rubygems'
require 'cucumber'
require 'selenium-webdriver'
require 'test/unit/assertions'
require_relative '../support/drivers/base_driver'
require_relative '../library/home_screen'
require_relative '../library/account_screen'
require_relative '../pageobjects/home_objects'
require_relative '../pageobjects/onboarding_objects'
require_relative '../../common/functions_common'
require_relative '../../common/scenarios_contexts'

include Test::Unit::Assertions


When("I tap on blackslate to view the blackslate screen") do

  $homescreen.verify_blackslate_screen

  $homescreen = HomeScreen.new

end


Then("I verify the houseboard screen") do

  sleep 2

  assert_true($homescreen.verify_house_name,"House name not shown on the houseboard screen")

end

Then("greetings should be visible") do
  #assert_true($homescreen.verify_greetings,"Greetings not present")
  assert_true($common_screen.verify_element_displayed_with_text("Visit a House"),"not home")
end

Then("username is visible") do

    sleep 5

    $device == "ios"?assert_true($common_screen.verify_element_displayed_with_text("Share profile"),"Home page not displayed"): assert_true($homescreen.verify_username,"Username is not present")

end

Then("happening now should be visible") do

  begin
    assert_true($homescreen.verify_happening_now,"Happening now section is not present")
  rescue
    puts "Happening now section is not present"
    $happeningNow = "Happening now not present"
  end

end



Then (/^(.*) button should be visible/) do |footer_button|

    assert_true($homescreen.verify_footer_buttons(footer_button),  ""+footer_button+"" +  "is not present" )

end


When("I tap on Post") do

  assert_true($common_screen.find_element{$common_screen.click_element_with_text("View posts")},"View posts is not displayed")
  assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_text("Write a post")},"Write a post is not displayed")
  $homescreen.go_back_to_home

end


And("go back to the home screen") do

  $homescreen.go_back_to_home_screen

end

When("user navigates back to the home screen") do

  $homescreen.user_navigate_to_home_screen

end


And(/^I see the post button on the home screen$/) do

  $common_screen=CommonScreen.new

  assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_text("View posts")},"View posts not displayed")

end

Then(/^user resets the favourite houses$/) do

  $homescreen.verify_account_click

  $accountscreen.tap_favourite_houses

  $accountscreen.tap_reset

  $accountscreen.tap_save_changes

end

And(/^user sees all the sections on home screen$/) do |table|
  sleep 10
  data = table.hashes
  data.each do |row|
    row.each do |value|
      assert_true($homescreen.verify_elementDisplayed(value[1].to_s),value[1].to_s+" not displayed")
    end
  end
end

And(/^user verifies all sections of 'What can we help you with'$/) do |table|
  data = table.hashes
  data.each do |row|
    row.each do |key,value|
      if key.eql?"Section"
        loop do
          if ($common_screen.verify_element_displayed_with_text(value,10))
            sleep 1
          else
            assert_true($homescreen.move_sections_to_left,value+" not displayed")
          end
            assert_true($common_screen.find_element{$common_screen.click_element_with_text(value)},value+" is not clicked")
          break
        end
      elsif key.eql?"Links"
        assert_true($common_screen.wait_for(10){$common_screen.verify_element_displayed_with_text(value)},value+" is not displayed")
        sleep 1
        if $device == "ios"
          if ($common_screen.verify_element_displayed_with_text("fab"))
            $accountscreen.home_screen_navigation
          else
            $homescreen.navigate_back_to_home
          end
        else
          $homescreen.go_Back
        end
      end
    end
  end
  if $device == "ios"
    2.times{$homescreen.create_aroom_carosal_move_right}
    sleep 1
    $common_screen.swipeByLocation(50,$dimensions_height*0.60,50,$dimensions_height*0.80)
  end
end

Then(/^the user scrolls to the top$/) do
  assert_true($homescreen.scrollTillUsername,"Username not visible")
end

When(/^user sees the sections and subheading$/) do |table|
  $accountscreen=AccountScreen.new
  data = table.hashes
  data.each do |row|
    row.each do |key,value|
      if key.include?"Section" or key.include?"Title"
        assert_true($accountscreen.verify_elementDisplayed(value))
      else
        assert_true($homescreen.select_setUpYourApp(value),"Element not available")
      end
    end
    $homescreen.go_Back
  end
  $homescreen.scrollTillUsername
end

And(/^user should see the button in menu bar$/) do |table|
  i=5
  textValue=nil
  linkValue=nil
  data = table.hashes
  data.each do |row|
    row.each do |key,value|
      if key.include?"assertion"
        textValue=value
      else
        linkValue=value
      end
    end
    assert_true($homescreen.verifyTabNavigations(linkValue,textValue), "Element not displayed")
    i=i-1
  end
end

Then(/^user cancels the event booking of (.*)$/) do |event_name|

  assert_true($homescreen.cancel_booking,"Event not cancelled")
end



When(/^user selects a favourite house$/) do
  $homescreen.verify_account_click

  $accountscreen = AccountScreen.new

  $whatsonscreen = WhatsonScreen.new

  $homescreen = HomeScreen.new

  $accountscreen.tap_favourite_houses

  $accountscreen.tap_reset

  $device=="android"?$common_screen.click_element_with_partial_text("UK"):()

  $accountscreen.select_76_dean_house

  $accountscreen.tap_save_changes

  assert_true($accountscreen.home_screen_navigation,"Unable to navigate to home screen")

  sleep 5

end

And(/^user books the ticket for (.*) and verifies the booking status$/) do |event_type|

  assert_true($homescreen.bookForEvent,"Booking not done")

end

When(/^the user verifies (.*) on home screen$/) do |event_name|
  if $happeningNow != "Happening now not present"

    $scenario.setContext("event",event_name)

    $homescreen.tap_carousel(event_name)

    assert_true($homescreen.verify_user_navigation(event_name),"Posts count is not incremented")

  else

    skip_this_scenario

  end
end

And(/^I verify the link under blackslate$/) do |table|
  $common_screen=CommonScreen.new

  $accountscreen= AccountScreen.new

  sleep 3

  data = table.hashes

  data.each do |row|

    row.each do |key,value|

      sleep 2

      if key.eql?"Link"

        assert_true($common_screen.find_element{$common_screen.click_element_with_text(value)},value+" is not clicked")

      elsif key.eql?"Title"
        (value.eql?"House")?(sleep 10):(sleep 1)
        assert_true($common_screen.verify_element_displayed_with_text(value),value+" is not displayed")

      end

    end
    sleep 2
    $accountscreen.navigate_back_to_account

  end
end

Then(/^I close the houseboard screen$/) do
  assert_true($homescreen.home_screen_navigate,"Unable to navigate to home screen")
end

And(/^I click on the ([^"]*)$/) do |text|

  $common_screen =CommonScreen.new

  $common_screen.click_element_with_text(text)

end

Then(/^I navigate to noticebord on Home screen$/) do
  $homescreen.go_back_to_home
end

And(/^I navigate to connect screen$/) do
  $common_screen=CommonScreen.new
  $common_screen.navigate_to_tabs("Connect")
  $common_screen.click_element_with_text("Noticeboard")

end

Then(/^I navigate to ([^"]*) page$/) do |arg|
  $common_screen=CommonScreen.new
  $common_screen.navigate_to_tabs(arg)
=begin
  $common_screen.swipe_top
=end
end