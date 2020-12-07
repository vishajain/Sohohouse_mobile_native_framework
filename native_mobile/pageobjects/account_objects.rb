require 'rubygems'
require 'appium_lib'
require 'selenium-webdriver'
require 'yaml'
require "test/unit"

class Ios_Account_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def profession_value1
    @driver.find_element(:xpath => "//XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[2]")
  end

  def city_value
    @driver.find_element(:xpath => "//XCUIElementTypeTable/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[1]")
  end

  def industry_value
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='Industry']/following-sibling::XCUIElementTypeStaticText[1]")
  end

  def about_me_value
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='I am the king of this jungle']")
  end

  def interests_value
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='Ice hockey']")
  end

  def lets_chat_value
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='Anything']")
  end

  def your_guest_invitation
    @driver.find_element(:name => "Guest invitations")
  end

  def instagram_value
    @driver.find_element(:name => "instagram")
  end

  def twitter_value
    @driver.find_element(:name => "twitter")
  end

  def linkedin_value
    @driver.find_element(:name => "linkedIn")
  end

  def spotify_value
    @driver.find_element(:name => "spotify")
  end

  def youtube_value
    @driver.find_element(:name => "youtube")
  end

  def website_value
    @driver.find_element(:name => "website")
  end

  def edit_profile
    @driver.find_element(:name => "Edit profile")
  end

  def member_name
    # @driver.find_element(:name => "Accept")
  end

  def profession
    @driver.find_element(:name => "What do you do")
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

  def select_favourite (input)
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='"+input+"']")
  end

  def industry
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='Type of work']")
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
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='About me']")
  end

  def aboutme_input
    @driver.find_element(:name => "Tell us about yourself")
  end

  def chat
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[contains(@name, 'chat')]")
  end

  def chat_input
    @driver.find_element(:name => "Tell us what gets you talking")
  end

  def interests
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='Interests']")
  end

  def profession_interests_remove
    @driver.find_elements(:xpath => "//XCUIElementTypeCollectionView//XCUIElementTypeStaticText")
  end

  def profession_interests_input(interest)
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='"+interest+"']")
  end

  def social_accounts
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name='Connect social accounts']")
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

  def create_guest_invitation
    @driver.find_element(:name => "Guest invitations")
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

  def account_title
    @driver.find_element(:name => "View profile")
  end

  def edit_profile_screen
    @driver.find_element(:name => "Edit")
  end

  def your_membership
    @driver.find_element(:name => "Your membership")
  end

  def membership
    @driver.find_element(:name => "Membership")
  end

  def your_bookings
    @driver.find_element(:name => "Bookings")
  end

  def booking_history
    @driver.find_element(:name => "Booking history")
  end

  def perks
    @driver.find_element(:name => "Perks")
  end

  def houseperks_title
    @driver.find_element(:name => "House Perks")
  end

  def payment
    @driver.find_element(:name => "Payments")
  end

  def past_bookings
    @driver.find_element(:name => "Past bookings")
  end

  def change_password
    @driver.find_element(:name => "Change Password")
  end

  def favourite_houses

    @driver.find_element(:name => "Favourite Houses")
  end

  def settings

    @driver.find_element(:name => "Settings")
  end

  def notification_preferences

    @driver.find_element(:name => "Events")

  end

  def sync_calendar
    @driver.find_element(:name => "Sync calendar")
  end

  def notification
    @driver.find_element(:name => "Settings")
  end

  def notifications
    @driver.find_element(:name => "Notifications")
  end

  def subscribe
    @driver.find_element(:name => "Subscribe to the calendar “Soho House Bookings”?")
  end

  def sync
    @driver.find_element(:name => "Sync")
  end

  def myplanner_title
    @driver.find_element(:name => "My planner")
  end


  def contact_us
    @driver.find_element(:name => "Contact us")
  end

  def faq

    @driver.find_element(:name => "FAQ")

  end

  def policies

    @driver.find_element(:name => "Terms and policies")

  end

  def stay_section
    @driver.find_element(:name => "Sign out")
  end


  def icon_left
    # @driver.find_element(:name => "iconLeft")
    @driver.find_element(:xpath => "//XCUIElementTypeButton[@name='iconLeft']")
  end

  def browser_close
    @driver.find_element(:name => "iconLeft")
  end

  def icon_back_header
    @driver.find_element(:name => "iconBackHeader")
  end

  def homeBtn
    @driver.find_element(:xpath => "//XCUIElementTypeTabBar//XCUIElementTypeButton[1]")

  end

  def perkTitle
    # @driver.find_element(:xpath => "//XCUIElementTypeCell[1]")
    @driver.find_element(:xpath => "//XCUIElementTypeTable[1]/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[2]")
  end

  def perkLocation
    @driver.find_element(:xpath => "//XCUIElementTypeTable[1]/XCUIElementTypeCell[1]/XCUIElementTypeStaticText[1]")
  end

  def perkContentImage
    @driver.find_element(:xpath => "//XCUIElementTypeImage[1]")
  end

  def perkContentLocation
    @driver.find_element(:xpath => "//XCUIElementTypeTable[1]/XCUIElementTypeCell/XCUIElementTypeStaticText[1]")
  end

  def perkContentTitle
    @driver.find_element(:xpath => "//XCUIElementTypeTable[1]/XCUIElementTypeCell/XCUIElementTypeStaticText[2]")
  end

  def perkContentDesc
    @driver.find_element(:xpath => "//XCUIElementTypeTable[1]/XCUIElementTypeCell/XCUIElementTypeTextView")
  end

  def current_password
    @driver.find_element(:name => "Current password")
  end

  def current_password_input
    @driver.find_element(:xpath => "//XCUIElementTypeTable[1]/XCUIElementTypeCell[1]/XCUIElementTypeSecureTextField[1]")
  end

  def new_password_input
    @driver.find_element(:xpath => "//XCUIElementTypeTable[1]/XCUIElementTypeCell[2]/XCUIElementTypeSecureTextField[1]")
  end

  def confirm_password_input
    @driver.find_element(:xpath => "//XCUIElementTypeTable[1]/XCUIElementTypeCell[3]/XCUIElementTypeSecureTextField[1]")
  end

  def save_btn
    @driver.find_element(:name => "Save")
  end

  def sign_out_account
    @driver.find_element(:name => "Sign out")
  end

  def reset
    @driver.find_element(:name => "Reset")
  end

  def local_house
    @driver.find_element(:name => "#{$house}")
  end

  def tap_uk
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[contains(@name, 'UK')]")
  end

  def greek_St
    @driver.find_element(:name => "40 Greek Street")
  end

  def kettners
    @driver.find_element(:name => "Kettner's")
  end

  def save_changes
    @driver.find_element(:name => "Save changes")
  end

  def shoreditch_house
    @driver.find_element(:name => "Shoreditch House")
  end

  def little_house_mayfair
    @driver.find_element(:name => "Little House Mayfair")
  end

  def notification_pref_switch(link)
    @driver.find_element(:xpath => "//*[@name= '#{link}']/following-sibling::XCUIElementTypeSwitch")
  end

  def notification_pref_switch_value(link)
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name= '#{link}']/following-sibling::XCUIElementTypeSwitch").attribute("value")
  end

  def enquiry_type
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name = 'What type of enquiry do you have?']/parent::XCUIElementTypeCell/following-sibling::XCUIElementTypeCell/XCUIElementTypePicker/XCUIElementTypePickerWheel")
  end

  def enquiry_topic1

    # @driver.find_elements(:xpath => "//XCUIElementTypeStaticText[contains(@name,'the topic of your enquiry?')]")

    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[contains(@name, 'the topic of your enquiry?')]/parent::XCUIElementTypeCell/following-sibling::XCUIElementTypeCell/XCUIElementTypePicker/XCUIElementTypePickerWheel")

  end

  def enquiry_message

    @driver.find_element(:name => "Let us know what you need help with, or share your feedback")

  end

  def submit

    @driver.find_element(:name => "Submit")

  end

  def done
    @driver.find_element(:name => "Done")
  end

  def ElementsWithText(elementText)
    @driver.find_element(:xpath => "//XCUIElementTypeStaticText[@name = '#{elementText}']")
  end

