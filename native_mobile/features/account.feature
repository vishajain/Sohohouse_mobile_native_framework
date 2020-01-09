@Account-screen
Feature: Account screen


  Background:

  @smoke @login-ex @regression
  Scenario: Pre-requisite for Account screen testing
    Given app is launched
    And user is on sign in screen
    And user enters valid email address and password
    And user clicks on go button

  @smoke @regression
  Scenario: Validate Account screen title
    Given username is visible
    When user clicks on Account button on home screen
    Then user sees and taps on view profile link

  @smoke
  Scenario: Validate your membership link
    Then user sees and taps on your membership link

  @smoke
  Scenario: Validate perks link
    Then user sees and taps on perks link

  @smoke
  Scenario: Validate perk content on house perks list
    When user sees and taps on perks
    Then user sees perk title
    Then user sees perk location

  @smoke
  Scenario: Validate perk content
    When user taps on the first perk on perks list
#    Then user sees perk image on perk screen
    Then user sees perk location on perk screen
    Then user sees perk title on perk screen
    Then user sees perk description on perk screen
    Then user goes back to the account screen

  @smoke
  Scenario: Validate payment link
    Then user sees and taps on payment link

  @smoke
  Scenario: Validate past bookings link
    Then user sees and taps on past bookings link

  @smoke
  Scenario: Validate change password link
    Then user sees and taps on change password link

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
    Then user sees and taps on favourite houses link

  @smoke
  Scenario: Validate notification preferences link
    Then user sees and taps on notification preferences link

  @smoke @ios
  Scenario: Validate sync calendar link
    Then user sees and taps on sync calendar link

  @smoke
  Scenario: Validate contact us link
    Then user sees and taps on contact us link

  @smoke @android
  Scenario: Validate faq link
    Then user sees and taps on faq link

  @smoke
  Scenario: Validate policies link
    Then user sees and taps on policies link

  @smoke @hook
  Scenario: Go back to the home page from account screen
    Then member is not on home screen from account screen