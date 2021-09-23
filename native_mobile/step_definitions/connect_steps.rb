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
  $common_screen.wait_for(15){$common_screen.click_element_with_text("Write a post")}
  $device=="ios"?$common_screen.verify_element_displayed_with_text("New post"):$common_screen.verify_element_displayed_with_text("Post")
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

Then(/^I navigate to blockedMembers screen$/) do
  Common.swipe_down
  $common_screen.click_element_with_text("My connections")
  $common_screen.click_element_with_text("ellipse")
  $common_screen.click_element_with_text("Blocked members")
end

And(/^I verify the title of blocked members screen$/) do
  assert_true($common_screen.wait_for(10){$common_screen.verify_element_displayed_with_text("Blocked members")},"User is not on Blocked members screen")
  $connect_screen.back_to_connect_page
  $connect_screen.back_to_connect_page
end
And(/^I click on Share your room$/) do
  $common_screen.click_element_with_text("Share your room")
end

And(/^I navigate to room by clicking on open room$/) do |table|
  $common_screen.click_element_with_text("Open Room")
  data = table.hashes

  data.each do |row|

    row.each do |value|

      assert_true($connect_screen.verify_open_room_switch(value[1]),value[1]+" not displayed")

    end

  end

  $common_screen.click_element_with_text("Continue")
end

And(/^I verified I am in a room$/) do
  assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_text("Waiting for others to join…")},"Room is not displayed")
  $connect_screen.verify_elements_share_room
end

And(/^I come out of the room$/) do
  $common_screen.click_element_with_text("Leave call")
  $common_screen.click_element_with_text("Yes, leave chat")
end
Then(/^I verify all the sections under connect$/) do |table|
  data = table.hashes
  data.each do |row|
    row.each do |key,value|
      if $device == "ios"
        if key.eql?"Section"
            assert_true($common_screen.find_element{$common_screen.click_element_with_text(value)},value+" is not clicked")
        elsif key.eql?"Title"
          assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_text(value)},value+" is not displayed")
          2.times{$connect_screen.back_to_connect_page}
        end
      end
    end
  end
end

And(/^I verify the sections under set up your account panel$/) do |table|
  data = table.hashes
  data.each do |row|
    row.each do |key,value|
        if key.eql?"Section"

          (value.eql?"Complete your profile")?(assert_true($connect_screen.move_sections_to_right,value+" not displayed")):()

            assert_true($common_screen.find_element{$common_screen.click_element_with_text(value)},value+" is not clicked")

        elsif key.eql?"Title"

          assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_text(value)},value+" is not displayed")

          if value.eql?"Let's chat"

            $connect_screen.exit_from_chat

          end

          $connect_screen.back_to_connect_page
      end
    end
  end
end


Then(/^I verify connect sections$/) do |table|
  $common_screen.swipe_down
  data = table.hashes
  data.each do |row|
    row.each do |key,value|
      sleep 2
      if key.eql?"Section"
        assert_true($common_screen.find_element{$common_screen.click_element_with_text(value)},value+" is not clicked")
      elsif key.eql?"Title"
        assert_true($common_screen.wait_for(10){$common_screen.verify_element_displayed_with_text(value)}," is not displayed")
        $connect_screen.back_to_connect_page
      end
    end
  end

end

Then(/^I navigate to "([^"]*)" and selected "([^"]*)" and blocked a "([^"]*)"$/) do |section, post, member|
  assert_true($common_screen.find_element{$common_screen.click_element_with_text(section)},section+" is not clicked")
  sleep 2
  assert_true($common_screen.find_element{$common_screen.click_element_with_text(post)},post+" is not clicked")
  assert_true($common_screen.find_element{$common_screen.click_element_with_partial_text(member)},member+" is not clicked")
  assert_true($common_screen.find_element{$common_screen.click_element_with_text("ellipse")},"ellipse is not clicked")
  assert_true($common_screen.find_element{$common_screen.click_element_with_text("Block member")},"Block member is not clicked")
=begin
  assert_true($common_screen.wait_for(10){$common_screen.verify_element_displayed_with_text("Unblock")},"Unblock is not displayed")
=end
  $common_screen.swipe_top
  $connect_screen.back_to_connect_page
end

