
require 'rubygems'
require 'appium_lib'
# require 'watir'
require 'selenium-webdriver'
require "test/unit"
require 'yaml'
require_relative '../common/common_objects'
require_relative '../common/functions_common'

class CommonScreen

  def initialize()

    if $device == "ios"
      @device_common_objects = Ios_Common_Objects.new($driver, $driver_appium)

    else
      @device_common_objects = Android_Common_Objects.new($driver, $driver_appium)

    end

  end

  def fiveSecondsTimeout
    return 5
  end

  def twoSecondsTimeout
    return 2
  end

  def threeSecondsTimeout
    return 3
  end

  def twentySecondsTimeout
    return 20
  end

  def timeOut
    return browser.config.waitForTimeout
  end

  def sevenSecondsTimeout
    return 7
  end

  def find_element
    i=0

    loop do

      begin

        yield

        return true

      rescue

        self.swipe_down

        sleep 2

        i=i+1

        if i>7

          return false

        end

      end

    end

  end

  def click_element_with_text(element_text)

    @device_common_objects.element_with_text(element_text).click

    return  true

  end

  def verify_element_displayed_with_text(element_text)

    begin

      return Common.wait_for(twentySecondsTimeout) { @device_common_objects.element_with_text(element_text) }.displayed?

    rescue

      return false

    end

  end

  def click_element(webelement)

    Common.wait_for(twoSecondsTimeout){webelement}.click

    return true

  end

  def verify_element_displayed(webelement)

    return Common.wait_for(threeSecondsTimeout) { webelement }.displayed?

  end


  def little_swipe_down
    begin
      sleep 1
      if $device == "ios"
        $action.press({:x => ($dimensions_width*0.5), :y => ($dimensions_height*0.5)}).wait(200).move_to({:x => ($dimensions_width*0.5), :y => ($dimensions_height*0.3)}).release.perform
      else
        Appium::TouchAction.new.swipe(start_y: 1340, end_y: 950).perform
      end
      sleep 1
    rescue StandardError => msg
      puts msg.message
    end

  end
  def swipe_down
    begin
      sleep 1
      if $device == "ios"
        $action.press({:x => ($dimensions_width*0.5), :y => ($dimensions_height*0.6)}).wait(300).move_to({:x => ($dimensions_width*0.5), :y => ($dimensions_height*0.3)}).release.perform
      else
        Appium::TouchAction.new.swipe(start_y: 1340, end_y: 350).perform
      end
      sleep 1
    rescue StandardError => msg
      puts msg.message
    end

  end

end


