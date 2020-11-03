@houseBoard-screen
Feature: This feature enables us to test the house board functionality

  Background:
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @smoke @house_board
  Scenario: Validate Houseboard navigation
    Given username is visible
    When user taps on blackslate to view the blackslate screen
    And houseboard screen is shown
    And the user verifies all the links under houseboard screen
    Then the user signs out and closes the app
