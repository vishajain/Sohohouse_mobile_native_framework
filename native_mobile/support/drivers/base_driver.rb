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

      captureArguments

      # Appium_Helpers::start_appium()

      if $device == "ios"

        Ios_driver::start_app()

      else

        Android_driver::start_app()

      end
  end

# Retrieving the run time arguments to an array
# Assigning the runtime arguments to the global variables
# Validating the arguments

  def self.captureArguments

    $env    =  ENV['env']
    $device = ENV['device']
    $phone  =  ENV['phone']
    $devicetype =  ENV['devicetype']
    $run  = ENV['run']
    $noreset = ENV['noreset']

      if $env != "stag" and $env != "prod"

        puts "Incorrect environment provided. Please enter env as either stag or prod"
        Cucumber.wants_to_quit = true

      elsif $device != "ios" and $device != "android"

        puts "Incorrect device provided. Please enter device as either ios or android"
        Cucumber.wants_to_quit = true

      elsif $devicetype != "simulator" and $devicetype != "real"

        puts "Incorrect device type provided. Please enter devicetype as either simulator or real"
        Cucumber.wants_to_quit = true

      elsif $noreset != "true"  and $noreset != "false"

        puts "Please enter the noreset value as either true or false"
        Cucumber.wants_to_quit = true

      end

  end

end