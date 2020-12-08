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
    Given greetings should be visible
    And user should see the button in menu bar
    | menu       |  assertion                   |
    | Account    |  View profile                |
    | My Planner |  Discover                    |
    | What's On  |  Book                        |
    | Home       |  What can we help you with?  |
    Then the user signs out and closes the app