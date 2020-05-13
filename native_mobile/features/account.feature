@Account-screen
Feature: Account screen


  Background:
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @smoke @regression @verify_account_Screen
  Scenario: Validate Account screen title
    Given greetings should be visible
    When user clicks on Account button on home screen
    Then the user verifies all the links under account screen

  @smoke @regression @edit_profile
  Scenario: Validate Edit profile fields
    Given user clicks on Account button on home screen
    When the user edits their profession
    And the user provides industry and city value
    And the user inputs about me and interests values
    And the user inputs connect social accounts values
    Then the amended fields should be shown on users profile screen

  @smoke @regression @favourite_houses
  Scenario: User adds a house to his list of favourite houses
    Given user clicks on Account button on home screen
    When the user adds a new favourite house
    Then the added house is shown on favourite houses list

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

  @smoke @sync_calendar
  Scenario: Validate sync calendar
    Given user clicks on Account button on home screen
    And user taps on settings
    And user navigates to next tab
    When the user taps on sync and verifies the popup message
    Then the user navigates back and sign out of the app

  @regression @change_password
  Scenario: User updates their password
    Given user clicks on Account button on home screen
    And user taps on settings
    And user navigates to next tab
    And user navigates to change password
    When user updates password
    Then the user navigates back and sign out of the app

  @regression @revert_password
  Scenario: User reverts their password
    Given user enters valid email address and changed password
    And user clicks on Account button on home screen
    And user taps on settings
    And user navigates to next tab
    And user navigates to change password
    When user reverts password
    Then the user navigates back and sign out of the app

#  @smoke @test
#  Scenario: User submits the enquiry using contact us form
#    Given user taps on Contact us form
#    When user provides enquiry type as General enquiry
#    And user provides enquiry topic as Positive feedback
#    And user provides enquiry message as I like your services
#    Then user submits the enquiry
#    Then user goes back to the account screen
#
#  @smoke @android
#  Scenario: Validate faq link
#    Then user see and taps on faq link
#
#  @smoke
#  Scenario: Validate policies link
#    Then user see and taps on policies link
#
#  @smoke @hook
#  Scenario: Go back to the home page from account screen
