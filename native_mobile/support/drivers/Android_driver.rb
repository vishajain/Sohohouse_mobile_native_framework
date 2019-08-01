require 'rubygems'
require 'pry'
require 'pry-nav'
require 'appium_lib'
require 'selenium-webdriver'
require 'yaml'

module Android_driver

  def Android_driver.start_app()

    puts "Launching Soho House android App"

    set_android_capabilities

    $driver_appium = Appium::Driver.new(@capabilities, true)

    $driver = $driver_appium.start_driver

    $driver.manage.timeouts.implicit_wait = 5


  end


  def Android_driver.set_android_capabilities()

    @config = {props: YAML.load_file(File.join(File.dirname(__FILE__), '../../../config/android_device_details.yml'))}

    @udid   = @config[:props][$device][$phone][$env][$devicetype]["udid"]

    @platform_version = @config[:props][$device][$phone][$env][$devicetype]["platform_version"]

    @bundleid         = @config[:props][$device]["bundle"][$env]

    @app_path         = @config[:props][$device]["app_path"][$env]

    @capabilities =
        {
            caps:
                {
                    'platformName' => 'Android',
                    'deviceName' => 'Android',
                    'platformVersion' => @platform_version ,
                    'udid' =>   @udid  ,
                    'app' =>  @app_path,
                    'bundleId' =>   @bundleid,
                    'appActivity' => 'com.sohohouse.seven.splash.SplashActivity',
                    'ConnectHardwareKeyboard' => false,
                    'useNewWDA'=> true,
                    'waitForQuiescence' => false,
                    'autoAcceptAlerts' => true,
                    'noReset' => false
                }
        }

  end


end