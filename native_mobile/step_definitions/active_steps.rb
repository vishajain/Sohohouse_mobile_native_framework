require 'rubygems'
require 'cucumber'
require 'selenium-webdriver'
require 'test/unit/assertions'
require_relative '../support/drivers/base_driver'
require_relative '../library/home_screen'
require_relative '../library/whatson_screen'
require_relative '../library/account_screen'
require_relative '../library/active_screen'
require_relative '../pageobjects/home_objects'
require_relative '../pageobjects/account_objects'
require_relative '../pageobjects/whatson_objects'
require_relative '../../common/functions_common'

include Test::Unit::Assertions



When(/^user enters (.*) as email address$/) do |email_address|

  $homescreen  = HomeScreen.new
  $whatsonscreen = WhatsonScreen.new
  $accountscreen = AccountScreen.new
  $activescreen = ActiveScreens.new

  $activescreen.user_enters_email_address(email_address)

end


And("user enters password") do

  $activescreen.user_enters_password

end

Then("user sees the status as Active members only") do

  assert_true($activescreen.verify_active_members_only,"The status is not set to Active members only")

end


Then("user sees the status as House members only") do

  assert_true($activescreen.verify_house_members_only,"The status is not set to House members only")

end

Then("user sees the soho warehouse Active location") do

  assert_true($activescreen.verify_soho_warehouse_location,"Location is not set to Soho Warehouse")

end

Then("user sees the Find out more button") do

  assert_true($activescreen.verify_find_out_more_btn,"Find out more button is not shown")

end

When("user taps on the symbol beside Active members only") do

  $activescreen.tap_active_members

end

Then(/^user sees (.*) slate$/) do |content|

  assert_true($activescreen.verify_content_displayed(content), "Unable to open Active mebership slate")

end

Then(/^user sees (.*) section$/) do |content|

  assert_true($activescreen.verify_content_displayed(content), "Unable to see #{content} section")

end


Then(/^user sees (.*) link$/) do |content|

  assert_true($activescreen.verify_content_displayed(content), "Unable to see #{content} section")

end

Then("user closes the Active membership slate slate") do

  $whatsonscreen.cancel_guest_booking

end

Given("user taps on Find out more button") do

  $activescreen.tap_find_out_more

end

When(/^user tap on (.*) link$/) do |link|

  $activescreen.tap_link(link)

end


Then(/^user sees (.*) form$/) do |content|

  assert_true($activescreen.verify_content_displayed(content), "Unable to see #{content} screen")

end

Then(/^user sees enquiry type as Membership enquiry$/) do

  assert_true($activescreen.verify_membership_enquiry, "Unable to see enquiry type")

end

Then(/^user sees enquiry topic as Add Active membership$/) do

  assert_true($activescreen.verify_add_active_membership, "Unable to see enquiry topic")

end

Then("user tap on back button") do

  $activescreen.tap_left_btn

end

Then("user sees the Book & Pay button") do

  assert_true($whatsonscreen.verify_book_and_pay_displayed, "Book and pay not displayed")

end

Given("user taps on Get it free button") do

  $whatsonscreen.tap_get_it_free

end

Then("user taps on OK on alert screen") do

  $activescreen.tap_ok

end


Then("user taps on the Submit button") do

  $activescreen.tap_submit

end