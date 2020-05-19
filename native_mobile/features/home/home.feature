@home-screen
Feature: Home Screen all sections validation

  @smoke
  Scenario: Pre-requisite for home screen testing
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password
    And user sees all the sections on home screen
    Then the user signs out and closes the app

