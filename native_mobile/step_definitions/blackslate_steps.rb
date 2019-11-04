require 'rubygems'
require 'cucumber'
require 'selenium-webdriver'
require 'test/unit/assertions'
require_relative '../support/drivers/base_driver'
require_relative '../library/blackslate_screen'
require_relative '../library/home_screen'
require_relative '../library/account_screen'
require_relative '../pageobjects/home_objects'
require_relative '../pageobjects/account_objects'
require_relative '../../common/functions_common'

include Test::Unit::Assertions


When("user taps on blackslate to view the blackslate screen") do

    sleep 2

    $homescreen.verify_blackslate_screen

    $blackslatescreen = BlackslateScreen.new

end


Then("blackslate screen is opened") do

    sleep 2

    $blackslatescreen = BlackslateScreen.new

    assert_equal($blackslatescreen.verify_house_name,"Little Beach House Barcelona", "Unable to open the blackslate")

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

  sleep 5

end


Then("user taps on contact a house link to see contact a house screen") do

  sleep 2

  assert_true($blackslatescreen.verify_contact_a_house,"Unable to navigate to Contact a house screen")

  sleep 5

end


Then("user taps on house rules to see house rules screen") do

  sleep 2

  assert_true($blackslatescreen.verify_house_rules,"Unable to navigate to house rules screen")

  sleep 5

end

Then("navigate back to home screen") do
  $homescreen.verify_blackslate_screen
end
