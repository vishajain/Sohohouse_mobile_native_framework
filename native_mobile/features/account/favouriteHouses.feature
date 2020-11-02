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
    When the user adds below favourite houses and clicks save button
      | Location | Houses               |
      | Europe   | Soho House Amsterdam |
    And I verify "Soho House Amsterdam" is displayed
    Then the user signs out and closes the app