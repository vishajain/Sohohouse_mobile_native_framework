@chasing-screen
Feature: This is a feature to test chasing login for iOS and Android

  @smoke
  Scenario: User tries to login with chasing account
    Given app is launched
    And the user is on main screen
    And user enters chasing as email address
    And user clicks on go button
    And user is shown with a chasing validation message
    Then the user signs out and closes the app