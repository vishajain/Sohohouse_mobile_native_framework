
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

  def oneSecondsTimeout
    return 1
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
  def fortySecondsTimeout
    return 40
  end

  def timeOut
    return browser.config.waitForTimeout
  end

  def sevenSecondsTimeout
    return 7
  end


  def wait_for(seconds)
    Selenium::WebDriver::Wait.new(:timeout => seconds).until {yield}
  end

  def find_element
    i=0

    loop do

      begin

        yield

        return true

      rescue

        self.little_swipe_down

        sleep 2

        i=i+1

        if i>7

          return false

        end

      end

    end

  end

  def click_element_with_text(element_text)

    $device == "ios"?($driver.action.move_to(@device_common_objects.element_with_text(element_text)).click.perform):( wait_for(fiveSecondsTimeout){@device_common_objects.element_with_text(element_text)}.click)
    return  true

  end

  def click_button_with_text(element_text)

    wait_for(fiveSecondsTimeout){@device_common_objects.button_with_text(element_text)}.click

    return  true

  end

  def click_element_with_partial_text(element_text)

    wait_for(twentySecondsTimeout){@device_common_objects.element_with_partial_text(element_text)}.click

    return  true

  end

  def verify_element_displayed_with_text(element_text,timeout=fortySecondsTimeout)

    begin

      return Common.wait_for(timeout) { @device_common_objects.element_with_text(element_text) }.displayed?

    rescue

      return false

    end

  end

  def verify_element_displayed_with_text_tm(element_text,timeout)

    begin

      return Common.wait_for(timeout) { @device_common_objects.element_with_text(element_text) }.displayed?

    rescue

      return false

    end
    end


    def verify_element_displayed_with_partial_text(element_text)

    begin

      return Common.wait_for(twentySecondsTimeout) { @device_common_objects.element_with_partial_text(element_text) }.displayed?

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

  def swipe_top()
    begin
      if $device == "ios"
        $action.press({:x => ($dimensions_width*0.5), :y => ($dimensions_height*0.4)}).wait(100).move_to({:x => ($dimensions_width*0.5), :y => ($dimensions_height*0.8)}).release.perform
        sleep 1
      else
        Appium::TouchAction.new.swipe(start_y: 600, end_y: 1550).perform
      end
    rescue StandardError => msg
      puts msg.message
    end
  end

  def navigate_to_tabs(tab)
    sleep 1
    if $device=="ios"
      wait_for(10){@device_common_objects.tab_icon.displayed?}
      sleep 1
      @device_common_objects.tab_icon.click
    end
    sleep 1
    case tab

    when "Home"
      ($device=="ios")?(wait_for(twentySecondsTimeout){@device_common_objects.home_menu}.click):wait_for(twentySecondsTimeout){@device_common_objects.tab_icons(1)}.click
    when "Book"
      ($device=="ios")?click_element_with_text("Book"):wait_for(twentySecondsTimeout){@device_common_objects.tab_icons(2)}.click
    when "Connect"
      ($device=="ios")?click_element_with_text("Connect with members"):wait_for(twentySecondsTimeout){@device_common_objects.tab_icons(3)}.click
    when "Discover"
      ($device=="ios")?click_element_with_text("More from us"):wait_for(twentySecondsTimeout){@device_common_objects.tab_icons(4)}.click
    when "Account"
      ($device=="ios")?(wait_for(twentySecondsTimeout){@device_common_objects.account_menu}.click):wait_for(twentySecondsTimeout){@device_common_objects.tab_icons(5)}.click
    when "Shop"
      ($device=="ios")?(swipe_down; sleep 4; click_element_with_text("Shop"); sleep 4):()
    when "Noticeboard"
      ($device=="ios")?click_element_with_text("Noticeboard"):wait_for(twentySecondsTimeout){@device_common_objects.tab_icons(3)}.click
    when "Watch, Listen, Read"
      ($device=="ios")?(swipe_down; sleep 4; click_element_with_text("Watch, Listen, Read"); sleep 4):()
    when "Soho Works"
      ($device=="ios")?(swipe_down; sleep 4; click_element_with_text("Soho Works"); sleep 4):()
    end

  end

  def verify_tab_icon
    sleep 2
    return @device_common_objects.tab_icon.displayed?
  end



  def swipeByLocation(x1,y1,x2,y2)

    if $device == "ios"

      $action.press({:x => x1, :y => (y1)}).wait(100).move_to({:x => x2, :y => y2}).release.perform

    else

      Appium::TouchAction.new.swipe(start_x:x1,start_y: y1, end_x:x2, end_y: y2).perform

      sleep 1
    end

  end

  def clickByCoordinated(x,y)

    $action.tap({:x => x, :y => (y)}).perform

  end

  def getTextElementWithText(text)
    return @device_common_objects.element_with_partial_text(text).text
  end

  def isEnabled(i)
    print @device_common_objects.element_with_text(i).enabled?
  end

  def skip_Onboarding
    begin
      if $device == "ios"
      until $common_screen.verify_element_displayed_with_text_tm("Share profile",1) do
        @device_common_objects.skip_onboard.click
      end
      end
    rescue
    end
  end

  def click_fab_icon
    @device_common_objects.tab_icon.click
  end

end
