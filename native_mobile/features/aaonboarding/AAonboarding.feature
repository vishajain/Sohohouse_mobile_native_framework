@Onboarding-screens
Feature: This is a feature to test On-boarding screens for iOS and Android

  Background: User logins with valid credentials
    Given app is launched
    And the user is on main screen
    And user enters valid email address and password

  @smoke @ios
  Scenario: User accepts Terms & Conditions to see Help us improve screen
    Given user sees Membership screen
    And user goes through housepay screens
    And user sees welcome screen
    And user continue from make it personal screen
    And user sees Notification preferences screen
    When user sees the home screen
    Then the user signs out and closes the app

  @smoke @android
  Scenario: Android on-boarding screens
    When user sees the home screen
    Then the user signs out and closes the app