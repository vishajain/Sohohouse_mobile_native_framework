@home-screen
Feature: Home Screen

  Background:
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @smoke @login-ex
  Scenario: Pre-requisite for home screen testing
    And user sees all the sections on home screen
    Then the user signs out of the app

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

