@Account-screen
Feature: Account screen


  Background:

  @smoke @login-ex @regression @notification @test
  Scenario: Pre-requisite for Account screen testing
    Given app is launched
    And user is on sign in screen
    And user enters valid email address and password
    And user clicks on go button

  @smoke @regression @notification @test
  Scenario: Validate Account screen title
    Given greetings should be visible
    When user clicks on Account button on home screen
    Then user see and taps on view profile link

  @smoke
  Scenario: Validate your membership link
    Then user see and taps on your membership link

  @smoke
  Scenario: Validate perks link
    Then user see and taps on perks link

  @smoke
  Scenario: Validate perk content on house perks list
    When user sees and taps on perks
    Then user sees perk title

  @smoke
  Scenario: Validate perk content
    When user taps on the first perk on perks list
    Then user sees perk location on perk screen
    Then user sees perk title on perk screen
    Then user sees perk description on perk screen
    Then user goes back to the account screen
    Then user goes back to the account screen

  @smoke
  Scenario: Validate payment link
    Then user see and taps on payment link

  @smoke
  Scenario: Validate change password link
    Then user see and taps on change password link

  @regression
  Scenario: Change the password
    Given user taps on change password
    When user provides current password
    And user provides new password
    And user provides confirm password
    And user taps on Save button
    Then the new password is saved

  @regression
  Scenario: Return to the original password
    Given user taps on change password
    When user provides changed password in current password
    And user provides original password in new password
    And user provides original password in confirm password
    And user taps on Save button
    Then the new password is saved

  @smoke
  Scenario: Validate favourite houses link
    Then user see and taps on favourite houses link

  @smoke @regression
  Scenario: Reset favourite houses
    When user taps on favourite houses
    And user taps on Reset
    And tap on Save changes
    And user taps on favourite houses
    Then user see only the local house in the favourite houses list

  @smoke @regression
  Scenario: User selects 40 Greek Street as a favourite house
    When user taps on favourite houses
    And user selects 40 Greek Street
    And tap on Save changes
    And user taps on favourite houses
    Then user sees 40 Greek Street under favourite houses list
    And user goes back to the account screen

  @smoke
  Scenario: Validate notification preferences link
    Then user see and taps on notification preferences link

  @smoke
  Scenario: Unselect the push notification preferences
    Given user taps on notification preferences
    When unselect Your events push notification preference
    When unselect Your screenings push notification preference
    When unselect Welcome to the House push notification preference
    Then Your events push notification preference is switched off
    Then Your screenings push notification preference is switched off
    Then Welcome to the House push notification preference is switched off
    Then user goes back to the account screen

  @smoke
  Scenario: Select the push notification preferences
    Given user taps on notification preferences
    When select Your events push notification preference
    When select Your screenings push notification preference
    When select Welcome to the House push notification preference
    Then Your events push notification preference is switched on
    Then Your screenings push notification preference is switched on
    Then Welcome to the House push notification preference is switched on

  @smoke
  Scenario: User navigates back to the account screen
    Then user goes back to the account screen

  @smoke @ios
  Scenario: Validate sync calendar link
    Then user see and taps on sync calendar link

  @smoke
  Scenario: Validate contact us link
    Then user see and taps on contact us link

  @smoke @test
  Scenario: User submits the enquiry using contact us form
    Given user taps on Contact us form
    When user provides enquiry type as General enquiry
    And user provides enquiry topic as Positive feedback
    And user provides enquiry message as I like your services
    Then user submits the enquiry
    Then user goes back to the account screen

  @smoke @android
  Scenario: Validate faq link
    Then user see and taps on faq link

  @smoke
  Scenario: Validate policies link
    Then user see and taps on policies link

  @smoke @hook
  Scenario: Go back to the home page from account screen
    Then member is not on home screen from account screen
