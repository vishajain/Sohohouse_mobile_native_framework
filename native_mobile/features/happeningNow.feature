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
    And username is visible

  @smoke
  Scenario: Select the favourite house as Shoreditch house
    When user clicks on Account button on home screen
    When user taps on favourite houses
    And user selects Shoreditch house
    And tap on Save changes
    And user taps on favourite houses
    Then user sees Shoreditch house under favourite houses list
    And user goes back to the account screen

  @smoke
  Scenario: Validate happening now section
    When member is not on home screen from account screen
    Then happening now should be visible

