@Account-screen
Feature: Account screen

  Background:

  @login-ex
  Scenario: User Logins to the app
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @smoke @regression @verify_account_Screen
  Scenario: Validate Account screen title
    Given greetings should be visible
    When user clicks on Account button on home screen
    Then the user verifies all the links under account screen

#  @smoke @test
#  Scenario: User submits the enquiry using contact us form
#    Given user taps on Contact us form
#    When user provides enquiry type as General enquiry
#    And user provides enquiry topic as Positive feedback
#    And user provides enquiry message as I like your services
#    Then user submits the enquiry
#    Then user goes back to the account screen
#
#  @smoke @android
#  Scenario: Validate faq link
#    Then user see and taps on faq link
#
#  @smoke
#  Scenario: Validate policies link
#    Then user see and taps on policies link
#
#  @smoke @hook
#  Scenario: Go back to the home page from account screen
