
require 'rubygems'
require 'cucumber'
require 'selenium-webdriver'
require 'test/unit/assertions'
require_relative '../support/drivers/base_driver'
require_relative '../library/home_screen'
require_relative '../pageobjects/home_objects'
require_relative '../../common/functions_common'

include Test::Unit::Assertions

Given("user is on home screen") do

end

Then("greetings should be visible") do

  sleep 5

    assert_true($homescreen.verify_greetings,"Greetings not present")


end

Then("username is visible") do


    assert_true($homescreen.verify_username,"Username is not present")


end

Then("happening now should be visible") do

    assert_true($homescreen.verify_happening_now,"Happening now section is not present")

end

Then("house notes should be visible") do

    assert_true($homescreen.verify_house_notes,"House Notes section is not present")


end

Then("user taps on see all stories CTA to see house notes screen") do

    assert_true($homescreen.verify_see_all_stories,"See all stories section is not present")

end

Then("noticeboard section is visible") do

    assert_true($homescreen.verify_noticeboard,"Noticeboard section is not present")

end

Then("user taps on View another noticeboard link to see Noticeboards screen") do

    assert_true($homescreen.verify_view_another_noticeboard,"Unable to navigate to View another noticeboard screen")

end


Then("user taps on house perks link to see House perks screen") do

    assert_true($homescreen.verify_house_perks,"Unable to navigate to house perks screen")

end

Then("user taps on browse the houses link to see Browse houses screen") do

    assert_true($homescreen.verify_browse_houses,"Unable to navigate to house perks screen")

end


Then (/^(.*) button should be visible/) do |footer_button|

    assert_true($homescreen.verify_footer_buttons(footer_button),  ""+footer_button+"" +  "is not present" )

end


  Then("HOME button should be seen in menu bar") do

      assert_true($homescreen.verify_home_btn,"Home button not displayed")

  end


  And("WHAT'S ON button should be seen in menu bar") do

      assert_true($homescreen.verify_whats_on_btn,"What's on button not displayed")

  end

  And("MY PLANNER bbutton should be seen in menu bar") do

    assert_true($homescreen.verify_my_planner_btn,"My planner button not displayed")

  end

  And("ACCOUNT button should be seen in menu bar") do

      assert_true($homescreen.verify_account_btn,"Account button not displayed")

  end


