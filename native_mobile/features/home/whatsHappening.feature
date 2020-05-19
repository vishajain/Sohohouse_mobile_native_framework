@whatsHappening-homeScreen
Feature: Happening Now Carousel on Home Screen

  Background:

  @smoke @login-ex
  Scenario: Pre-requisite for home screen testing
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @smoke
  Scenario: Validate home screen header
    Given greetings should be visible
    And the user selects a favourite house for carousel
    When user taps on LHM Member Event carousel
    Then user navigates to LHM Member Event details screen
    And user goes back to the home screen
    When user taps on LHM Gym Event carousel
    Then user navigates to LHM Gym Event details screen
    And user goes back to the home screen
    Then user resets the favourite houses
    #    Then user books the event
