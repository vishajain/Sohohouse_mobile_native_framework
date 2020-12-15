require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require "test/unit"

class Ios_Onboarding_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def welcome_home

    @driver.find_element(:name => "Welcome home")

  end

  def email_textfield
    @driver.find_element(:xpath => "//XCUIElementTypeTextField")

  end

  def password_textfield
    @driver.find_element(:xpath => "//XCUIElementTypeSecureTextField")

  end

  def go_button

    @driver.find_element(:name => "Go")

  end

  def main_home
    @driver.find_element(:name => "Member sign in")
  end

  def terms_text
    @driver.find_element(:name => "Terms and conditions")
  end

  def welcome_text
    @driver.find_element(:name => "Welcome to Soho House")
  end

  def notifications_on
    @driver.find_element(:name => "Turn on notifications")
  end

  def remind_later
    @driver.find_element(:name => "Remind me later")
  end

  def sync_text
    @driver.find_element(:name => "Sync with your calendar")
  end

  def chasing_payment_text
    @driver.find_element(:name => "There has been a problem with your payment")
  end

  def update_payment
    @driver.find_element(:name => "Update payment method")
  end

  def frozen_screen
    @driver.find_element(:name => "Your membership is on hold")
  end

  def expired_screen
    @driver.find_element(:name => "Your account cannot be accessed")
  end

  def suspended_screen
    @driver.find_element(:name => "Your membership has been suspended")
  end

  def update_later
    @driver.find_element(:name => "Update later")
  end

  def accept_terms
    @driver.find_element(:name => "Accept & Continue")
  end

  def helpus_text
    @driver.find_element(:name => "Help us improve")
  end

  def memberbenifits_text
    @driver.find_element( :name => "Your member benefits")
  end

  def housepay_text
    @driver.find_element( :name => "House Pay")
  end

  def allow_improve
    @driver.find_element(:name => "Allow")
  end

  def houserules_text
    @driver.find_element(:name => "House rules")
  end

  def makepersonal_continue
    @driver.find_element(:name => "Next")
  end

  def next_button
    @driver.find_element(:name => "Next")
  end

  def myplanner_text
    @driver.find_element(:name => "My planner")
  end

  def continue_without_sync
    @driver.find_element(:name => "Continue without syncing")
  end

  def welcome_text
    @driver.find_element(:name => "Welcome to Soho House")
  end

  def continue_button
    @driver.find_element(:name => "Continue")
  end

  def makepersonal_text
    @driver.find_element(:name => "Make it personal")
  end

  def intronotice_text
    @driver.find_element(:name => "Introducing Noticeboard")
  end

  def noticeboard_text
    @driver.find_element(:name => "Noticeboard")
  end

  def notification_pref_text
    @driver.find_element(:name => "Enable push notifications")
  end

  def ok_button
    @driver.find_element(:name => "OK")
  end

  def you_are_set_text
    @driver.find_element(:name => "You're all set")
  end

  def house_introduction
    @driver.find_element(:name => "House introduction")
  end

  def contact_membership_team
    @driver.find_element(:name => "Contact membership team")
  end

  def get_back_shortly
    @driver.find_element(:xpath => "//XCUIElementTypeTable[1]/XCUIElementTypeCell[1]/XCUIElementTypeStaticText")
  end

end

class Android_Onboarding_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def welcome_home
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Welcome home']")
  end

  def go_button
    @driver.find_element(:xpath => "//android.widget.Button[@text = 'Sign in']")
  end

  def email_textfield
    @driver.find_element(:id => "#{$currentPackage+':id'+'/email_input'}")
  end

  def password_textfield
    @driver.find_element(:id => "#{$currentPackage+':id'+'/password_input'}")
  end

  def main_home
    @driver.find_element(:xpath => "//android.widget.Button[@text = 'Member sign in']")
  end


  def welcome_text
    @driver.find_element(:xpath => "//android.widget.TextView[contains(@text,'Welcome to Soho House')]")
  end

  def next_button
    @driver.find_element(:xpath => "//android.widget.Button[contains(@text,'Next')]")
    # @driver.find_element(:id => "#{$currentPackage+':id'+'/title_card_next_button'}")
  end

  def next_button_1
    @driver.find_element(:id => "com.sohohouse.seven:id/continue_button")
  end

  def makepersonal_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Make it personal']")
  end

  def continue_button_to_notify_pref
    @driver.find_element(:id => "com.sohohouse.seven:id/onboarding_house_accept_button")
  end

  def makepersonal_continue
    @driver.find_element(:id => "#{$currentPackage+':id'+'/continue_button'}")
  end

  def intronotice_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Introducing Noticeboard']")
  end

  def intronotice_continue
    @driver.find_element(:id => "com.sohohouse.seven:id/onboarding_house_accept_button")
  end

  def continue_button
    @driver.find_element(:xpath => "//android.widget.Button[contains(@text,'Continue')]")
  end

  # def continue_button_to_notify_pref
  #   @driver.find_element(:id => "com.sohohouse.seven:id/onboarding_house_accept_button")
  # end

  def let_me_in_button
    @driver.find_element(:xpath => "//android.widget.Button[contains(@text,'Let me in')]")
  end

  def noticeboard_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Noticeboard']")
  end

  def house_introduction
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'House introduction']")
  end

  def contact_membership_team
    @driver.find_element(:xpath => "//android.widget.Button[@text = 'Contact membership team']")
  end

  def get_back_shortly
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Thanks for your booking request, we'll get back to you shortly']")
  end

  def notification_pref_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Introducing notifications']")
  end

  def ok_button
    @driver.find_element(:xpath => "//android.widget.Button[@text = 'OK']")
  end

  def you_are_set_text
    @driver.find_element(:xpath => "//android.widget.TextView[contains(@text,'all set')]")
  end

  def membership_card
      @driver.find_element(:id => "com.sohohouse.seven.staging:id/membership_card")
  end

  def member_benefit
    @driver.find_element(:xpath => "//android.widget.TextView[contains(@text,'Your member benefits')]")
  end

  def invalid_credential_dialog
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Invalid credentials']")
  end

  def update_later
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Update later']")
  end

end
