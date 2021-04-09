@Change-Password-screen
Feature: This features enables us to test the change password functionality


  Background:
    Given app is launched
    And the user is on main screen
    And I enter email address for change password screen
    And user clicks on go button

  @regression @change_password
  Scenario: User updates their password
    Given I click on Account button on home screen
    And I tap on settings
    And I navigate to Change Password tab
    When I update the password
    Then I navigate back and sign out of the app

  @regression @revert_password
  Scenario: User reverts their password
    Given I enter change password email address and changed password
    And I click on Account button on home screen
    And I tap on settings
    And I navigate to Change Password tab
    When I revert the password
    Then I navigate back and sign out of the app

