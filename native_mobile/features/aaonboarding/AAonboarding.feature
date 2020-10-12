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

  @smoke @android
  Scenario: Android on-boarding screens
    Given user verifies his membership card and continues
    And user goes through the member benefits and continues
    When the user accepts notifications
    And user sees the home screen
    Then the user signs out and closes the app