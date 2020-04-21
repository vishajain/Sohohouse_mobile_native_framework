
require 'rubygems'
require 'cucumber'
require 'selenium-webdriver'
require 'test/unit/assertions'
require_relative '../support/drivers/base_driver'
require_relative '../library/home_screen'
require_relative '../library/account_screen'
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

  begin
    assert_true($homescreen.verify_happening_now,"Happening now section is not present")
  rescue
    puts "Happening now section is not present"
    $happeningNow = "Happening now not present"
  end

end

Then("house notes should be visible") do

    assert_true($homescreen.verify_house_notes,"House Notes section is not present")

end

Then("user taps on see all stories CTA to see house notes screen") do

    assert_true($homescreen.verify_see_all_stories,"See all stories section is not present")

end

And("noticeboard section is visible") do

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

Given("the house is open") do

      assert_true($homescreen.verify_house_open,"House is not open")

end


When("the user taps on Post") do

  $homescreen.post_click

end

And("user is be navigated to the noticeboard screen") do

  assert_true($homescreen.verify_noticeboard_title,"Notice board title is not shown")

  assert_true($homescreen.verify_noticeboard,"House name is not shown")

  $homescreen.ios_back

end

And("user sees the house name") do

  assert_true($homescreen.verify_noticeboard,"House name is not shown")

end


When("user inputs the text") do

  $homescreen.input_text

end


Then("user sees the post on the home screen") do

  assert_true($homescreen.verify_post_created,"Post created is not shown on the home screen")

end

And("user inputs the text to amend") do

  $homescreen.post_click

  $homescreen.amend_text

  $homescreen.post_click


end

Then("user sees the post amended on the home screen") do

  assert_true($homescreen.verify_post_button,"Post button is not visible")

  assert_true($homescreen.verify_noticeboard,"Noticeboard section is not present")

  Common.swipe_down

  assert_true($homescreen.verify_post_amended,"Post Amended is not shown on the home screen")

end


When("user taps on delete post") do

  $homescreen.post_click

  $homescreen.tap_delete_post

end

Then("user sees the post deleted from the home screen") do

  assert_true($homescreen.verify_post_button,"Post button is not visible")

  assert_true($homescreen.verify_noticeboard,"Noticeboard section is not present")

  Common.swipe_down

  assert_true($homescreen.verify_post_deleted,"Post is not deleted")

end


But("user taps on view another noticeboard") do

  $homescreen.tap_view_another_noticeboard

end

When("the user taps on Soho house Berlin") do

  $homescreen.tap_soho_house_berlin

  assert_true($homescreen.verify_soho_berlin_noticeboard, "Unable to navigate to soho house berlin noticeboard")

end

Then("user sees Soho house berlin noticeboard") do

  assert_true($homescreen.verify_soho_berlin_noticeboard, "Unable to navigate to soho house berlin noticeboard")

end

Then("user sees the post on the noticeboard screen") do

  assert_true($homescreen.verify_create_post_another_noticeboard, "Post not created on another noticeboard")

end

Then("user sees the post amended on the noticeboard screen") do

  assert_true($homescreen.verify_post_amended_another_noticeboard,"Post Amended is not shown on another noticeboard")

  assert_true($homescreen.verify_create_post_another_noticeboard, "Post not created on another noticeboard")


end

Then("user sees the post deleted on the noticeboard screen") do

  $homescreen.post_click

  $homescreen.tap_delete_post

  assert_true($homescreen.verify_post_deleted_another_noticeboard,"Post is not deleted on another noticeboard")

  $homescreen.go_back_to_home_screen

end

And("go back to the home screen") do

  $homescreen.go_back_to_home_screen

end



Then("user sees the posts count incremented by one") do

  assert_true($homescreen.verify_posts_count,"Posts count is not incremented")

  $homescreen.tap_modal_close

end

And("user closes the modal screen") do

  $homescreen.tap_modal_close

end

When(/^user taps on (.*) carousel/) do |event_name|

  if $happeningNow != "Happening now not present"

     $homescreen.tap_carousel(event_name)

  else

    skip_this_scenario

  end


end

Then(/^user navigates to (.*) details screen/) do |event_name|

  if $happeningNow != "Happening now not present"

     assert_true($homescreen.verify_user_navigation(event_name),"Posts count is not incremented")

  else

    skip_this_scenario

  end

end


Then("user books the event") do

  assert_true($homescreen.verify_book_event,"Unable to book to the event")

end

When("user navigates back to the home screen") do

  $homescreen.user_navigate_to_home_screen

end


And(/^user sees all the sections on home screen$/) do

  assert_true($homescreen.verify_greetings,"Greetings not present")

  assert_true($homescreen.verify_username,"Username is not present")

  begin
    assert_true($homescreen.verify_happening_now,"Happening now section is not present")
  rescue
    puts "Happening now section is not present"
    $happeningNow = "Happening now not present"
  end

  assert_true($homescreen.verify_pastdigital_events, "Digital events are not present on home screen")


  assert_true($homescreen.verify_house_notes,"House Notes section is not present")

  assert_true($homescreen.verify_perks_homescreen,"Perks section is not present on home screen")

  assert_true($homescreen.verify_our_houses,"Our Houses is not present")

end

And(/^the user sees post button on the home screen$/) do

  assert_true($homescreen.verify_post_button,"Post button is not visible")

  assert_true($homescreen.verify_noticeboard,"Noticeboard section is not present")

end

And(/^the user enters a new post$/) do

  $homescreen.input_text

  $homescreen.post_click

end

And(/^the user enters a new post on another notice board$/) do

  $homescreen.post_click

  $homescreen.input_text

  $homescreen.post_click

  assert_true($homescreen.verify_create_post_another_noticeboard, "Post not created on another noticeboard")

  $homescreen.post_click

  $homescreen.amend_text

  $homescreen.post_click

end