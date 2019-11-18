@home-screen
Feature: Home Screen


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
    Scenario: Validate happening now section
    Then happening now should be visible

  @smoke
  Scenario: Validate house notes section
    Then house notes should be visible
    And user taps on see all stories CTA to see house notes screen

  @smoke
  Scenario: Validate noticeboard section
    Then noticeboard section is visible
    And user taps on View another noticeboard link to see Noticeboards screen

  @smoke
  Scenario: Validate house perks and browse houses links
    Then user taps on house perks link to see House perks screen
    And user taps on browse the houses link to see Browse houses screen

  @smoke @ios
  Scenario: Validate home screen footer
    Then HOME button should be visible
    And WHAT'S ON button should be visible
    And MY PLANNER button should be visible
    And ACCOUNT button should be visible

  @smoke @android
  Scenario: Validate android home screen footer
    Then HOME button should be seen in menu bar
    And WHAT'S ON button should be seen in menu bar
    And MY PLANNER bbutton should be seen in menu bar
    And ACCOUNT button should be seen in menu bar