@Onboarding-screens
Feature: This is a feature to test On-boarding screens for iOS and Android

  @smoke
  Scenario: Login with valid user credentials
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @ios @smoke
  Scenario:: User accepts Terms & Conditions to see Help us improve screen
    Given user sees Membership screen
    And the user goes through ios Onboarding screen
    When user goes through housepay screens
    And if user sees House introduction screen
    And user sees welcome screen
    And user continue from make it personal screen
    And user sees Notification preferences screen
    And user sees the home screen
    Then the user signs out and closes the app

  @smoke @android
  Scenario: Android on-boarding screens
    Given user verifies his membership card and continues
    And user goes through the member benefits and continues
    When the user accepts notifications
    And user sees the home screen
    Then the user signs out and closes the app