@notification-screen
Feature: This feature enables us to test the notifications functionality

  @login-ex
  Scenario: User Logins to the app
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @smoke @regression @notification_preferences
  Scenario: User updates their notification preferences
    Given user clicks on Account button on home screen
    And user taps on settings
    And unselect Your events push notification preference
    And unselect Your screenings push notification preference
    And unselect Welcome to the House push notification preference
    And Your events push notification preference is switched off
    And Your screenings push notification preference is switched off
    And Welcome to the House push notification preference is switched off
    And user goes back to the account screen
    When user taps on settings
    And select Your events push notification preference
    And select Your screenings push notification preference
    And select Welcome to the House push notification preference
    Then Your events push notification preference is switched on
    And Your screenings push notification preference is switched on
    And Welcome to the House push notification preference is switched on
    Then the user navigates back and sign out of the app