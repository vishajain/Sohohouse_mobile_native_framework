require 'rubygems'
require 'cucumber'
require 'selenium-webdriver'
require 'test/unit/assertions'
require_relative '../support/drivers/base_driver'
require_relative '../library/home_screen'
require_relative '../library/whatson_screen'
require_relative '../library/account_screen'
require_relative '../library/connect_screen'
require_relative '../pageobjects/home_objects'
require_relative '../pageobjects/account_objects'
require_relative '../pageobjects/whatson_objects'
require_relative '../../common/functions_common'

include Test::Unit::Assertions

Given("I write a post") do |table|

  data = table.hashes

  data.each do |row|

    row.each do |key,value|

      (key.eql?"Message")?$message=value:((key.eql?"House")?$post_house=value:$topic=value)

    end
  end
  $common_screen=CommonScreen.new
  $common_screen.find_element{$common_screen.click_element_with_text("Write a post")}
  $common_screen.verify_element_displayed_with_text("New post")
  $connect_screen=ConnectScreen.new
  $connect_screen.create_post($message,$post_house,$topic)
end

Then("I see the post on the noticeboard screen") do
  $connect_screen.apply_filters($post_house)
   assert_true($connect_screen.verify_post_created,"Post created is not shown on the home screen")

end

And(/^I select a post and like the post$/) do
  if $device=="ios"
    $accountscreen=AccountScreen.new
    $connect_screen.clickOnPost
    $common_screen.click_element_with_text("Like")
    $accountscreen.navigate_back_to_account
  end

end

And(/^I reply to the post$/) do
  $accountscreen=AccountScreen.new
  $connect_screen.clickOnPost
  $connect_screen.send_a_reply("How do you do")
  $accountscreen.navigate_back_to_account

end

And(/^I verify post is liked and replied$/) do
  sleep 2
  $connect_screen.clickOnPost
  $device=="ios"?($connect_screen.verifyLike):(sleep 1)
  $connect_screen.verifyReply
  $accountscreen.navigate_back_to_account
end

And(/^I delete the post$/) do
  $connect_screen.delete_current_post

end

And(/^I verify post is deleted$/) do
  $connect_screen.verify_post_deleted
end

And(/^I verify the title on connect screen$/) do |table|

  data = table.hashes
  data.each do |row|
    row.each do |key,value|
      sleep 2
      if $device == "ios"
        if key.eql?"Title"
          assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_text(value)},value+" is not displayed")
        end
      end
    end
  end
end

Then(/^I click on Join the Conversation and schedule the call$/) do |table|
  $common_screen.click_element_with_text("Join a conversation")
  data = table.hashes
  data.each do |row|
    row.each do |key,value|
      sleep 2
      if $device == "ios"
        if key.eql?"Interests"
          assert_true($common_screen.find_element{$common_screen.click_element_with_text(value)},value+" is not clicked")
          $common_screen.click_element_with_text("Next")
          sleep 5
          $common_screen.click_element($connect_screen.time_slot)
          selectedTimeSlot = $connect_screen.get_text_element
          puts "selectedTimeSlot: "+selectedTimeSlot
          sleep 2
          $common_screen.click_element_with_text("Book")
        end
      end
    end
  end
end

And(/^I confirm call is scheduled$/) do
  assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_text("Your video call is scheduled")},"Pop up is not displayed")
  $common_screen.click_element_with_text("Done")
  assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_text("Booked")},"Booked button is not displayed")
end

And(/^I cancelled the scheduled call$/) do
  $common_screen.click_element_with_text("Booked")
  $common_screen.click_element_with_text("Cancel video call")
  $common_screen.click_element_with_text("Confirm cancellation")
end

When(/^I verify liveStreamed Rooms heading and events available on the screen$/) do
  assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_text("Live Rooms")},"Live Rooms not displayed")
  assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_text("See all")},"See all link not displayed")
end

Then(/^I verify the Live event$/) do |table|
  data = table.hashes
  data.each do |row|
    row.each do |key,value|
      if key.eql?"Live stream event"
        assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_text("LIVE NOW")},"LIVE NOW link not displayed")
        assert_true($common_screen.find_element{$common_screen.click_element_with_text(value)},value+" is not clicked")
        assert_true($common_screen.find_element{$common_screen.click_element_with_text(value)},value+" is not clicked")
        assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_text("Vimeo")},"video is not displayed")
        $connect_screen.exit_from_live_screen
        $homescreen.navigate_back_to_home
      end
    end
  end
end

And(/^I verify posting message$/) do |table|
  data = table.hashes
  data.each do |row|
    row.each do |key,value|
      if key.eql?"Live stream event"
        assert_true($common_screen.find_element{$common_screen.click_element_with_text(value)},value+" is not clicked")
        assert_true($common_screen.find_element{$common_screen.click_element_with_partial_text(value)},value+" is not clicked")
        assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_text("Vimeo")},"video is not displayed")
        $connect_screen=ConnectScreen.new
        $connect_screen.send_message_to_event("Check in to the live stream event")
        assert_true($common_screen.find_element{$common_screen.click_element_with_text("Send")},"Send is not clicked")
      end
      $connect_screen.exit_from_live_screen
      $homescreen.navigate_back_to_home
    end
  end
end

And(/^I verify the non Live event$/) do |table|
  data = table.hashes
  data.each do |row|
    row.each do |key,value|
      if key.eql?"Live stream event"
        if !($common_screen.verify_element_displayed_with_text(value))
          sleep 4
          assert_true($common_screen.find_element{$connect_screen.move_events_to_left(value)},value+" not displayed")
        end
          assert_true($common_screen.find_element{$common_screen.click_element_with_text(value)},value+" is not clicked")
          assert_true($common_screen.find_element{$common_screen.click_element_with_text("Notify me before it starts")},+"Notify me before it starts is not clicked")
          assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_text("You're all set")},"title is not displayed")
          assert_true($common_screen.find_element{$common_screen.click_element_with_text("Done")},+"Notify me before it starts is not clicked")
          assert_true($common_screen.find_element{$common_screen.click_element_with_text("Cancel reminder")}," Cancel reminder is not clicked")
          $homescreen = HomeScreen.new
          $homescreen.navigate_back_to_home
      end
    end
  end
end