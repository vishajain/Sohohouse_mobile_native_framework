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
    $device=="ios"?$common_screen.swipeByLocation(50,150,50,$dimensions_height-10):Common.hideKeyboard
    $common_screen.find_element{$common_screen.click_element_with_text("Tag a house")}
    $common_screen.click_element_with_text(post_house.split("->")[0])
    $common_screen.click_element_with_text(post_house.split("->")[1])
    $common_screen.click_element_with_text("Confirm")
    $common_screen.click_element_with_text("Tag a topic")
    $common_screen.click_element_with_text(topic)
    $common_screen.click_element_with_text("Confirm")
    @device_connect_objects.post_button.click
  end

  def verify_post_created
    sleep 5
    assert_true(@device_connect_objects.view_post_house($post_house.split("->")[1]).displayed?,"house")
    assert_true(((@device_connect_objects.view_post_message.text).include?$message),"message")
    title=@device_connect_objects.view_post_title.text
    $device=="android"?(time=@device_connect_objects.view_post_time.text):(sleep 1)
    $device=="ios"?assert_true((title.include?$name+" in "+$topic),"Title not correct"):assert_true((title.include?$name+" posted in "+$topic),"Title not correct")
    $device=="ios"?assert_true((title[-1,1].include? "s"),"Not recently created"):assert_true((time.include? "Now"),"Not recently created")
    $device=="ios"?assert_true((title[-3,2].to_i <60),"not less"):(sleep 1)
    return true
  end

  def apply_filters(house)
    sleep 5
    $common_screen.find_element{@device_connect_objects.refine.click}
    $common_screen.find_element{$common_screen.click_element_with_text(house.split("->")[0])}
    $common_screen.find_element{$common_screen.click_element_with_text(house.split("->")[1])}
    $common_screen.find_element{$common_screen.click_element_with_text("Apply filters")}
    sleep 20

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
    @device_connect_objects.delete_button.click
    $common_screen.find_element{$common_screen.verify_element_displayed_with_text("Delete post")}
    $common_screen.find_element{$common_screen.click_element_with_text("Confirm")}
  end
  def verify_post_deleted
    if $device == "ios"
      sleep 2
      title=@device_connect_objects.view_post_title.text
      (title[-1,1].include? "m")? assert_true((title[-3,2].to_i >2),"post not deleted 1"): assert_true((title[-3,2].to_i >1),"post not deleted 2")
      return true
    else
      title=@device_connect_objects.view_post_time.text
      if (title.include? "min")
        (title[2,2].include?"m")?assert_true((title[1,1].to_i >2),"post not deleted 1"):assert_true((title[1,2].to_i >2),"post not deleted 2")
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

  def go_back

    begin

      sleep 1

      $device=="ios"?($common_screen.click_element(@device_connect_objects.back_to_previous_page)):(sleep 1)

    rescue

      Common.swipe_top

    end

  end

  def click_live_event(event_name)
    $device=="ios"?($common_screen.click_element(@device_connect_objects.live_event(event_name))):(sleep 1)
  end
  
  def post_message_in_group_chat(message)
  $device=="ios"?(@device_connect_objects.post_message.send_keys(message)):(sleep 1)
  sleep 2
  $device=="ios"?($driver.action.move_to(@device_connect_objects.click_send_button).click.perform):(sleep 1)

  end

  def click_join_now
    $device=="ios"?($common_screen.click_element(@device_connect_objects.join_now)):(sleep 1)
  end

  def move_back_to_connect_page
    puts ":::abcd::"
    $device == "ios"?($driver.action.move_to(@device_connect_objects.back_to_connect).click.perform):( sleep 1)
    return  true
  end

end