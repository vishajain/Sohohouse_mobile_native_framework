@roomBookings @regression
Feature: Room bookings
  As a member
  I navigate to Stay with us
  so that I can book rooms for houses

  Background:
     Given greetings should be visible
     Then I navigate to Book page
     And I click on the Bedrooms
     And I verify Stay with us is visible


  @smoke_to_fix
  Scenario: Verify member can book and cancel bedrooms
    When I choose below options before browsing bedrooms
      | Location               | Dates                                | Guests  |
      | UK,Redchurch Townhouse | currentDate + 4 => currentDate + 5 | 2 adults |
    And I click on Browse bedrooms and select bedroom type
    Then I verify and save booking details in availability page
    And I click on book bedroom
    Then I verify below booking details matches the above saved details
    And I book and pay using existing card
    And I verify and save booking details in summary page
       | Booking Details     | Amend Booking        | Cancel Booking        |Confirmation Number   |
       | <booking_details>   | <amend_booking_text> | <cancel_booking_text> | <confirmation_number> |
    And I navigate back
    And I click on Account button on home screen
    And I verify that "Redchurch Townhouse" is displayed under Events in "Bookings" page
    And I cancel the above booking room from Booking page
    Then I verify the "Redchurch Townhouse" is not displayed under Booking page
    Then I navigate to Home page

  Scenario: Verify member can book and cancel bedrooms
    When I choose below options before browsing bedrooms
      | Location          | Dates                                | Guests  |
      | UK,Soho Farmhouse | currentDate + 25 => currentDate + 26   | 2 adults |
    And I click on Browse bedrooms and select bedroom type
    And I verify and save booking details in availability page
    And I click on book bedroom
    And I verify below booking details matches the above saved details
    And I book and pay using existing card
    And I verify and save booking details in summary page
       | Booking Details     | Amend Booking        | Cancel Booking        | Confirmation Number   |
       | <booking_details>   | <amend_booking_text> | <cancel_booking_text> | <confirmation_number> |
    And I cancel the above booking room from confirmation page
    Then I navigate to Home page



  Scenario: Verify member can book and cancel bedrooms
    Given I remove existing master cards via API
    When I choose below options before browsing bedrooms
      | Location               | Dates                                | Guests  |
      | UK,Redchurch Townhouse | currentDate + 4 => currentDate + 5   | 2 adults |
    And I click on Browse bedrooms and select bedroom type
    Then I verify and save booking details in availability page
    And I click on book bedroom
    Then I verify below booking details matches the above saved details
    And I book and pay using new card
    And I verify and save booking details in summary page
      | Confirmation Number   |
      | <confirmation_number> |
    And I cancel the above booking room from confirmation page
    Then I navigate to Home page