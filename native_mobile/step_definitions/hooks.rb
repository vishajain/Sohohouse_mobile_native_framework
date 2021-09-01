require 'rubygems'
require 'cucumber'
require 'report_builder'

at_exit do
  if $device == "ios"
    ReportBuilder.configure do |config|
    config.json_path = 'results/cucumber_json/ios'
    config.report_path = 'results/reports/IOS_Test_Exec_Report'
    config.report_types = [:html]
    config.report_tabs = [:overview, :features, :scenarios, :errors]
    config.report_title = 'My Test Results'
    config.compress_images = false
    end
  else
    ReportBuilder.configure do |config|
      config.json_path = 'results/cucumber_json/android'
      config.report_path = 'results/reports/Android_Test_Exec_Report'
      config.report_types = [:html]
      config.report_tabs = [:overview, :features, :scenarios, :errors]
      config.report_title = 'My Test Results'
      config.compress_images = false
    end
  end
  ReportBuilder.build_report
end

Before do |scenario|

  i=0

  uninstalled_flag=false

  loop do

    begin

      if $driver == nil                               #checking whether app is already up if not launch

        Base_driver.setapp()

        initializeClass

        if scenario.feature.name.include?"On-boarding screens" and uninstalled_flag==false and $run=="local"

          $device=="ios"?($onboardingscreens.verify_home_and_logout):(sleep 1)

          $device=="ios"?($driver.remove_app("com.sohohouse.enterprise.staging")):($driver.remove_app("com.sohohouse.seven.staging"))

          $driver=nil

          uninstalled_flag=true

          raise "Uninstalled..Re-Launch"

        end
      elsif $failed==true

        $failed=false

        $driver.activate_app($currentPackage)
      end

      assert_true($onboardingscreens.verify_app_launch_screen, "App installed successfully") #Checking if app is launched if yes, is it alreday logged in

      break

    rescue StandardError => e

      print e.message

        i = i + 1

        if i > 2

          break

        end

    end

  end
  config     = {props: YAML.load_file(File.join(File.dirname(__FILE__), '../../config/testdata.yml'))}

  if config[:props]["data"]["need_signout"].include?(scenario.name.split(",")[0])

    $onboardingscreens.verify_home_and_logout

    $email = config[:props]["data"]["email-id"][$device][(scenario.name.split(",")[0])]

  else

    $email=$default_email

  end

  if $login == false                                          #if not already logged in ,then log in

    $onboardingscreens.user_clicks_membership

  end

  if $login != nil and !config[:props]["data"]["need_separate_sign_in"].include?(scenario.name.split(",")[0])

    $onboardingscreens.user_enters_email_password("valid")

    !(scenario.feature.name.include?"On-boarding screens")?($common_screen.skip_Onboarding):()

  end

  $scenario=ScenarioContext.new

  $scenario.setContext("scenario",scenario.name)

end

After do |scenario|

  if scenario.failed?

    $failed=true

    encoded_img = $driver.screenshot_as(:base64)

    embed("data:image/png;base64,#{encoded_img}",'image/png')

    $onboardingscreens = OnboardingScreens.new

    $onboardingscreens.close_app

  end
  config     = {props: YAML.load_file(File.join(File.dirname(__FILE__), '../../config/testdata.yml'))}
  if config[:props]["data"]["need_signout"].include?scenario.name

    $onboardingscreens.verify_home_and_logout
    sleep 2

  end

end

def initializeClass
  $onboardingscreens = OnboardingScreens.new
  $homescreen = HomeScreen.new
  $whatsonscreen = WhatsonScreen.new
  $accountscreen = AccountScreen.new
  $common_screen=CommonScreen.new
  $connect_screen=ConnectScreen.new
end

