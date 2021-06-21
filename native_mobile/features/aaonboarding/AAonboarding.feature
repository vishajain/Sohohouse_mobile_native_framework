@Onboarding-screens @regression
Feature: This is a feature to test On-boarding screens for iOS and Android

  @smoke @ios
  Scenario: Verify the on-boarding screens
    Given I verify Welcome to Soho House is displayed after login
    When I verify the onboarding screens
      | Screen                   | Button                     |
      | Welcome to Soho House    | Continue                   |
      | Sync with your calendar  | Continue without syncing   |
      | Welcome to Soho House    | Next                       |
      | Make it personal         | Next                       |
      | Enable push notifications| I'd rather opt out         |
      | You're all set           | Next                       |
    And I click on Connect tab
    And I verify the onboarding screens
      | Screen                       | Button   |
      | Update your profile          | Next     |
      | Personalised recommendations | Next |
      | Personalised recommendations | Next |
      | Connect with more Members    | Dismiss |
    And I navigate to Home page
    Then greetings should be visible


  @smoke @android
  Scenario: Android on-boarding screens
    Given user sees the home screen
