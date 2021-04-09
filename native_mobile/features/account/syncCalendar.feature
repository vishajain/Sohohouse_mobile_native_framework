@sync-Calendar-screen
Feature: This feature enables us to test the sync calendar functionality

  Background:
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @smoke @sync_calendar
  Scenario: Validate sync calendar
    Given username is visible
    And I click on Account button on home screen
    And I tap on settings
    And I navigate to Sync calendar tab
    When the user taps on sync and verifies the popup message
    Then I navigate back and sign out of the app