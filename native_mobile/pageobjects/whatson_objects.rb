require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require 'yaml'
require "test/unit"

class Ios_Whatson_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def whatson_title
    @driver.find_element(:name => "What's on")
  end

  def whatson_filter
    @driver.find_element(:name => "iconFilter")
  end

  def whatson_options(button)
    @driver.find_element(:name => ""+button+"")
  end

  def member_event
    config       = {props: YAML.load_file(File.join(File.dirname(__FILE__), '../../config/testdata.yml'))}
    # run_id       = config[:props]["data"]["run-id"]
    member_event_name         = config[:props]["data"]["event"]["name"]
    # @member_event_name = name + " " + run_id
    @driver.find_elements(:name =>""+member_event_name+"")
  end

end

class Android_Whatson_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

end