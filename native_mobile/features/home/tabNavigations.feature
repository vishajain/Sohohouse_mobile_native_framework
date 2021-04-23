@BottomTab-Navigations @regression
Feature: his feature enables us to test the all the bottom navigations

  @smoke @ios
  Scenario: Validate android home screen footer
    Given greetings should be visible
    Then user should see the button in menu bar
      | menu       |  assertion                   |
      | Account    |  View profile                |
      | Discover   |  More from us                |
      | Connect    |  Connect with members        |
      | Book       |  Book                        |
      | Home       |  What can we help you with?  |

  @smoke @android
  Scenario: Validate android home screen footer
    Given greetings should be visible
    Then user should see the button in menu bar
      | menu       |  assertion                   |
      | Account    |  View profile                |
      | Discover   |  Discover                    |
      | Connect    |  Connect                     |
      | Book       |  Book                        |
      | Home       |  What can we help you with?  |