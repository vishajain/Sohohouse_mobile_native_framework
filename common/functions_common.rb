require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'


module Common

  def Common.wait_for(seconds)
    Selenium::WebDriver::Wait.new(:timeout => seconds).until {yield}
  end

  def Common.scenario_failed

    print_scenario_failed

    screenshot

    quit_cucumber

  end

  def Common.screenshot
    $driver.save_screenshot "./screenshots/#{Time.now.strftime("failshot__%d_%m_%Y__%H_%M_%S")}.png"
  end

  def Common.quit_cucumber
    Cucumber.wants_to_quit = true
  end

  def Common.print_scenario_failed
    puts "***** THIS SCENARIO IS FAILED. HAVE A LOOK *****"
  end

end