require 'rubygems'
require 'pry'
require 'pry-nav'
require 'appium_lib'
require 'selenium-webdriver'
require 'yaml'

module Ios_driver

  def Ios_driver.start_app()

     puts "Launching Soho House ios App"

      if $run == "local"
          set_ios_capabilities_local
      elsif $run == "cloud"
          set_ios_capabilities_cloud
      end

      $driver.manage.timeouts.implicit_wait = 10

      $action = Appium::TouchAction.new

      $dimensions_width = $driver.manage.window.size.width

      $dimensions_height = $driver.manage.window.size.height

  end

  def Ios_driver.set_ios_capabilities_local

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
                  'deviceName' => 'iPhone XS Max',
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
      $driver_appium = Appium::Driver.new(@capabilities, true)

      $driver = $driver_appium.start_driver

  end

  def Ios_driver.set_ios_capabilities_cloud

      username = 'patrickgleeson1'
      access_key = 'r3bbzzgobTf5rppywrmx'

      caps = {}
      caps['build'] = 'Soho house ios tests'
      caps['name'] = 'single_test'
      caps['device'] = 'iPhone XS Max'
      caps['platformName'] = 'iOS'
      caps['os_version'] = '12'
      caps['browserstack.debug'] = true
      caps['autoAcceptAlerts'] = true
      caps['noReset'] = false
      caps['app'] = 'bs://9f694e96766543ff9bfd98e98ae9caf57cddb7f2'

      $driver_appium = Appium::Driver.new({
                                              'caps' => caps,
                                              'appium_lib' => {
                                                  :server_url => "http://#{username}:#{access_key}@hub-cloud.browserstack.com/wd/hub"
                                              }}, true)
      $driver = $driver_appium.start_driver

  end

end