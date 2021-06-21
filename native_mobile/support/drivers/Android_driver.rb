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
    else $run == "aws"
    set_android_capabilities_aws
    end

    $driver.manage.timeouts.implicit_wait = 10

    $currentPackage =  "com.sohohouse.seven.staging"

    $android_dimensions_width = $driver.manage.window.size.width

    $android_dimensions_height = $driver.manage.window.size.height

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
                    'avd' => 'nexus5x',
                    'platformVersion' => (@platform_version.to_s),
                    'udid' =>   @udid  ,
                    'app' =>  @app_path,
                    'appActivity' => 'com.sohohouse.seven.splash.SplashActivity',
                    'ConnectHardwareKeyboard' => false,
                    'useNewWDA'=> true,
                    'waitForQuiescence' => false,
                    'autoAcceptAlerts' => true,
                    'noReset' => $noreset,
                    'newCommandTimeout'=> 420
                }
        }

    $driver_appium = Appium::Driver.new(@capabilities, true)

    $driver = $driver_appium.start_driver


  end

  def Android_driver.set_android_capabilities_cloud

    username = 'patrickgleeson1'
    access_key = 'r3bbzzgobTf5rppywrmx'

    caps = {}
    caps['build'] = 'Soho house android tests'
    caps['name'] = 'single_test'
    caps['device'] = 'Samsung Galaxy S8 Plus'
    caps['platformName'] = 'android'
    caps['browserstack.debug'] = true
    caps['noReset'] = $noreset
    caps['app'] = 'bs://33cbf62d8397f814f7c5b5d9c9fe3c80e73cd13f'

    $driver_appium = Appium::Driver.new({
                                            'caps' => caps,
                                            'appium_lib' => {
                                                :server_url => "http://#{username}:#{access_key}@hub-cloud.browserstack.com/wd/hub"
                                            }}, true)
    $driver = $driver_appium.start_driver

  end

  def Android_driver.set_android_capabilities_aws
    @capabilities =
      {
        caps: {}
      }
    $driver_appium = Appium::Driver.new(@capabilities, true)
    $driver = $driver_appium.start_driver

  end
end