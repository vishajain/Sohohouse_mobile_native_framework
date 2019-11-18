require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require "test/unit"

class Ios_Editprofile_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def edit_profile
    @driver.find_element(:name => "Edit profile")
  end

  def member_name
    # @driver.find_element(:name => "Accept")
  end

  def profession
    @driver.find_element(:name => "Profession")
  end

  def profession_input
    @driver.find_element(:name => "Tell us what you do")
  end

  def industry
    @driver.find_element(:name => "Industry")
  end

  def industry_input
    @driver.find_element(:name => "Tell us about your field")
  end

  def city
    @driver.find_element(:name => "City")
  end

  def city_input
    @driver.find_element(:name => "Tell us where you spend the most time")
  end

  def aboutme
    @driver.find_element(:name => "About me")
  end

  def aboutme_input
    @driver.find_element(:name => "Tell us about yourself")
  end

  def chat
    @driver.find_element(:name => "Let's chat")
  end

  def chat_input
    @driver.find_element(:name => "Tell us what gets you talking")
  end

  def interests
    @driver.find_element(:name => "Interests")
  end

  def interests_input
    @driver.find_element(:xpath => "//XCUIElementTypeTextField[@type = 'TextField']")
  end

  def done
    @driver.find_element(:name => "Done")
  end

  def social_accounts
    @driver.find_element(:name => "Connect social accounts")
  end

  def website
    @driver.find_element(:name => "Website")
  end

  def website_text
    @driver.find_element(:xpath => "//XCUIElementTypeTextField[@value = 'yourwebsite.com']")
  end

  def instagram
    @driver.find_element(:name => "Instagram")
  end

  def instagram_text
    @driver.find_element(:xpath => "//XCUIElementTypeTextField[@value = '@yourhandle']")
  end

  def twitter
    @driver.find_element(:name => "Twitter")
  end

  def twitter_text
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name = 'Twitter']/following-sibling::XCUIElementTypeTextField[@value = '@yourhandle']")
  end

  def linkedin
    @driver.find_element(:name => "LinkedIn")
  end

  def linkedin_text
    @driver.find_element(:xpath => "//XCUIElementTypeTextField[@value = 'linkedin.com/in/username']")
  end

  def spotify
    @driver.find_element(:name => "Spotify")
  end

  def spotify_text
    @driver.find_element(:xpath => "//XCUIElementTypeTextField[@value = 'open.spotify.com/user/username']")
  end

  def youtube
    @driver.find_element(:name => "YouTube")
  end

  def youtube_text
    @driver.find_element(:xpath => "//XCUIElementTypeTextField[@value = 'youtube.com/user/username']")
  end

  def save_changes
    @driver.find_element(:name => "Save changes")
  end

end

class Android_Editprofile_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def welcome_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Welcome to Soho House']")
  end

  def next_button
    @driver.find_element(:id => "com.sohohouse.seven:id/title_card_next_button")
  end


  def next_button_1
    @driver.find_element(:id => "com.sohohouse.seven:id/continue_button")
  end

  def makepersonal_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Make it personal']")
  end

  def intronotice_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Introducing Noticeboard']")
  end

  def intronotice_continue
    @driver.find_element(:id => "com.sohohouse.seven:id/onboarding_house_accept_button")
  end

  def continue_button
    @driver.find_element(:id => "com.sohohouse.seven:id/onboarding_house_accept_button")
  end

  def continue_button_to_notify_pref
    @driver.find_element(:id => "com.sohohouse.seven:id/onboarding_house_accept_button")
  end

  def noticeboard_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Noticeboard']")
  end

  def notification_pref_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Notification preferences']")
  end

  def ok_button
    @driver.find_element(:xpath => "//android.widget.Button[@text = 'OK']")
  end

  def you_are_set_text
    @driver.find_element(:id => "com.sohohouse.seven:id/title_card_title")
  end

end

