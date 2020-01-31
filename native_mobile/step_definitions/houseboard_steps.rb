require 'rubygems'
require 'cucumber'
require 'selenium-webdriver'
require 'test/unit/assertions'
require_relative '../support/drivers/base_driver'
require_relative '../library/houseboard_screen'
require_relative '../library/home_screen'
require_relative '../library/account_screen'
require_relative '../pageobjects/home_objects'
require_relative '../pageobjects/account_objects'
require_relative '../../common/functions_common'

include Test::Unit::Assertions


When("user taps on blackslate to view the blackslate screen") do

    sleep 4

    $homescreen.verify_blackslate_screen

    $blackslatescreen = BlackslateScreen.new

end


Then("blackslate screen is opened") do

    sleep 2

    $blackslatescreen = BlackslateScreen.new

    assert_true($blackslatescreen.verify_house_name,"House name not shown on the houseboard screen")

end


Then("user taps on house name to navigate to browse houses screen") do

    sleep 2

    assert_true($blackslatescreen.verify_house_name_click,"Unable to navigate to Browse houses screen")

end


Then("user taps on membership card to navigate to membership card screen") do

  sleep 2

  assert_true($blackslatescreen.verify_membership_card,"Unable to navigate to membership card screen")

end


Then("user taps on book a bedroom to see bedrooms screen") do

  sleep 2

  assert_true($blackslatescreen.verify_book_a_bedroom,"Unable to navigate to book a bedroom screen")

end


Then("user taps on contact a house link to see contact a house screen") do

  sleep 2

  assert_true($blackslatescreen.verify_contact_a_house,"Unable to navigate to Contact a house screen")

  sleep 5

end


Then("user taps on house rules link to see house rules") do

  sleep 2

  assert_true($blackslatescreen.verify_house_rules,"Unable to navigate to house rules screen")

  sleep 5

end

Then("member is not on home screen from blackslate screen") do

  assert_true($blackslatescreen.home_screen_navigate,"Unable to navigate to home screen")

end

Given("user sees Upcoming bookings") do

    assert_true($blackslatescreen.verify_upcoming_bookings,"Upcoming bookings section is not present")


end


Then("user sees the events under upcoming bookings") do

  begin

    assert_true($blackslatescreen.verify_upcoming_bookings_events,"Events not present under upcoming bookings section")

  rescue StandardError => e

    puts e.message

  end

end

Then("user sees the status of the event as YOU'RE ON THE GUEST LIST") do

  begin

    assert_true($blackslatescreen.verify_event_status,"Status is not set to You re on the guest list")

  rescue StandardError => e

    puts e.message

  end

end

Given("user sees multiple events") do

  begin

    assert_true($blackslatescreen.verify_multi_events_present,"Status is not set to You re on the guest list")

  rescue StandardError => e

    puts e.message

  end

end

Then("user is able to scroll left to view the multiple events") do

  assert_true($blackslatescreen.verify_scroll_left,"Swipe left of the events is not working")

end

Then("user sees maximum of seven events upon scrolling to the left") do

  assert_true($blackslatescreen.verify_max_seven_events,"Upcoming bookings section is holding more than seven events")

end