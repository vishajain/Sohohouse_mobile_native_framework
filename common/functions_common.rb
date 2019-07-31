require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'

module Common

  def Common.wait_for(seconds)
    Selenium::WebDriver::Wait.new(:timeout => seconds).until {yield}
  end

end