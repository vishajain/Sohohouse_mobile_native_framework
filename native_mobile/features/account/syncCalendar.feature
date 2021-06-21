@sync-Calendar-screen @ios  @regression
Feature: This feature enables us to test the sync calendar functionality


  @smoke @sync_calendar
  Scenario: Validate sync calendar
    Given greetings should be visible
    When I click on Account button on home screen
    And I tap on settings
    And I navigate to Sync calendar in Settings tab
    When the user taps on sync and verifies the popup message
    And I navigate back to accounts
    Then I navigate to Home page