@login-screen  @regression
Feature: This is the feature to test different login scenarios for iOS and Android

  @smoke
  Scenario Outline: User login with different accounts and verifies message
    Given app is launched
    And the user is on main screen
    And user enters <login> as email address
    And user clicks on go button
    And user is shown with a validation message <message> for the <login> account
    Then the clicks on signs out and closes the app for <login>
    Examples:
      | login     | message                                    |
      | chasing   | There has been a problem with your payment |
     # | expired   | Your account cannot be accessed            |
      | frozen    | Your membership is on hold                 |
      | suspended | Your membership has been suspended         |

