require 'rubygems'
require 'pry'
require 'pry-nav'
require 'appium_lib'
require 'selenium-webdriver'
require 'yaml'

module Ios_driver

  def Ios_driver.start_app()

    puts "Launching Soho House ios App"

    set_ios_capabilities

      $driver_appium = Appium::Driver.new(@capabilities, true)

      $driver = $driver_appium.start_driver

      $driver.manage.timeouts.implicit_wait = 5

      $action = Appium::TouchAction.new

      $dimensions_width = $driver.manage.window.size.width

      $dimensions_height = $driver.manage.window.size.height


  end

  def Ios_driver.set_ios_capabilities()

      @config = {props: YAML.load_file(File.join(File.dirname(__FILE__), '../../../config/ios_device_details.yml'))}

      @udid   = @config[:props][$device][$phone][$env][$devicetype]["udid"]

      @platform_version = @config[:props][$device][$phone][$env][$devicetype]["platform_version"]

      @bundleid         = @config[:props][$device]["bundle"][$env]

      @app_path         = @config[:props][$device]["app_path"][$env]

      #  'useNewWDA'=> true,,

      @capabilities =
          {
              caps:
              {
                  'platformName' => 'iOS',
                  'deviceName' => 'iPhone',
                  'platformVersion' => @platform_version ,
                  'udid' =>   @udid  ,
                  'app' =>  @app_path,
                  'bundleId' =>   @bundleid,
                  'automationName' =>  'XCUITest',
                  'xcodeOrgId' => '9E4LTRQ997',
                  'xcodeSigningId' => 'iPhone Developer',
                  'ConnectHardwareKeyboard' => false,
                  'waitForQuiescence' => false,
                  'autoAcceptAlerts' => true,
                  'noReset' => false

              }
          }

  end

end