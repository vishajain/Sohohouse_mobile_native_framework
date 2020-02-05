@home-screen
Feature: Happening Now Screen


  Background:

  @smoke @login-ex
  Scenario: Pre-requisite for home screen testing
    Given app is launched
    And user is on sign in screen
    And user enters valid email address and password
    And user clicks on go button

  @smoke
  Scenario: Validate home screen header
    Given user is on home screen
    Then greetings should be visible

  @smoke
  Scenario: Select the favourite house as Shoreditch house
    When user clicks on Account button on home screen
    When user taps on favourite houses
    And user selects Shoreditch house
    And tap on Save changes

  @smoke
  Scenario: Validate happening now section
    When member is not on home screen from account screen
    Then happening now should be visible

  @smoke
  Scenario: User taps on Shoreditch member event to view event details screen
    When user taps on Shoreditch Member event carousel
    Then user navigates to Shoreditch Member event details screen

  @smoke
  Scenario: User taps on Shoreditch member event to view event details screen
    When user navigates to Shoreditch Member event details screen
    Then user books the event

  @smoke
  Scenario: User navigate back to the home screen
    When user navigates back to the home screen
    Then greetings should be visible

  @smoke
  Scenario: User taps on Shoreditch Gym event to view event details screen
    When user taps on Shoreditch Gym event carousel
    Then user navigates to Shoreditch Gym event details screen

  @smoke
  Scenario: User taps on Shoreditch Gym event to view event details screen
    When user navigates to Shoreditch Gym event details screen
    Then user books the event

  @smoke
  Scenario: User navigate back to the home screen
    When user navigates back to the home screen
    Then greetings should be visible