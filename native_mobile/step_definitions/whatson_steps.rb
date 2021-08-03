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

  assert_true($whatsonscreen.find_paid_event(section),"Event not found")

end

When(/^the free (.*) event is found/) do |section|

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

   $filterEvent.to_s===""
  $accountscreen = AccountScreen.new

if !(($filterEvent.to_s).include?section) or $device=="ios"


    $common_screen.swipe_top
    $whatsonscreen.events_click(section)

  end

  if !(($filterEvent.to_s).include?section) or  $filterEvent.to_s===""

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
  sleep 3
  $accountscreen = AccountScreen.new

  $accountscreen.home_screen_navigate

end

And(/^I verify that "([^"]*)" is displayed under Events in "([^"]*)" page$/) do |event_name, tab|

  $device=="ios"?():$common_screen.little_swipe_down

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

      sleep 1
      $whatsonscreen.inviteGuest(event_type,1)

      sleep 2

      $device=="android"?($common_screen.click_element_with_text(event_name)):()

      if event_type.include?"lottery"

        $whatsonscreen.verify_booking_status("You have joined the lottery")

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

Then(/^I verify ([^"]*) is visible$/) do |arg|

  assert_true($common_screen.verify_element_displayed_with_text(arg),arg+" is not visble")

end

And(/^I choose below options before browsing bedrooms$/) do |table|

  $common_screen.find_element{$common_screen.click_element_with_text("Browse bedrooms")}
  $whatsonscreen=WhatsonScreen.new
  data = table.hashes
  data.each do |row|
    row.each do |key,value|
      if key == "Location"
        sleep 10
        $common_screen.click_element_with_partial_text("Select location")
        $whatsonscreen.select_house(value.split(",")[0],value.split(",")[1])
      elsif key == "Dates"
        $whatsonscreen.select_date(value.split("=>")[0].gsub('currentDate + ',""),value.split("=>")[1].gsub('currentDate + ',""))
      elsif key == "Guests"
        $scenario.setContext('noOfGuest',value)
        $whatsonscreen.select_guest(value.split(" ")[0])
      end
    end
  end

end

When(/^I click on Browse bedrooms and (continue bookings|select bedroom type)$/) do |options|
  $whatsonscreen.click_browse_bedroom
  if options.include?"continue bookings"
    $common_screen.click_element_with_text("Continue search")
  else
    sleep 10
    $whatsonscreen.verify_full_house_not_displayed
    $whatsonscreen.click_select_bedroom
  end
end

Then(/^I verify that I am taken to synxis website$/) do
  $common_screen.verify_element_displayed_with_text("Select a Room")
end

Then(/^I verify and save booking details in availability page$/) do

  assert_true($common_screen.verify_element_displayed_with_text("Guests: "+$scenario.getContext("noOfGuest")))
  $whatsonscreen.verify_date_room

end

And(/^I click on book bedroom$/) do
  sleep 2
  $whatsonscreen.saveDepositAmount
  $common_screen.click_element_with_text("Select bedroom")
end

Then(/^I verify below booking details matches the above saved details$/) do
  sleep 2
  $whatsonscreen.clickonDeposit
  $common_screen.verify_element_displayed_with_text("Guests: "+$scenario.getContext("noOfGuest"))
  $whatsonscreen.verify_date_room
  $whatsonscreen.verify_room_type
  $whatsonscreen.clickonDeposit

end

And(/^I book and pay using existing card$/) do
  $common_screen.find_element{$common_screen.click_element_with_text("Terms and conditions")}
  $whatsonscreen.accept_TnC
  $common_screen.click_element_with_text("Book and pay")
end

And(/^I verify and save booking details in summary page$/) do |option|

  data = option.hashes
  data.each do |row|
    row.each do |key,value|
      $whatsonscreen.verifySaveBookingSummary(key.strip)
    end
  end

end

And(/^I cancel the above booking room from Booking page$/) do
  $accountscreen.navigate_back_to_account
  $whatsonscreen.cancel_room_booking
end

Then(/^I verify the "([^"]*)" is not displayed under Booking page$/) do |arg1|
  assert_false($common_screen.verify_element_displayed_with_text(arg1),"Room Booking not cancelled")
  $accountscreen.navigate_back_to_account
end

When(/^I cancel the above booking room from confirmation page$/) do
  $whatsonscreen.cancel_room_booking
end

When(/^I remove existing (visa|master|amex) cards via API$/) do |type|
  $scenario.setContext("cardType",type)
  cards=$whatsonscreen.getCardTypeViaAPI(type)
  if cards.length == 0
    print 'No payment cards added for the account'
  else
      deletedCardsResponse = $whatsonscreen.removeAllExistingCardsViaAPI(cards)
  end
end

And(/^I book and pay using new card$/) do
  $scenario.getContext("cardType")
  $common_screen.click_button_with_text("Add payment method")
  $whatsonscreen.add_payment_details($scenario.getContext("cardType"))
  sleep 2
  $common_screen.find_element{$common_screen.click_element_with_text("Terms and conditions")}
  $whatsonscreen.accept_TnC
  $common_screen.click_element_with_text("Book and pay")
end

And(/^I clicked on Shop link & verify the shopLinks$/) do |table|

  sleep 2

  data = table.hashes

  data.each do |row|

    row.each do |key,value|
      sleep 2
      if key.eql?"Links"
        assert_true($common_screen.find_element{$common_screen.click_element_with_text(value)},value+" is not clicked")
      elsif key.eql?"Title"
        sleep 5
        assert_true($common_screen.find_element{$common_screen.verify_element_displayed_with_partial_text(value)},value+" is not displayed")
        $whatsonscreen.back_to_shop_page
        sleep 1
      end
    end
  end
  assert_true($common_screen.find_element{$common_screen.click_element_with_text("sideMenuClose")},"sideMenuClose is not clicked")
end