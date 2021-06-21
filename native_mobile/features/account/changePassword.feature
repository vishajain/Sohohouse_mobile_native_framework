@Change-Password-screen @regression
Feature: This features enables us to test the change password functionality

  @change_password
  Scenario: User updates their password
    Given Skip the onboarding screen
    And I click on Account button on home screen
    And I tap on settings
    And I navigate to Change Password in Settings tab
    When I update the password
    Then I navigate back to accounts
    Then I navigate to Home page

  @revert_password
  Scenario: User reverts their password
    Given I enter change password email address and changed password
    And I click on Account button on home screen
    And I tap on settings
    And I navigate to Change Password in Settings tab
    When I revert the password
    Then I navigate back to accounts
    Then I navigate to Home page

