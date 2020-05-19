@expired-screen
Feature: This is a feature to test expired login for iOS and Android

  @smoke
  Scenario: User tries to login with expired account
    Given app is launched
    And the user is on main screen
    And user enters expired as email address
    And user clicks on go button
    Then user is shown with an expired validation message