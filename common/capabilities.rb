$:.unshift File.dirname(__FILE__) # Current Directory

require 'rubygems'

module Capabilities

  def self.set_capabilities(device_name, platformversion, udid, nodeaddress, port)

    case device_name

    when "ios_native_app"

      return ios_native_app_capabilities('12.2', 'D6DBBF52-3671-4177-9D62-4214E82E1C9E')

    when "android_native_app"

      return android_native_app_capabilities('9','emulator-5554')

    end

  end


  def self.android_native_app_capabilities(platformversion,udid)

    if $environment == 'stag'
      appPackage = 'com.sohohouse.seven'
    else
      appPackage = 'com.sohohouse.seven'
    end

    return {

        caps: {
            deviceName: udid,
            udid: udid,
            platformVersion: platformversion,
            platformName: 'Android',
            appPackage: appPackage,
            appActivity: 'com.sohohouse.seven.splash.SplashActivity',
            rotatable: true,
            skipUnlock: true,
            automationName: 'uiautomator2',
            skipDeviceInitialization: true,
            skipServerInstallation: true,
            fullReset: false,
            noReset: true,
            # systemPort: 8201,
            noSign: 'true'
        }
    }
  end

  def self.ios_native_app_capabilities(platformversion, udid)

    if $environment == 'stag'
      bundleId = 'com.sohohouse.houseseven.staging'
    else
      bundleId = 'com.sohohouse.enterprise.production'
    end

    return {

        caps: {
            'platformName' => 'iOS',
            # 'deviceName' => 'SHiPhone',
            'deviceName' => 'iPhone Simulator',
            'platformVersion' => platformversion,
            'udid' => udid,
            'bundleId' => bundleId,
            'automationName' => 'XCUITest',
            'no_reset' => false,
            'safariAllowPopups' => true,
            'unexpectedAlertBehaviour' => true,
            'connectHardwareKeyboard' => false,
            'autoAcceptAlerts' => true,
            # 'autoDismissAlerts' => true,
            # 'autoAcceptAlerts' => true,
            'xcodeOrgId' => '9E4LTRQ997',
            'xcodeSigningId' => 'iPhone Developer',
            'useNewWDA' => false
            # 'noReset' => false
        }
    }
  end




end
