@whatsHappening-homeScreen @regression
Feature: Happening Now Carousel on Home Screen

  @smoke
  Scenario: Set Favourite House
    Given greetings should be visible
    When user selects a favourite house

  @smoke
  Scenario: Validate home screen header
    Given greetings should be visible
    And the user verifies Monty Python and the Holy Grail on home screen
    And user books the ticket for lottery event and verifies the booking status
    And user cancels the event booking of Monty Python and the Holy Grail
    Then user goes back to the home screen

  @smoke
  Scenario: Validate home screen header
    Given greetings should be visible
    When the user verifies Test Gym Event on home screen
    And user books the ticket for ticket-less event and verifies the booking status
    And user cancels the event booking of Test Gym Event
    And user goes back to the home screen

    @smoke
  Scenario: Reset Favourite House
    Given user resets the favourite houses
    Then I navigate to Home page
    
