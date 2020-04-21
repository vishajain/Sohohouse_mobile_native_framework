@Onboarding-screens
Feature: This is a feature to test On-boarding screens for iOS and Android

  @smoke
  Scenario: Login with valid user credentials
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @ios @smoke
  Scenario:: User accepts Terms & Conditions to see Help us improve screen
    Given user sees T & C screen
    When the user goes through ios Onboarding screen
    And if user sees House introduction screen
    And user taps on contact membership team
    Then user sees welcome screen

   @smoke
  Scenario:: User continues to see the make it personal screen
    Given user continue from welcome screen
    And goes through android onboarding screens
    When user clicks on next on all set screen
    And user sees the home screen
    Then the user signs out of the app

   @smoke
   Scenario: User tries to login with chasing account
     Given app is launched
     And the user is on main screen
     And user enters chasing as email address
     And user clicks on go button
     And user is shown with a chasing validation message
     Then the user signs out of the app

  @smoke
  Scenario: User tries to login with frozen account
    Given app is launched
    And the user is on main screen
    And user enters frozen as email address
    And user clicks on go button
    Then user is shown with frozen validation message

  @smoke
  Scenario: User tries to login with expired account
    Given app is launched
    And the user is on main screen
    And user enters expired as email address
    And user clicks on go button
    Then user is shown with an expired validation message

  @smoke
  Scenario: User tries to login with suspended account
    Given app is launched
    And the user is on main screen
    And user enters suspended as email address
    And user clicks on go button
    Then user is shown with a suspended validation message