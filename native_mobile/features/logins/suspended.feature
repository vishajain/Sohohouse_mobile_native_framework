@suspended-screen
Feature: This is a feature to test suspended login for iOS and Android

  @smoke
  Scenario: User tries to login with suspended account
    Given app is launched
    And the user is on main screen
    And user enters suspended as email address
    And user clicks on go button
    Then user is shown with a suspended validation message