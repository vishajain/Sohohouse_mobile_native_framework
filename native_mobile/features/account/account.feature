@Account-screen
Feature: Account screen

  Background:

  @login-ex
  Scenario: User Logins to the app
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @smoke @regression @verify_account_Screen @ios
  Scenario: Validate Account screen title
    Given greetings should be visible
    When user clicks on Account button on home screen
    And the user verifies all the links under account screen for iOS
    Then the user signs out and closes the app

  @smoke @regression @verify_account_Screen @android
  Scenario: Validate Account screen title
    Given greetings should be visible
    When user clicks on Account button on home screen
    Then the user verifies all the links under account screen


  @smoke @test @iOS_will_fail
  Scenario: User submits the enquiry using contact us form
    Given user taps on Contact us form
    When user provides enquiry type as General enquiry
    And user provides enquiry topic as Feedback
    And user provides enquiry message as I like your services
    Then user submits the enquiry
    Then user goes back to the account screen

  @smoke @test @android
  Scenario: User submits the enquiry using contact us form
    Given user taps on Contact us form
    When user provides enquiry type as General enquiry
    And user provides enquiry topic as Feedback
    And user provides enquiry message as I like your services
    Then user submits the enquiry
    Then user navigates to confirmation screen
    Then the user navigates back and sign out of the app


