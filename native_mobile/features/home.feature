@home-screen
Feature: Home Screen


  Background:

  @smoke
  Scenario: Pre-requisite for home screen testing
    Given app is launched
    And user is on sign in screen
    And user enters valid email address and password
    And user clicks on go button

  @smoke
  Scenario: Validate home screen header
    Then greetings should be visible
    And username should be visible

  @smoke
    Scenario: Validate happening now section
    Then happening now should be visible

  @smoke
  Scenario: Validate house notes section
    Then house notes should be visible
    And see all stories should be visible

  @smoke
  Scenario: Validate noticeboard section
    Then noticeboard section is visible

  @smoke
  Scenario: Validate house perks and browse houses links
    Then house perks link should be visible
    And browse the houses link should be visible

  @smoke
  Scenario: Validate home screen footer
    Then HOME button should be visible
    And WHAT'S ON button should be visible
    And MY PLANNER button should be visible
    And ACCOUNT button should be visible