
require 'rubygems'
require 'appium_lib'
# require 'watir'
require 'selenium-webdriver'
require "test/unit"
require 'yaml'
require_relative '../../common/functions_common'
require_relative '../pageobjects/login_objects'


class LoginScreen

  def initialize()

    #
    if $device == "ios"

      @device_login_objects = Ios_Login_Objects.new($driver, $driver_appium)

    else

      @device_login_objects = Android_Login_Objects.new($driver, $driver_appium)

    end

  end

  def verify_user_is_on_login_page()

      if  Common.wait_for(15) {@device_login_objects.welcome_home.displayed?}

        return true

      end

  end


  def close_app

    $driver = $driver_appium.quit_driver

  end

  def user_enters_email_password(validity)

    if validity == "valid"

      config     = {props: YAML.load_file(File.join(File.dirname(__FILE__), '../../config/environments.yml'))}

      email      = config[:props]["env"][$env]["username"]

      $password   = config[:props]["env"][$env]["password"]

      $name = config[:props]["env"][$env]["name"]

      $house = config[:props]["env"][$env]["house"]

      $profile = config[:props]["env"][$env]["profile"]

      @device_login_objects.email_textfield.send_keys(email)
      @device_login_objects.password_textfield.send_keys($password)

  #     if $device == "ios"
  #       @device_login_objects.email_textfield.send_keys(email)
  #       @device_login_objects.password_textfield.send_keys($password)
  #     elsif
  #       @device_login_objects.email_textfield[0].send_keys(email)
  #       @device_login_objects.email_textfield[1].send_keys($password)
  #     end
  #
  #   else
  #
  #     email = 'abcd@gmail.com'
  #
  #     password = 'abcd'
  #
  #     if $device == "ios"
  #       @device_login_objects.email_textfield.send_keys(email)
  #       @device_login_objects.password_textfield.send_keys(password)
  #     elsif
  #       @device_login_objects.email_textfield[0].send_keys(email)
  #       @device_login_objects.email_textfield[1].send_keys(password)
  #     end
  #
    end
  #
  end

  def user_clicks_go()

    Common.wait_for(20){@device_login_objects.go_button}.click

  end

  def verify_user_signin()


  end

end