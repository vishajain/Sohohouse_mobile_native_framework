@whatsHappening-homeScreen
Feature: Happening Now Carousel on Home Screen

  @smoke @login-ex
  Scenario: Pre-requisite for home screen testing
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @smoke
  Scenario: Validate home screen header
    Given greetings should be visible
    When user selects a favourite house
    And the user verifies Automation Screening on home screen
    And user books the ticket for lottery event and verifies the booking status
    And user cancels the event booking of Automation Screening
    Then user goes back to the home screen

  @smoke
  Scenario: Validate home screen header
    Given greetings should be visible
    When the user verifies Test Gym Event on home screen
    And user books the ticket for ticket-less event and verifies the booking status
    And user cancels the event booking of Test Gym Event
    And user goes back to the home screen
    Then user resets the favourite houses
