# mobile-automation

Steps to Install Appium:

1.	Appium works better with Java 1.8 or Java 1.9. Ensure to install one of these versions before proceeding to the next steps. 
2.	Include JAVA_HOME as the environment variable in the bash profile and below steps can be followed:
a.	Vi .bash_profile
b.	Press i
c.	Update the bash profile as “export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_211.jdk/Contents/Home
d.	Press esc
e.	Enter :wq!
3.	To see if the .bash_profile is updated, enter echo $JAVA_HOME in terminal. You should be able to see the JAVA_HOME path
4.	Install Homebrew. Command as below
/usr/bin/ruby -e “$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install
5.	Install node.js – brew install node
6.	Install Appium – npm install -g Appium
7.	Install Xcode from App Store
8.	Install xcode command line tools – Xcode-select --install
9.	In order to launch WebDriver Agent, we need to install Carthage. Command as below:
    brew install Carthage
9.	Go to the path in terminal - /usr/local/lib/node_modules/appium/node_modules/appium-webdriveragent and run the below commands - 
    Mkdir -p Resources/WebDriverAgent.bundle
    And, run the below command
    ./Scripts/bootstrap.sh -d
10.	Install Authorize-iOS => npm install -g authorize-ios
11.	Install iOS-deploy => brew install ios-deploy
12.	Install iDeviceInstalle => brew install ideviceinstaller
13.	Install debug proxy => ios-webkit-debug-proxy
14.	Install Android SDK - https://developer.android.com/studio/install
15.	Set-up the Android home path in the bash_profile file as below:
    Export ANDROID_HOME=/Users/your_mac_user_name/Library/Android/sdk
    export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH
16.	After the Android SDK installation, android UIautomator viewer can be found in the below path - UI automator path: /Users/your_mac_your_name/Library/Android/sdk/tools/bin/uiautomatorviewer
17.	Install Appium Doctor => npm install -g Appium-doctor
18.	Goto - /usr/local/lib/node_modules/appium/node_modules/ appium-webdriveragent and open the file “WebDriverAgent.xcodeproj” with XCode and perform the steps in the link mentioned below (from 19th minute):
https://www.youtube.com/watch?v=-_6C_-CMqSk

Use full information:

To know the UDID of the devices:

iOS:
For iOS real devices info => ios-deploy-c
For iOS simulators info => instruments -s devices
Android:
adb devices

To run the iOS simulator from command prompt – 

Go to -  /usr/local/lib/node_modules/appium/node_modules/appium-WebDriverAgent and  run the command => xcodebuild -project WebDriverAgent.xcodeproj -scheme WebDriverAgentRunner -destination 'id=A9F18306-6B22-442B-99F4-F217A5EE8D38' test => this will open the iphone 8. I have mentioned the iphone 8 simulator’s udid

To install app on android simulator. Follow the below steps:

Paste the .apk file to platform-tools in the android-sdk Linux folder.
  •	Open Terminal and navigate to platform-tools folder in android-sdk.
  •	Then Execute this command –
  •	./adb install demo.apk
  •	If the installation is successful then you will get your app in the launcher of your android 

For android API 27, run the adb command to install the apk file on simulator. From API 28, we can just drag and drop
emulator.

Please be noted that the bundle ids can be obtained from the developers. 

Automation framework details:

1.	After cloning the repo onto the local, do bundle install. This will install all the required software mentioned in gem file
2.	The run profiles are mentioned in the cucumber.yml file. 
3.	The profiles can be run using the command mentioned below:
    bundle exec cucumber --profile profile_name
    Example: bundle exec cucumber --profile iphoneX-stag-local-sim-smokepack
4.	The below run time arguments must be passed via the profile. Below run time arguments are must – 
    a.	env – This is the environment where the framework is to be executed. Values accepted are ‘stag’, ‘prod’
    b.	device – Values accepted are ‘ios’, ‘android’
    c.	phone – This the phone name that is expected to be considered as part of automation run.  The value being given must be defined in the ios_device_details or android_device_details based on the run.
    d.	devicetype – The values accepted are ‘simulator’ or ‘real’ based on the where the run is going to happen.
    e.	noreset – ‘false’ if the app needs to be reset for the onboarding related tests. ‘true’ if the app doesn’t need to be reset.
    f.	run – Values accepted are ‘local’ or ‘cloud’. If ‘local’, the run would either happen on simulator or real device based on the run time arguments settings. If ‘cloud’, the cloud related capabilities would be considered. 
    g.	‘email’ and ‘password’– The login details where the automation run is expected to be performed.
5.	If any new device needs to be configured for the run, the respective device info is required to be added in ios_device_details.yml for ios devices and android_device_details.yml for android devices. Sample format of the profile is as below – 
            iphone11:
              stag:
                real:
                  udid: 00008020-000E3D9A0A86002E
                  platform_version: 12.2
                simulator:
                  udid: D62C1474-70E1-4956-95F9-02AA45D1589B
                  platform_version: '13.3'
              prod:
                real:
                  udid: XXXXX-XXXXXX-XXXXXXX-XXXXXXXXX
                  platform_version: 12.2
                simulator:
                  udid: D6DBBF52-3671-4177-9D62-4214E82E1C9E
                  platform_version: 12.2
6.	Point to be noted that bundle id provided in the ios_device_details or android_device_device details must be matched with the respective app’s bundle id.  
      For ios apps, find the bundle id as below – 
       Click on the app file -> Show package contents -> open info.plist -> Search for bundle identifier. 
      For android apps, find app activity as below – follow the below tutorial – 	
       http://www.automationtestinghub.com/apppackage-and-appactivity-name/
