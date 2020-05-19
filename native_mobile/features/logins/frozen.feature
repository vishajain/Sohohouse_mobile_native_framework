@frozen-screen
Feature: This is a feature to test frozen login for iOS and Android

  @smoke
  Scenario: User tries to login with frozen account
    Given app is launched
    And the user is on main screen
    And user enters frozen as email address
    And user clicks on go button
    Then user is shown with frozen validation message