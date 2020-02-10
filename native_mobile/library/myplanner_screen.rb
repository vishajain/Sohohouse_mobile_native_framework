require 'rubygems'
require 'appium_lib'
# require 'watir'
require 'selenium-webdriver'
require "test/unit"
require 'yaml'
require_relative '../pageobjects/whatson_objects'
require_relative '../pageobjects/myplanner_objects'
require_relative '../pageobjects/home_objects'


class MyplannerScreen

  include Common

  def initialize()

    if $device == "ios"
      @device_home_objects = Ios_Home_Objects.new($driver, $driver_appium)
      @device_whatson_objects = Ios_Whatson_Objects.new($driver, $driver_appium)
      @device_myplanner_objects = Ios_Myplanner_Objects.new($driver, $driver_appium)

    else
      @device_home_objects = Android_Home_Objects.new($driver, $driver_appium)
      @device_whatson_objects = Android_Whatson_Objects.new($driver, $driver_appium)
      @device_myplanner_objects = Android_Myplanner_Objects.new($driver, $driver_appium)

    end

  end

  def verify_myplanner_title

    return Common.wait_for(20) {@device_myplanner_objects.myplanner_title.displayed?}

  end

  def tap_link (text)

    Common.wait_for(20) {@device_myplanner_objects.text_displayed(text)}.click

  end


  def home_screen_navigate

    Common.wait_for(5){@device_myplanner_objects.homeBtn.click}

    return true

  end


  def verify_text(text)

    return Common.wait_for(20) {@device_myplanner_objects.text_displayed(text).displayed?}

  end

  def verify_events_on_my_planner(event)

    Common.wait_for(10) {$homescreen.verify_myplanner_click}

    if event.include? "My planner member"

      return Common.wait_for(20) {@device_whatson_objects.planner_member_event.displayed?}

    elsif event.include? "My planner gym"

      return Common.wait_for(20) {@device_whatson_objects.planner_gym_event.displayed?}

    end

  end

end

