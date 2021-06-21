require 'rubygems'
require 'cucumber'
require 'selenium-webdriver'
require 'test/unit/assertions'
require_relative '../support/drivers/base_driver'
require_relative '../library/home_screen'
require_relative '../library/account_screen'
require_relative '../library/guestInvitation_screen'
require_relative '../pageobjects/home_objects'
require_relative '../pageobjects/onboarding_objects'
require_relative '../../common/functions_common'
require_relative '../../common/scenarios_contexts'
require_relative '../../common/common_screen'

include Test::Unit::Assertions

And(/^user create a Guest invitation for "([^"]*)"$/) do |arg|
  $common_screen=CommonScreen.new
  $guestinvitationscreen = GuestInvitationScreen.new
  assert_true($guestinvitationscreen.new_guest_invitation(arg),"Couldn't create the invitation")
  assert_true($guestinvitationscreen.add_guest,"Couldn't add the guest")

end

Then(/^user should see an invitation under guest invitations for "([^"]*)"$/) do |arg|

  $accountscreen = AccountScreen.new

  $homescreen.verify_account_click

  $device == "ios"?text="Guest invitations":text="Guest Invitations"

  assert_true($homescreen.clickElement(text),"The Element not clicked")

  assert_true($guestinvitationscreen.confirm_invitation(arg),"Invitation not created")

  $accountscreen.navigate_back_to_account

  $accountscreen.navigate_to_home


end

And(/^Navigate to home screen$/) do

  assert_true($homescreen.home_screen_navigate,"Unable to navigate to home screen")

end

Then(/^user confirms existing invitations deleted$/) do |table|

  $homescreen=HomeScreen.new

  $device == "ios"?text="Guest invitations":text="Guest Invitations"

  assert_true($homescreen.clickElement(text),"The Element not clicked")

  data = table.hashes
  data.each do |row|
    row.each do |key,value|
      assert_false($guestinvitationscreen.confirm_invitation(value[1].to_s), "Invitation not deleted")
    end
  end

  $accountscreen.navigate_back_to_account

end

When(/^user click on the "([^"]*)"$/) do |arg|

  $homescreen=HomeScreen.new
  assert_true($homescreen.clickElement(arg),"The Element not clicked")

end

And(/^user delete the existing invitations$/) do

  $guestinvitationscreen = GuestInvitationScreen.new

  assert_true($guestinvitationscreen.deleteInvitation,"Invitations not deleted")

end

When(/^user verifies no existing guest invitations are present$/) do
  $accountscreen = AccountScreen.new

  $whatsonscreen = WhatsonScreen.new

  $homescreen = HomeScreen.new

  $common_screen = CommonScreen.new

  $guestinvitationscreen = GuestInvitationScreen.new

  $homescreen.verify_account_click

  $device == "ios" ?text="Guest invitations":text="Guest Invitations"

  assert_true($homescreen.clickElement(text),"Guest Invitations not clicked")

  assert_true($guestinvitationscreen.deleteInvitation,"Invitations not deleted")

  $accountscreen.navigate_to_home

end

And(/^I navigate back$/) do
  sleep 2
  $accountscreen.navigate_back_to_account
end

And(/^user click on the Guest Invitations$/) do

  $homescreen=HomeScreen.new

  $device == "ios"?text="Guest invitations":text="Guest Invitations"

  assert_true($homescreen.clickElement(text),"The Element not clicked")

end
