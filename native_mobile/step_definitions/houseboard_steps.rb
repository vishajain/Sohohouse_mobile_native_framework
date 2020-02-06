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


Then("houseboard screen is shown") do

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

  begin

    assert_true($blackslatescreen.verify_upcoming_bookings,"Upcoming bookings section is not present")

  rescue StandardError => e

    puts "Upcoming bookings section is not present"

    @upcomingBookingsSection = "Upcoming bookings section Not Present"

    puts e.message

  end

end


Then("user sees the events under upcoming bookings") do

    if @upcomingBookingsSection  !=  "Upcoming bookings section Not Present"

       assert_true($blackslatescreen.verify_upcoming_bookings_events,"Events not present under upcoming bookings section")

    else

      skip_this_scenario

    end

end

Then("user sees the status of the event as YOU'RE ON THE GUEST LIST") do

  if @upcomingBookingsSection  !=  "Upcoming bookings section Not Present"

    assert_true($blackslatescreen.verify_event_status,"Status is not set to You re on the guest list")

  else

    skip_this_scenario

  end

end

Given("user sees multiple events") do

  if @upcomingBookingsSection  !=  "Upcoming bookings section Not Present"

    assert_true($blackslatescreen.verify_multi_events_present,"Status is not set to You re on the guest list")

  else

    skip_this_scenario

  end

end

Then("user is able to scroll left to view the multiple events") do

  if @upcomingBookingsSection  !=  "Upcoming bookings section Not Present"

     assert_true($blackslatescreen.verify_scroll_left,"Swipe left of the events is not working")

  else

    skip_this_scenario

  end

end

Then("user sees maximum of seven events upon scrolling to the left") do

  if @upcomingBookingsSection  !=  "Upcoming bookings section Not Present"

    assert_true($blackslatescreen.verify_max_seven_events,"Upcoming bookings section is holding more than seven events")

  else

    skip_this_scenario

  end

end

And("user taps on the first event") do

  if @upcomingBookingsSection  !=  "Upcoming bookings section Not Present"

    $blackslatescreen.tap_first_event

  else

    skip_this_scenario

  end

end

Then("user is navigated to the event details screen") do

  if @upcomingBookingsSection  !=  "Upcoming bookings section Not Present"

    sleep 1

    assert_true($blackslatescreen.verify_event_details_screen_navigation,"Upcoming bookings section is holding more than seven events")

  else

    skip_this_scenario

  end

end

When("user is navigated back") do

  if @upcomingBookingsSection  !=  "Upcoming bookings section Not Present"

     $blackslatescreen.tap_navigate_back

  else

    skip_this_scenario

  end

end

Given("user sees See all button") do

  if @upcomingBookingsSection  !=  "Upcoming bookings section Not Present"

    begin

      sleep 1

      assert_true($blackslatescreen.verify_see_all_button,"See all button not present")

    rescue StandardError => e

      puts e.message

      puts "See all button not present"

      $seeAllBtn  =  "See all Not Present"

    end

  else

    skip_this_scenario

  end

end

When("user taps on See all button") do

  if $seeAllBtn  !=  "See all Not Present"

    $blackslatescreen.tap_see_all_btn

  else

    skip_this_scenario

  end

end

Then("user is navigated to the my bookings screen") do

  if $seeAllBtn  !=  "See all Not Present"

    assert_true($blackslatescreen.verify_my_bookings,"User not navigated to My bookings screen")

  else

    skip_this_scenario

  end

end

When("user is navigated back from my bookings screen") do

  puts $seeAllBtn

  if $seeAllBtn  !=  "See all Not Present"

    $blackslatescreen.tap_navigate_back

  else

    skip_this_scenario

  end

end

Then("user sees houseboard screen") do

  if @upcomingBookingsSection  !=  "Upcoming bookings section Not Present"

    assert_true($blackslatescreen.verify_house_name,"House name not shown on the houseboard screen")

  else

    skip_this_scenario

  end

end

Then(/^user sees (.*) under upcoming bookings/) do |event|

  assert_true($blackslatescreen.verify_planner_booking_event(event),"My planner booking is not present on the houseboard screen")

end