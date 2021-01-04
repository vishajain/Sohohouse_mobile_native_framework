require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require_relative '../native_mobile/pageobjects/whatson_objects'

module Common

  def Common.wait_for(seconds)
    Selenium::WebDriver::Wait.new(:timeout => seconds).until {yield}
  end

  def Common.scenario_failed_and_quit
    print_scenario_failed
    screenshot
    quit_cucumber
  end

  def Common.scenario_failed_and_noquit
    print_scenario_failed
    screenshot
  end

  def Common.screenshot
    $driver.save_screenshot "./screenshots/#{Time.now.strftime("failshot__%d_%m_%Y__%H_%M_%S")}.png"
  end

  def Common.quit_cucumber
    Cucumber.wants_to_quit = true
  end

  def Common.print_scenario_failed
    puts "***** THE BELOW STEP IS FAILED. HAVE A LOOK *****"
  end

  def Common.homescreen_navigate

    loop do

      if Common.wait_for(5){@device_home_objects.homeBtn.size} > 0

        @device_home_objects.homeBtn[0].click

        break

      else

        Common.wait_for(5) {@device_home_objects.left_link}.click

      end

    end

  end

  def Common.myplanner_navigate

    loop do

      if Common.wait_for(5){@device_home_objects.myplanner_btn_1.size} > 0

        @device_home_objects.myplanner_btn.click

        break

      else

        Common.wait_for(5) {@device_home_objects.left_link.click}

      end

    end

  end


  def self.swipe_down
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

  def self.little_swipe_down
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

  def self.swipe_top()
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

  def self.swipe_left(startY, endY)

    if $device == "ios"
      $action.press({:x => ($dimensions_width-20), :y => startY}).wait(2000).move_to({:x => 50, :y => endY}).release.perform
    else
      Appium::TouchAction.new.swipe(start_y: 1340, end_y: 350).perform
    end

  end


  def self.swipe_right(startY, endY)

    if $device == "ios"
      $action.press({:x => 50, :y => startY}).wait(100).move_to({:x => ($dimensions_width-20), :y => endY}).release.perform
    else
      Appium::TouchAction.new.swipe(start_y: 1340, end_y: 350).perform
    end

  end
  def Common.hideKeyboard

    $driver.hide_keyboard

  end


  def self.goBack
    $driver.back
  end

  def self.home_panel_swipe(section,direction)
    if direction == "left"
      if $device == "ios"
        $action.press({:x => ($dimensions_width-50), :y => ($dimensions_width/2.5)}).wait(100).move_to({:x => 50, :y => ($dimensions_width/2.5)}).release.perform
      else
        sleep 2
        Appium::TouchAction.new.swipe(start_x:($android_dimensions_width-50),start_y: (section.location.y+20), end_x:50, end_y: (section.location.y+20)).perform
      end
    else
      if $device == "ios"
        $action.press({:x => ($dimensions_width-50), :y => ($dimensions_width/2.5)}).wait(100).move_to({:x => 50, :y => ($dimensions_width/2.5)}).release.perform
      else
        sleep 2
        Appium::TouchAction.new.swipe(start_x:50,start_y: (section.location.y+20), end_x:($android_dimensions_width-50), end_y: (section.location.y+20)).perform
      end
    end
  end

  def self.verifyNavBar(element)
    @device_home_objects = Android_Home_Objects.new($driver, $driver_appium)
    nav_y=@device_home_objects.nav_bar.location.y
    element_y=element.location.y
    if element_y > nav_y
      self .little_swipe_down
    end
  end

  def self.closeWebView
    @device_account_objects = Android_Account_Objects.new($driver, $driver_appium)
    Common.wait_for(20){@device_account_objects.close_webview}.click
  end

  def self.navigateBack
    @device_account_objects = Android_Account_Objects.new($driver, $driver_appium)
    Common.wait_for(20) {@device_account_objects.icon_left}.click
  end

  def self.swipeByLocation(x1,y1,x2,y2)
    if
    if $device == "ios"
      $action.press({:x => ($dimensions_width-50), :y => ($dimensions_width/2.5)}).wait(100).move_to({:x => 50, :y => ($dimensions_width/2.5)}).release.perform
    else
      sleep 1
      Appium::TouchAction.new.swipe(start_x:x1,start_y: y1, end_x:x2, end_y: y2).perform
    end
    end
  end
end

