@BottomTab-Navigations
Feature: his feature enables us to test the all the bottom navigations

  Background:

  @login-ex
  Scenario: User Logins to the app
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @smoke @ios
  Scenario: Validate home screen footer
    And HOME button should be visible
    And BOOK button should be visible
    And CONNECT button should be visible
    And DISCOVER button should be visible
    And ACCOUNT button should be visible
#    Then the user signs out and closes the app

  @smoke @android
  Scenario: Validate android home screen footer
    Then HOME button should be seen in menu bar
    And WHAT'S ON button should be seen in menu bar
    And MY PLANNER bbutton should be seen in menu bar
    And ACCOUNT button should be seen in menu bar