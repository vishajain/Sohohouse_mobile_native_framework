require 'rubygems'
require 'cucumber'
require 'selenium-webdriver'
require 'test/unit/assertions'
require_relative '../support/drivers/base_driver'
require_relative '../library/home_screen'
require_relative '../library/whatson_screen'
require_relative '../pageobjects/whatson_objects'
require_relative '../pageobjects/home_objects'
require_relative '../../common/functions_common'

include Test::Unit::Assertions

When("user clicks on what's on button") do

    sleep 2
    $homescreen.verify_whatson_click
    $whatsonscreen = WhatsonScreen.new

end

Then("user sees what's on screen title") do

    sleep 2

    $whatsonscreen = WhatsonScreen.new

    assert_true($whatsonscreen.verify_whatson_title,"What's on title is not present")

end

Then("user sees what's on filter icon") do

    assert_true($whatsonscreen.verify_whatson_filter,"What's on filter is not present")


end

Then(/^(.*) button is visible/) do |button|

    assert_true($whatsonscreen.verify_whatson_options(button),  ""+button+"" +  "is not present" )

end

When("there are multiple events") do

  $whatsonscreen.verify_multiple_events

end

When(/^the paid (.*) event is found/) do |section|

  # $whatsonscreen.events_click(section)

  assert_true($whatsonscreen.find_paid_event(section),"Event not found")

end

When(/^the free (.*) event is found/) do |section|

  # $whatsonscreen.events_click(section)

  $whatsonscreen.find_free_event(section)

end

Then(/^the (.*) section is present/) do |section|

  assert_true($whatsonscreen.verify_member_section(section),"section not present")

end

Given("user sees how many tickets to buy question") do

  assert_true($whatsonscreen.verify_member_section("How many tickets would you like?"),"Tickets question not present")

end

When("user taps on buy tickets on event screen") do

  $whatsonscreen.book_member_event

end

When("user taps on invite guests on event screen") do

  $whatsonscreen.invite_guests_click

end

When("user taps on book tickets on event screen") do

  $whatsonscreen.book_free_member_event

end

When("user taps on book gym tickets on event screen") do

  $whatsonscreen.book_free_gym_event

end

When("user sees confirm payment screen") do

  assert_true($whatsonscreen.verify_member_section("Confirm payment"),"Confirm payment screen not displayed")

end

When("user taps on buy tickets on confirm payment screen") do

    $whatsonscreen.buy_tickets_click

end


Then("user sees you are on the guest list screen") do

  assert_true($whatsonscreen.verify_you_on_guest_list,"You are on the guest list screen not shown")

end

Then("user taps on OK button") do

  $whatsonscreen.ok_btn_click

end


Then("user sees the event booking status as you are on the guest list on event details screen") do

  assert_true($whatsonscreen.verify_guest_list_status_on_event_screen,"You are on the guest list status is not shown on the event details screen")

end


Then("user cancels the event booking") do

  assert_true($whatsonscreen.verify_cancel_booking, "Unable to cancel the booking")

end

Then("user navigates back to the events list") do

  $whatsonscreen.navigate_to_events_list

end

Given(/^user sees the (.*) tab/) do |section|

  assert_true($whatsonscreen.scroll_to_top(section), "Unable to find the #{section} tab")

end

And(/^tap on (.*) tab and set filter/) do |section|

  $accountscreen = AccountScreen.new



  if !(($filterEvent.to_s).include?section) or $device=="android"

    $common_screen.swipe_top
    $whatsonscreen.events_click(section)


  end

  if !(($filterEvent.to_s).include?section) or (section.include?"Gym" and $device == "android")

    $whatsonscreen.setFilterLocation

    $filterEvent=section

  end

end

And("user sees confirm deposit screen") do

  assert_true($whatsonscreen.verify_member_section("Confirm deposit"),"Confirm deposit screen not displayed")

end

And("user taps on Confirm deposit on confirm deposit screen") do

  $whatsonscreen.confirm_deposit_click

end

When("user taps on buy tickets on screening event screen") do

  $whatsonscreen.book_screening_event

end

When("user taps on buy tickets on gym event screen") do

  $whatsonscreen.book_gym_event

end

Then("user sees Guest 1 on you are on the guest list screen") do

  assert_true($whatsonscreen.verify_content("Guest 1"),"Guest 1 not shown")

end

