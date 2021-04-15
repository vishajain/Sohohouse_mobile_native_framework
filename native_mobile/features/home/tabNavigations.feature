@BottomTab-Navigations
Feature: his feature enables us to test the all the bottom navigations

  Background:

  @login-ex
  Scenario: User Logins to the app
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @smoke @ios
  Scenario: Validate android home screen footer
    Given greetings should be visible
    And user should see the button in menu bar
      | menu       |  assertion                   |
      | Account    |  View profile                |
      | Discover   |  More from us                |
      | Connect    |  Connect with members        |
      | Book       |  Book                        |
      | Home       |  What can we help you with?  |
    Then the user signs out and closes the app

  @smoke @android
  Scenario: Validate android home screen footer
    Given greetings should be visible
    And user should see the button in menu bar
      | menu       |  assertion                   |
      | Account    |  View profile                |
      | Discover   |  Discover                    |
      | Connect    |  Connect                     |
      | Book       |  Book                        |
      | Home       |  What can we help you with?  |
    Then the user signs out and closes the app