And(/^user post a "([^"]*)" in group chat under "([^"]*)"$/) do |message_text, live_event|
  2.times{$common_screen.swipe_down}
  assert_true($common_screen.wait_for(10){$connect_screen.click_live_event(live_event)},live_event+" is not clicked")
  $connect_screen.post_message_in_group_chat(message_text)
  3.times{$common_screen.swipe_top}
  assert_true($common_screen.wait_for(10){$common_screen.click_element_with_text("Confirm")},"Confirm is not clicked")
  assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_text("Would you like to connect with these members?")},"Would you like to connect with these members? not displayed")
  assert_true($common_screen.wait_for(10){$common_screen.click_element_with_text("Skip")},"Skip is not clicked")
  $connect_screen.back_to_connect_page
end

When(/^I verify the username under the message and open profile by clicking profile picture in "([^"]*)"$/) do |live_event|
  2.times{$common_screen.swipe_down}
  assert_true($common_screen.wait_for(30){$connect_screen.click_live_event(live_event)},live_event+" is not clicked")
  sleep 1
  $memberName = $connect_screen.get_member_name
  assert_true($memberName.eql?($scenario.getContext("name")),"name verification failed")
  $connect_screen.user_click_profile_picture
  sleep 1
  2.times{$common_screen.swipe_top}
  assert_true($common_screen.wait_for(10){$common_screen.click_element_with_text("Confirm")},"Confirm is not clicked")
  assert_true($common_screen.wait_for(10){$common_screen.click_element_with_text("Skip")},"Skip is not clicked")
  $connect_screen.back_to_connect_page
end

And(/^user clicks on Member Sign in button$/) do
  $connect_screen.click_member_sign_in_button
end

And(/^user captures the username under account screen$/) do

  config     = {props: YAML.load_file(File.join(File.dirname(__FILE__), '../../config/testdata.yml'))}

  email      = config[:props]["data"]["test-connect"]

  config     = {props: YAML.load_file(File.join(File.dirname(__FILE__), '../../config/environments.yml'))}

  $name = config[:props]["env"][$env][email]["name"]

  $scenario.setContext("name",$name)


end
Then(/^I verify the "([^"]*)" is displayed on the screen$/) do |live_event|
  assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_text("Live Rooms")},"Live Rooms not displayed")
  assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_text("See all")},"See all link not displayed")
  assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_text("LIVE NOW")},"LIVE NOW link not displayed")
  $connect_screen.click_live_event(live_event)
  assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_text(live_event)},live_event+ " is not displayed")
end

And(/^I verify myConnections and block Member functionality$/) do
  $common_screen.swipe_down
  assert_true($common_screen.click_element_with_text("My connections"),"My connections is not clicked")
  assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_text("My connections")},"My connections is not clicked")
  assert_true($common_screen.click_element_with_text("Requests"),"Requests is not clicked")
  $connect_screen.verify_connection_request
  sleep 1
  $common_screen.click_element_with_text("ellipse")
  $common_screen.click_element_with_text("Blocked members")
  assert_true($common_screen.wait_for(10){$common_screen.verify_element_displayed_with_text("Blocked members")},"User is not on Blocked members screen")
  $connect_screen.unblock_a_member
  $common_screen.click_element_with_text("Unblock")
  $connect_screen.back_to_connect_page
  $connect_screen.back_to_connect_page
end

And(/^I verify Call history details$/) do
  $common_screen.swipe_down
  assert_true($common_screen.find_element{$common_screen.click_element_with_text("Call history")},"Call history is not clicked")
  assert_true($common_screen.wait_for(20){$common_screen.verify_element_displayed_with_text("Rate your Connect experience")},"Rate your Connect experience is not displayed")
  sleep 2
  $connect_screen.click_rate_your_experience_button
  assert_true($common_screen.verify_element_displayed_with_text("The experience was..."),"The experience was... is not displayed")
  assert_true($common_screen.verify_element_displayed_with_text("I rated the experience that way because..."),"I rated the experience that way because... is not displayed")
  $common_screen.little_swipe_down
  assert_true($common_screen.verify_element_displayed_with_text("We connected over..."),"We connected over... is not displayed")
  assert_true($common_screen.find_element{$common_screen.click_element_with_text("Skip this for now")},"Skip this for now button is not clicked")
  $connect_screen.back_to_connect_page
end