Then("user see Guest 1 under Guests up to section") do

  assert_true($whatsonscreen.verify_content("Guest 1"),"Guest 1 not shown")

end

Then("user sees the event booking status as you and 1 guest going on event details screen") do

  assert_true($whatsonscreen.verify_content("YOU AND 1 GUEST(S) ARE GOING"),"You and 1 guests going status not shown")

end

When("user cancels Guest 1 booking") do

  $whatsonscreen.cancel_guest_booking

end

Then("Guest 1 booking should be cancelled") do

  assert_true($whatsonscreen.verify_guest_list_status_on_event_screen,"You are on the guest list status is not shown on the event details screen")

end


When("user taps on the filter") do

  $whatsonscreen.filter_click

end

And("user selects Soho House Berlin house") do

  $whatsonscreen.soho_berlien_click

end

Then("user should see the events of Soho House Berlin only") do

  assert_true($whatsonscreen.results_check, "Filter not working as expected")

end

And(/^I navigate to what's on screen$/) do

  sleep 5

  $homescreen.verify_whatson_click

end

And(/^I click on the below "([^"]*)" of "([^"]*)" and book "([^"]*)" tickets with "([^"]*)"$/) do |event_name,event_type,ticket_no, button_name|

  assert_true($whatsonscreen.click_and_book_ticket(event_name,event_type, button_name, ticket_no),"Ticket not Booked")

  $scenario.setContext("ticket_no",ticket_no)

end

Then(/^I should be able to successfully book event for member with status "([^"]*)"$/) do |status|

  assert_true($whatsonscreen.verify_booking_status(status),"Incorrect Booking Status")

  $whatsonscreen.back_from_events

end

Then(/^I navigate to home screen$/) do

  $accountscreen = AccountScreen.new

  $accountscreen.home_screen_navigate

end

And(/^I verify that "([^"]*)" is displayed under Events in "([^"]*)" page$/) do |event_name, tab|

  $homescreen.clickElement(tab)

  $accountscreen.verify_elementDisplayed(tab)

  assert_true($accountscreen.verify_elementDisplayed(event_name),"Event not booked")

  $homescreen.clickElement(event_name)

end

When(/^I cancel the above booked event$/) do
  $accountscreen=AccountScreen.new
  $common_screen=CommonScreen.new

  $whatsonscreen.cancel_event

  sleep 2

  $whatsonscreen.back_from_events

  sleep 2

  $accountscreen.navigate_back_to_account
  sleep 1

end

When(/^I book (.*) ticket for guests  and verify status for the "([^"]*)" of "([^"]*)"$/) do |guest_ticket_no, event_name,event_type|
  $common_screen=CommonScreen.new

  if guest_ticket_no!="NA" and guest_ticket_no.to_i>0

    for i in 1..(guest_ticket_no.to_i) do

      $whatsonscreen.inviteGuest(event_type,1)
      sleep 2

      $device=="android"?($common_screen.click_element_with_text(event_name)):(sleep 1)


      sleep 2

      $device=="android"?($common_screen.click_element_with_text(event_name)):(sleep 1)

      if event_type.include?"lottery"

        $device == "ios"?($whatsonscreen.verify_booking_status( "YOU HAVE JOINED THE LOTTERY")):($whatsonscreen.verify_booking_status("You have joined the lottery"))

      else

        $whatsonscreen.verify_booking_status("You and "+i.to_s)
      end

    end

  elsif guest_ticket_no!="NA" and guest_ticket_no.to_i<0

    for i in 1..(guest_ticket_no.to_i*(-1)) do

      $whatsonscreen.decreaseGuest

    end

    ticket_no=$scenario.getContext("ticket_no")

    if ticket_no.to_i+guest_ticket_no.to_i>1

      $whatsonscreen.verify_booking_status("YOU AND "+(ticket_no.to_i+guest_ticket_no.to_i-1).to_s+" GUEST(S) ARE GOING")

    elsif ticket_no.to_i+guest_ticket_no.to_i==1

      $whatsonscreen.verify_booking_status("YOU'RE ON THE GUEST LIST")

    end

  end

end

And(/^I "([^"]*)" for "([^"]*)" of "([^"]*)"$/) do |button_name, event_name, event_type|

  assert_true($whatsonscreen.click_and_book_ticket(event_name,event_type,button_name,"NA"),"Ticket not Booked")

end
