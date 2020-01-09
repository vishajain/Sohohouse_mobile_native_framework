require 'rubygems'
require 'pry'
require 'pry-nav'
require 'appium_lib'
require 'selenium-webdriver'
require 'yaml'

module Android_driver

  def Android_driver.start_app()

    puts "Launching Soho House android App"

    if $run == "local"
      set_android_capabilities_local
    elsif $run == "cloud"
      set_android_capabilities_cloud
    end

    $driver.manage.timeouts.implicit_wait = 10

  end


  def Android_driver.set_android_capabilities_local()

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
                    'noReset' => true
                }
        }

    $driver_appium = Appium::Driver.new(@capabilities, true)

    $driver = $driver_appium.start_driver

  end

  def Android_driver.set_android_capabilities_cloud

    username = 'patrickgleeson1'
    access_key = 'r3bbzzgobTf5rppywrmx'

    username = 'patrickgleeson1'
    access_key = 'r3bbzzgobTf5rppywrmx'

    caps = {}
    caps['build'] = 'Soho house android tests'
    caps['name'] = 'single_test'
    caps['device'] = 'Samsung Galaxy S8 Plus'
    caps['platformName'] = 'android'
    caps['browserstack.debug'] = true
    caps['app'] = 'bs://33cbf62d8397f814f7c5b5d9c9fe3c80e73cd13f'

    $driver_appium = Appium::Driver.new({
                                            'caps' => caps,
                                            'appium_lib' => {
                                                :server_url => "http://#{username}:#{access_key}@hub-cloud.browserstack.com/wd/hub"
                                            }}, true)
    $driver = $driver_appium.start_driver

  end

end