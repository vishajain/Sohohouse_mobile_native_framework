@Onboarding-screens
Feature: This is a feature to test On-boarding screens for iOS and Android

  Background: User logins with valid credentials
    Given app is launched
    And the user is on main screen
    And user enters valid email address and password

  @smoke @ios
  Scenario: Verify the onboarding screens
    Given I verify Welcome to Soho House is displayed after login
    When I verify the onboarding screens
      | Screen                   | Button                     |
      | Welcome to Soho House    | Continue                   |
      | House Pay                | Remind me later            |
      | Sync with your calendar  | Continue without syncing   |
      | Welcome to Soho House    | Next                       |
      | Make it personal         | Next                       |
      | Enable push notifications| I'd rather opt out         |
      | You're all set           | Next                       |
      | Introducing messaging    | Next                       |
      | Drop a note              | Done                       |
    And greetings should be visible
    Then the user signs out and closes the app

  @smoke @android
  Scenario: Android on-boarding screens
    When user sees the home screen
    Then the user signs out and closes the app
