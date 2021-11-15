require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require "test/unit"
require 'yaml'
require_relative '../../common/functions_common'
require_relative '../pageobjects/connect_objects'

class ConnectScreen

  def initialize()

    if $device == "ios"

      @device_onboarding_objects = Ios_Onboarding_Objects.new($driver, $driver_appium)
      @device_home_objects = Ios_Home_Objects.new($driver, $driver_appium)
      @device_connect_objects = Ios_Connect_Objects.new($driver, $driver_appium)
      @device_account_objects = Ios_Account_Objects.new($driver, $driver_appium)


    else

      @device_onboarding_objects = Android_Onboarding_Objects.new($driver, $driver_appium)
      @device_home_objects = Android_Home_Objects.new($driver, $driver_appium)
      @device_connect_objects = Android_Connect_Objects.new($driver, $driver_appium)
      @device_account_objects = Android_Account_Objects.new($driver, $driver_appium)

    end

  end

  def create_post(message,post_house,topic)
    @device_connect_objects.your_post.send_keys(message)
    $device=="ios"?($common_screen.find_element{$common_screen.click_element_with_text("Tag a house")}):()
    $common_screen.find_element{$common_screen.click_element_with_text("Tag a house")}
    $common_screen.wait_for(10){$common_screen.click_element_with_text(post_house.split("->")[0])}
    $common_screen.click_element_with_text(post_house.split("->")[1])
    $common_screen.click_element_with_text("Confirm")
    $common_screen.click_element_with_text("Tag a topic")
    $common_screen.wait_for(10){$common_screen.click_element_with_text(topic)}
    $common_screen.click_element_with_text("Confirm")
    @device_connect_objects.post_button.click
  end

  def verify_post_created
    sleep 10
    assert_true(@device_connect_objects.view_post_house($post_house.split("->")[1]).displayed?,"house")
    assert_true(((@device_connect_objects.view_post_message.text).include?$message),"message")
    title=@device_connect_objects.view_post_title.text
    $device=="android"?(time=@device_connect_objects.view_post_time.text):(sleep 1)
    $device=="ios"?assert_true((title.include?$name+" in "+$topic),"Title not correct"):assert_true((title.include?$name+" posted in "+$topic),"Title not correct")
    $device=="ios"?assert_true((title[-1,1].include? "s"),"Not recently created"):assert_true((time.include? "Now"),"Not recently created")
    $device=="ios"?assert_true((title[-3,2].to_i <60),"not less"):()
    return true
  end

  def apply_filters(house)
    sleep 20
    $common_screen.find_element{@device_connect_objects.refine.click}
    $common_screen.find_element{$common_screen.click_element_with_text(house.split("->")[0])}
    $common_screen.find_element{$common_screen.click_element_with_text(house.split("->")[1])}
    $common_screen.find_element{$common_screen.click_element_with_text("Apply filters")}

  end

  def clickOnPost
    @device_connect_objects.view_post_message.click
    $device=="android"?(@device_connect_objects.view_post_message.click):(sleep 1)
    $common_screen.find_element{$common_screen.verify_element_displayed_with_text("Write your reply")}
  end
  def send_a_reply(message)
    $common_screen.click_element_with_partial_text("Write your reply")
    @device_connect_objects.reply.send_keys(message)
    if @device_connect_objects.reply_button.displayed?
      @device_connect_objects.reply_button.click
    end
    sleep 2
  end

  def verifyLike
    @device_connect_objects.like_icon.displayed?
    @device_connect_objects.like_count.displayed?

  end

  def verifyReply
    $common_screen.find_element{$common_screen.verify_element_displayed_with_partial_text($name+" replied")}
  end
  def delete_current_post
    $common_screen.wait_for(10){@device_connect_objects.delete_button}.click
    $common_screen.find_element{$common_screen.verify_element_displayed_with_text("Delete post")}
    $common_screen.find_element{$common_screen.click_element_with_text("Confirm")}
  end
  def verify_post_deleted
    if $device == "ios"
      sleep 2
      title=@device_connect_objects.view_post_title.text
      (title[-1,1].include? "m")? assert_true((title[-3,2].to_i >2),"post not deleted"):()
      return true
    else
      title=@device_connect_objects.view_post_time.text
      if (title.include? "min")
        (title[2,2].include?"m")?assert_true((title[1,1].to_i >2),"post not deleted"):assert_true((title[1,2].to_i >2),"post not deleted")
      end
    end

  end

  def verify_connect_click
    $common_screen=CommonScreen.new
    $common_screen.navigate_to_tabs("Connect with members")
  end

  def time_slot
    if $device=="ios"
      return @device_connect_objects.booking_time_slot
    end
  end

  def get_text_element
    sleep 5
    return @device_connect_objects.booking_time_slot.text
  end

  def exit_from_live_screen

    begin

      sleep 1

      $device=="ios"?($common_screen.click_element(@device_connect_objects.exit_from_live_window)):(sleep 1)

    rescue

      Common.swipe_top

    end

  end

  def send_message_to_event(messageText)
    sleep 2
    $device=="ios"?(@device_connect_objects.messageBox.send_keys(messageText)):()
  end

  def move_events_to_left(value)
    sleep 3
    Common.swipe_top
    Common.home_panel_swipe(@device_common_objects.element_with_text(value),"left")
    return  true
  end

  def back_to_connect_page

    begin

      sleep 1

      $device=="ios"?($common_screen.click_element(@device_connect_objects.navigate_back_to_connect)):(sleep 1)

    rescue

      Common.swipe_top

    end

  end

  def verify_elements_share_room

    assert_true(@device_connect_objects.switch_camera.displayed?,"Switch Camera not displayed?")
    assert_true(@device_connect_objects.Members.displayed?,"Members not displayed?")
    @device_connect_objects.Members.click
    assert_true($common_screen.verify_element_displayed_with_text("Report this call"),"Report this call not displayed")
    $common_screen.click_element_with_text("WhiteCloseButton")
    assert_true(@device_connect_objects.mute.displayed?,"Mute not displayed?")
    assert_true(@device_connect_objects.disable_video.displayed?,"Disable video not displayed?")

  end

  def verify_open_room_switch(text)

    return $common_screen.wait_for(10){@device_connect_objects.open_room_switch(text)}.displayed?

  end

  def exit_from_chat

    begin

      sleep 1

      $device=="ios"?($common_screen.click_element(@device_connect_objects.exit_from_chat_window)):(sleep 1)

    rescue

      Common.swipe_top

    end

  end

  def move_sections_to_right

    Common.swipe_down
    Common.home_panel_swipe(@device_connect_objects.connect_section,"left")
    return  true

  end

  def post_message_in_group_chat(message)
    $device=="ios"?(@device_connect_objects.post_message.send_keys(message)):(sleep 1)
    sleep 2
    $device=="ios"?($driver.action.move_to(@device_connect_objects.click_send_button).click.perform):(sleep 1)
  end

  def user_click_profile_picture
    $device=="ios"?($driver.action.move_to(@device_connect_objects.profile_picture).click.perform):(sleep 1)
  end

  def click_member_sign_in_button
    $device=="ios"?($driver.action.move_to(@device_connect_objects.member_sign_in_button).click.perform):(sleep 1)
  end

  def click_live_event(event_name)
    $device=="ios"?($driver.action.move_to(@device_connect_objects.live_event(event_name)).click.perform):(sleep 1)
    return  true
  end

  def get_member_name
    return @device_connect_objects.member_name_in_group_chat.text
  end

  def click_join_now
    $device=="ios"?($common_screen.click_element(@device_connect_objects.join_now)):(sleep 1)
  end

  def click_rate_your_experience_button
    $device=="ios"?($common_screen.click_element(@device_connect_objects.rate_your_experience)):(sleep 1)
  end

  def verify_connections
    return $common_screen.wait_for(10){@device_connect_objects.message_button}.displayed?
  end

  def select_the_noticeboard_post
    $device == "ios"?($driver.action.move_to(@device_connect_objects.click_noticeboard_post).click.perform):( sleep 1)
    return true
  end

  def unblock_a_member
    $device=="ios"?(sleep 10;$common_screen.click_element(@device_connect_objects.click_unblock)):(sleep 1 )
    sleep 1
    $device=="ios"?(sleep 10;$common_screen.click_element(@device_connect_objects.click_unblock_on_popup)):(sleep 1 )
  end

  def verify_connection_request
    return $common_screen.wait_for(10){@device_connect_objects.ignore_button}.displayed?
  end

  def new_message_indicator
    return $common_screen.wait_for(10){@device_connect_objects.new_message_dot_indicator}.displayed?
  end

  def click_connection_name
    $device=="ios"?(sleep 10;$common_screen.click_element(@device_connect_objects.connection_name)):(sleep 1)
  end

end