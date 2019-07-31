
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

      @device_login_objects = Ios_Login_Objects.new

    else

      @device_login_objects = Android_Login_Objects.new

    end

  end

  def verify_user_is_on_login_page()

      if  Common.wait_for(5) {@device_login_objects.welcome_home.displayed?}

        return true

      end

  end

  def user_enters_email_password(validity)

    if validity == "valid"

      config = {props: YAML.load_file(File.join(File.dirname(__FILE__), '../../config/environments.yml'))}

      email   = config[:props]["env"][$env]["username"]

      password = config[:props]["env"][$env]["password"]

      @device_login_objects.email_textfield.click

      @device_login_objects.email_textfield.send_keys(email)

      @device_login_objects.password_textfield.send_keys(password)

    else

      email = 'abcd@gmail.com'

      password = 'abcd'

      @device_login_objects.email_textfield.click

      @device_login_objects.email_textfield.send_keys(email)

      @device_login_objects.password_textfield.send_keys(password)

    end

  end

  def user_clicks_go()

    @device_login_objects.go_button.click

  end

  def verify_user_signin()


  end

end