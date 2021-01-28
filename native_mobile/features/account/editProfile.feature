@EditProfile-screen
Feature: This feature enables us to test the edit profile functionality

  Background:

  @login-ex
  Scenario: User Logins to the app
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @smoke @regression @edit_profile
  Scenario: Validate Edit profile fields
    Given I click on Account button on home screen
    When the user edits their profession
    And the user provides industry and city value
    And the user inputs about me and interests values
    And the user inputs connect social accounts values
    Then the amended fields should be shown on users profile screen