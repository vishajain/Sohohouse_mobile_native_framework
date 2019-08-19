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


  def Common.swipe_and_search(obj,func)
    element = obj + "." + func
    swipe_down_count = 0
    $found = 0
    puts "I am in swipe and search"
    puts "elements size is #{element.size}"
    if Common.wait_for(2){element.size} > 0

      locat = element[0].location

      x =  locat["x"]
      y =  locat["y"]
      if y > $dimensions_height
        swipe_down_count = swipe_down_count + 1
        Common.swipe_down
      elsif x==0 and y==100
        swipe_down_count = swipe_down_count + 1
        Common.swipe_down
      end
    end

    loop do
      puts "I am in loop"
      if Common.wait_for(4){element.size} > 0
        puts "swipe count #{swipe_down_count}"
        $found = 1
        break
      else
        if swipe_down_count < 5
          puts "I am in swipe"
          Common.swipe_down
          swipe_down_count = swipe_down_count+1
        else
          $found = 0
          break
        end
      end
    end
    if $found==1
      puts "found"
      return true
    else
      puts "not found"
      return false
    end

  end


  def self.swipe_down

    if $device == "ios"
      $action.press({:x => ($dimensions_width*0.5), :y => ($dimensions_height*0.5)}).wait(100).move_to({:x => ($dimensions_width*0.5), :y => ($dimensions_height*0.3)}).release.perform
    else
       $driver.execute_script('mobile:scroll', direction: 'down')
    end
    sleep 1
  end

end