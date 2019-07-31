require 'rubygems'
require 'cucumber'
require 'pry'
require 'pry-nav'
require_relative '../../../native_mobile/support/drivers/Appium_Helpers'
require_relative '../../../native_mobile/support/drivers/Ios_driver'
require_relative '../../../native_mobile/support/drivers/Android_driver'

# Start the Appium and open the App

module Base_driver

  def self.setapp()

      $isios      = 0
      $isandroid  = 0

      captureArguments

      # Appium_Helpers::start_appium()

      if $device == "ios"

        Ios_driver::start_app()
        $isios = 1

      else

        Android_driver::start_app()
        $isandroid = 1

      end
  end

# Retrieving the run time arguments to an array
# Assigning the runtime arguments to the global variables
# Validating the arguments

  def self.captureArguments

    env_arr         = ARGV[0].split('=')
    device_arr      = ARGV[1].split('=')
    phone_arr       = ARGV[2].split('=')
    devicetype_arr  = ARGV[3].split('=')

    $env    =  env_arr[1]
    $device = device_arr[1]
    $phone  =  phone_arr[1]
    $devicetype =  devicetype_arr[1]

    begin

      if $env != "stag" || $env != "prod"

        puts "Please enter env as either stag or prod"

      elsif $device != "ios" || $device != "android"

        puts "Please enter device as either ios or android"

      elsif $devicetype != "simulator" || $devicetype != "real"

        puts "Please enter devicetype as either simulator or real"

      end

    rescue

      puts "Unable to capture the arguments properly. Please have a look"
      exit

    end

  end

end