end

class Android_Account_Objects

  def initialize(driver, driver_appium)
    @driver_appium = driver_appium
    @driver = driver
  end

  def navigate_up
    @driver.find_element(:accessibility_id => "Navigate up")
  end

  def homeBtn
    @driver.find_element(:xpath => "//android.view.ViewGroup//android.widget.FrameLayout[1]/android.widget.ImageView")
  end

  def profession_value1
    @driver.find_element(:xpath => "//android.widget.TextView[contains(@resource-id,'profile_occupation')]")
  end

  def city_value
    @driver.find_element(:xpath => "//android.widget.TextView[contains(@resource-id,'profile_city')]")
  end

  def industry_value
    @driver.find_element(:xpath => "//android.widget.TextView[contains(@text,'Industry')]/following-sibling::android.widget.TextView[1]")
  end

  def about_me_value
    @driver.find_element(:xpath => "//android.widget.TextView[contains(@text,'About me')]/following-sibling::android.widget.TextView[1]")
  end

  def interests_value
    @driver.find_element(:xpath => "//android.widget.TextView[contains(@text,'Interests')]/following-sibling::android.widget.TextView[1]")
  end

  def lets_chat_value
    @driver.find_element(:xpath => "//android.widget.TextView[contains(@text,'chat')]/following-sibling::android.widget.TextView[1]")
  end

  def instagram_value
    @driver.find_element(:accessibility_id => "Instagram")
  end

  def twitter_value
    @driver.find_element(:accessibility_id => "Twitter")
  end

  def linkedin_value
    @driver.find_element(:accessibility_id => "LinkedIn")
  end

  def spotify_value
    @driver.find_element(:accessibility_id => "Spotify")
  end

  def youtube_value
    @driver.find_element(:accessibility_id => "Youtube")
  end

  def website_value
    @driver.find_element(:accessibility_id => "Website")
  end

  def edit_profile
    @driver.find_element(:xpath =>"//android.widget.TextView[@text='Edit profile']")
  end

  def member_name
    # @driver.find_element(:name => "Accept")
  end

  def profession
    @driver.find_element(:xpath => "//android.widget.TextView[@text='What you do']")
  end

  def profession_input
    @driver.find_element(:xpath => "//android.widget.TextView[@text='What you do']/following-sibling::android.widget.TextView[1]")
  end

  def text_input
    @driver.find_element(:xpath => "//android.widget.EditText")
  end

  def large_text_input
    @driver.find_element(:id => "#{$currentPackage+':id'+'/freetext_bottomsheet_input'}")
  end

  def industry
    @driver.find_element(:xpath => "//android.widget.TextView[@text='Type of work']")
  end

  def industry_input
    @driver.find_element(:xpath => "//android.widget.EditText[@resource-id='android:id/numberpicker_input']")

  end
  def industry_input1
    @driver.find_element(:xpath => "//android.widget.EditText[@resource-id='android:id/numberpicker_input']/preceding-sibling::android.widget.Button")

  end

  def city
    @driver.find_element(:xpath => "//android.widget.TextView[@text='City']")
  end

  def aboutme
    @driver.find_element(:xpath => "//android.widget.TextView[@text='About me']")
  end

  def chat
    @driver.find_element(:xpath => "//android.widget.TextView[contains(@text, 'chat')]")
  end

  def interests
    @driver.find_element(:xpath => "//android.widget.TextView[@text='Interests']")
  end

  def profession_interests_remove
    @driver.find_elements(:id => "#{$currentPackage+':id'+'/pill_tv'}")
  end

  def profession_interests_input(interest)
    @driver.find_element(:xpath => "//android.view.ViewGroup[contains(@resource-id,'pill')]/android.widget.TextView[@text='"+interest+"']")
  end

  def interests_input1
    @driver.find_element(:id => "#{$currentPackage+':id'+'/edit_interests_search_input'}")
  end

  def social_accounts
    @driver.find_element(:xpath => "//android.widget.TextView[@text='Connect social accounts']")
  end

  def website_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text='Website']/following-sibling::android.widget.EditText")
  end

  def instagram_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text='Instagram']/following-sibling::android.widget.EditText")
  end

  def twitter_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text='Twitter']/following-sibling::android.widget.EditText")
  end

  def linkedin_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text='LinkedIn']/following-sibling::android.widget.EditText")
  end

  def spotify_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text='Spotify']/following-sibling::android.widget.EditText")
  end

  def youtube_text
    @driver.find_element(:xpath => "//android.widget.TextView[@text='YouTube']/following-sibling::android.widget.EditText")
  end

  def done
    @driver.find_element(:id => "#{$currentPackage+':id'+'/edit_profile_modal_done'}")
  end

  def account_title
    @driver.find_element(:xpath => "//android.widget.TextView[@text='View profile']")
    # @driver.find_element(:accessibility_id => "View profile")
  end

  def edit_profile_screen
    @driver.find_element(:id => "#{$currentPackage+':id'+'/menu_item_edit'}")
  end

  def your_membership
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Membership']")
  end

  def perks
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Perks']")
  end

  def houseperks_title
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'House Perks']")
  end

  def payment
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Payment']")
  end

  def past_bookings
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Past bookings']")
  end

  def change_password
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Change password']")
  end

  def favourite_houses

    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Favourite Houses']")
  end

  def house_preferences

    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'House preferences']")
  end

  def settings

    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Settings']")
  end

  def contact_us
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Contact us']")
  end

  def faq

    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'FAQ']")

  end

  def faq_header

    @driver.find_element(:xpath => "//*[@text='FAQ']")

  end

  def save_changes

    #@driver.find_element(:id => "#{$currentPackage+':id'+'/edit_profile_save_btn'}")
    @driver.find_element(:xpath => "//android.widget.Button[@text = 'Save changes']")
  end


  def policies

    @driver.find_element(:xpath => "//android.widget.TextView[contains(@text , 'Policies')]")

  end

  def sign_out
    @driver.find_element(:id => "#{$currentPackage+':id'+'/more_logout'}")
  end

  def sign_out_account
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Sign out']")
  end

  def icon_left
    @driver.find_element(:xpath => "//*[@content-desc = 'Navigate up' or @content-desc = 'Go back']")
  end

  def icon_back_header
    @driver.find_element(:xpath => "//android.widget.ImageButton[@index='0']")
  end

  def cancel_yes
    @driver.find_element(:id => "android:id/button1")
  end

  def notifications
    @driver.find_element(:xpath => "//android.widget.TextView[@text='Notifications']")
  end

  def notification
    @driver.find_element(:xpath => "//android.widget.TextView[@text='Notifications']")
  end

  def current_password
    @driver.find_element(:xpath => "//android.widget.EditText[@text='Current password']")
  end

  def current_password_input
    @driver.find_element(:xpath => "//android.widget.EditText[@text='Current password']")
  end

  def new_password_input
    @driver.find_element(:xpath => "//android.widget.EditText[@text='New password']")
  end

  def confirm_password_input
    @driver.find_element(:xpath => "//android.widget.EditText[@text='Confirm password']")
  end

  def save_btn

    @driver.find_element(:xpath => "//android.widget.Button[@text='Save']")

  end

  def password_update_dialog
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Password updated']")
  end

  def password_dialog_dismiss
    @driver.find_element(:xpath => "//android.widget.Button[@text = 'DISMISS']")
  end

  def membership
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Your membership']")
  end

  def your_bookings
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Bookings']")
  end

  def your_guest_invitation
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Guest Invitations']")
  end

  def create_guest_invitation
    @driver.find_element(:id => "#{$currentPackage+':id'+'/btnNewInvite'}")
  end

  def booking_history
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Booking history']")
  end

  def Legal
    @driver.find_element(:xpath => "//*[@text='Legal']")
  end

  def close
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Close']")
  end

  def payment_add
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Add payment method']")
  end

  def enquiry_type
    @driver.find_element(:xpath => "//*[@resource-id='inquiryType']")
  end

  def enquiry_type_options(input)
    @driver.find_element(:xpath => "//android.widget.CheckedTextView[contains(@text,'"+input+"')]")
  end

  def local_house
    @driver.find_element(:xpath => "//android.widget.TextView[@text ='#{$house}']")
  end

  def select_favourite (input)
    @driver.find_element(:xpath => "//android.widget.TextView[@text ='"+input+"']")
  end

  def tap_uk
    @driver.find_element(:xpath => "//android.widget.TextView[contains(@text ,'UK')]")
  end

  def greek_St
    @driver.find_element(:xpath => "//android.widget.TextView[@text = '40 Greek Street']")
  end

  def kettners
    @driver.find_element(:xpath => "//android.widget.TextView[contains(@text , 'Kettner')]")
  end

  def contact_name
    @driver.find_element(:xpath => "//*[@resource-id='name']")
  end

  def contact_name_text
    @driver.find_element(:xpath => "//*[@resource-id='name']")
  end

  def email_id
    @driver.find_element(:xpath => "//*[@resource-id='email']")

  end

  def enquiry_topic1

   @driver.find_element(:xpath => "//*[@resource-id='reason']")

  end

  def enquiry_topic_option(input)

    @driver.find_element(:xpath => "//*[@text='"+input+"']")


  end

  def enquiry_message

    @driver.find_element(:xpath => "//*[@resource-id='body']")

  end

  def confirm
    @driver.find_element(:xpath => "//*[@resource-id='default-layout']/android.view.View[1]/android.view.View[1]/android.view.View[3]/android.widget.CheckBox[2]")
  end

  def submit

    @driver.find_element(:xpath => "//android.widget.Button[@text = 'Submit']")

  end

  def confirm_message

    @driver.find_element(:xpath => "//*[@text='Back to home']")

  end

  def notification_pref_switch(link)
    @driver.find_element(:xpath => "//android.widget.TextView[@text = '#{link}']/following-sibling::android.widget.Switch")
  end

  def notification_pref_switch_value(link)
    @driver.find_element(:xpath => "//android.widget.TextView[@text = '#{link}']/following-sibling::android.widget.Switch").attribute("checked")
  end

  def switch_off_confirmation
    @driver.find_element(:xpath => "//android.widget.TextView[@text = 'Push notifications off']")
  end


  def ok_button
    @driver.find_element(:xpath => "//android.widget.Button[@text = 'OK']")
  end

  def notification_pref_notifType(link,notificationtype)
    @driver.find_element(:xpath => "//android.widget.TextView[@text = '#{link}']/following-sibling::android.widget.Switch[contains(@resource-id,'#{notificationtype}')]")
  end

  def notification_pref_notifType_value(link,notificationtype)
    @driver.find_element(:xpath => "//android.widget.TextView[@text = '#{link}']/following-sibling::android.widget.Switch[contains(@resource-id,'#{notificationtype}')]").attribute("checked")
    end

  def ElementsWithText(elementText)
      @driver.find_element(:xpath => "//android.widget.TextView[@text = '#{elementText}']")
  end

  def close_webview
    @driver.find_element(:id => "#{$currentPackage+':id'+'/close'}")
  end

end

