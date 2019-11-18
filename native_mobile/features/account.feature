@Account-screen
Feature: Account screen


  Background:

  @smoke @login-ex
  Scenario: Pre-requisite for Account screen testing
    Given app is launched
    And user is on sign in screen
    And user enters valid email address and password
    And user clicks on go button

  @smoke
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
  Scenario: Validate payment link
    Then user sees and taps on payment link

  @smoke
  Scenario: Validate past bookings link
    Then user sees and taps on past bookings link

  @smoke
  Scenario: Validate change password link
    Then user sees and taps on change password link

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
  Scenario: Go back to the home page
    When member is not on home screen
    Then member is navigated to the home screen