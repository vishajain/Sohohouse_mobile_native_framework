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
    @driver.find_element(:xpath => "//XCUIElementTypeTable/XCUIElementTypeCell[3]/XCUIElementTypeStaticText[1]")
  end

  def text_input
    @driver.find_element(:xpath => "//XCUIElementTypeTextField[1]")
  end

  def large_text_input
    @driver.find_element(:xpath => "//XCUIElementTypeTextView[1]")
  end

  def industry
    @driver.find_element(:name => "Industry")
  end

  def industry_input
    @driver.find_element(:xpath => "//XCUIElementTypePicker//XCUIElementTypePickerWheel")
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

  def interests_remove
    @driver.find_elements(:xpath => "//XCUIElementTypeCollectionView//XCUIElementTypeStaticText")
  end

  def interests_input(interest)
    @driver.find_element(:xpath => "//XCUIElementTypeCollectionView//XCUIElementTypeStaticText[@name='"+interest+"']")
  end

  def social_accounts
    @driver.find_element(:name => "Connect social accounts")
  end

  def website
    @driver.find_element(:name => "Website")
  end

  def website_text
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='Website']/following-sibling::XCUIElementTypeTextField[1]")
  end

  def instagram
    @driver.find_element(:name => "Instagram")
  end

  def instagram_text
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='Instagram']/following-sibling::XCUIElementTypeTextField[1]")
  end

  def twitter
    @driver.find_element(:name => "Twitter")
  end

  def twitter_text
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='Twitter']/following-sibling::XCUIElementTypeTextField[1]")
  end

  def linkedin
    @driver.find_element(:name => "LinkedIn")
  end

  def linkedin_text
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='LinkedIn']/following-sibling::XCUIElementTypeTextField[1]")
  end

  def spotify
    @driver.find_element(:name => "Spotify")
  end

  def spotify_text
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='Spotify']/following-sibling::XCUIElementTypeTextField[1]")
  end

  def youtube
    @driver.find_element(:name => "YouTube")
  end

  def youtube_text
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='YouTube']/following-sibling::XCUIElementTypeTextField[1]")
  end

  def done
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='Done']")
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


  def edit_profile
    @driver.find_element(:xpath =>"//android.widget.TextView[@text='Edit profile']")
  end

  def member_name
    # @driver.find_element(:name => "Accept")
  end

  def profession
    @driver.find_element(:xpath => "//android.widget.TextView[@text='Profession']")
  end

  def profession_input
    @driver.find_element(:xpath => "//android.widget.TextView[@text='Profession']/following-sibling::android.widget.TextView[1]")
  end

  def text_input
    @driver.find_element(:xpath => "android.widget.EditText")
  end

  def large_text_input
    @driver.find_element(:id => "#{$currentPackage+':id'+'/edit_profile_field_label'}")
  end

  def industry
    @driver.find_element(:xpath => "//android.widget.TextView[@text='Industry']")
  end

  def industry_input
    @driver.find_element(:xpath => "//android.widget.TextView[@text='Industry']/following-sibling::android.widget.TextView[1]")
  end

  def city
    @driver.find_element(:xpath => "//android.widget.TextView[@text='City']")
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

  def interests_remove
    @driver.find_elements(:xpath => "//XCUIElementTypeCollectionView//XCUIElementTypeStaticText")
  end

  def interests_input(interest)
    @driver.find_element(:xpath => "//XCUIElementTypeCollectionView//XCUIElementTypeStaticText[@name='"+interest+"']")
  end

  def social_accounts
    @driver.find_element(:name => "Connect social accounts")
  end

  def website
    @driver.find_element(:name => "Website")
  end

  def website_text
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='Website']/following-sibling::XCUIElementTypeTextField[1]")
  end

  def instagram
    @driver.find_element(:name => "Instagram")
  end

  def instagram_text
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='Instagram']/following-sibling::XCUIElementTypeTextField[1]")
  end

  def twitter
    @driver.find_element(:name => "Twitter")
  end

  def twitter_text
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='Twitter']/following-sibling::XCUIElementTypeTextField[1]")
  end

  def linkedin
    @driver.find_element(:name => "LinkedIn")
  end

  def linkedin_text
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='LinkedIn']/following-sibling::XCUIElementTypeTextField[1]")
  end

  def spotify
    @driver.find_element(:name => "Spotify")
  end

  def spotify_text
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='Spotify']/following-sibling::XCUIElementTypeTextField[1]")
  end

  def youtube
    @driver.find_element(:name => "YouTube")
  end

  def youtube_text
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='YouTube']/following-sibling::XCUIElementTypeTextField[1]")
  end

  def done
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='Done']")
  end

  def save_changes
    @driver.find_element(:name => "Save changes")
  end

end

