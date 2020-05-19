@Favourite-Houses-screen
Feature: This feature enables us to test the sync calendar functionality

  Background:

  @login-ex
  Scenario: User Logins to the app
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @smoke @regression @favourite_houses
  Scenario: User adds a house to his list of favourite houses
    Given username is visible
    And user clicks on Account button on home screen
    When the user adds a new favourite house
    Then the added house is shown on favourite houses list