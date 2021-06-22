@roomBookings @regression
Feature: Stay with us
  As a member
  I navigate to Stay with us
  so that I can see rooms availability


  @smoke
  Scenario: Verify member taken to synxis website while browsing bedrooms
    Given greetings should be visible
    When I navigate to Book page
    And I click on the Bedrooms
    And I verify Stay with us is visible
    And I choose below options before browsing bedrooms
      | Location                   | Dates                              | Guests   |
      | Europe,Soho House Istanbul | currentDate + 6 => currentDate + 7 | 3 adults |
    And I click on Browse bedrooms and continue bookings
    And I verify that I am taken to synxis website
    And I navigate back
    Then I navigate to Home page
