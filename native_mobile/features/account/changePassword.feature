@Change-Password-screen
Feature: This features enables us to test the change password functionality

  Background:
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @regression @change_password
  Scenario: User updates their password
    Given user clicks on Account button on home screen
    And user taps on settings
    And user navigates to next tab
    And user navigates to change password
    When user updates password
    Then the user navigates back and sign out of the app

  @regression @revert_password
  Scenario: User reverts their password
    Given user enters valid email address and changed password
    And user clicks on Account button on home screen
    And user taps on settings
    And user navigates to next tab
    And user navigates to change password
    When user reverts password