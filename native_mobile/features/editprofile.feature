@Edit-profile-screen
Feature: Edit Profile Screen


  Background:

  @regression @login-ex
  Scenario: Pre-requisite for Edit profile screen testing
    Given app is launched
    And user is on sign in screen
    And user enters valid email address and password
    And user clicks on go button
    And user clicks on Account button on home screen

  @regression
  Scenario: Navigate to the edit profile and user inputs the profession value
    Given user taps on View Profile link
    When user taps on Edit link
    And user sees the Edit profile screen
    And user provides profession value
#    And user taps on save changes
#    Then profession value is shown on view profile screen

  @regression
  Scenario: User inputs the industry value
#    When user taps on Edit link
#    And user sees the Edit profile screen
    And user provides industry value
    And user taps on save changes
    Then industry value is shown on view profile screen

  @regression
  Scenario: User inputs the city value
    When user taps on Edit link
    And user sees the Edit profile screen
    And user provides city value
    And user taps on save changes
    Then city value is shown on view profile screen

  @regression
  Scenario: User inputs the about me value
    When user taps on Edit link
    And user sees the Edit profile screen
    And user provides about me value
    And user taps on save changes
    Then about me value is shown on view profile screen

  @regression
  Scenario: User inputs the lets chat value
    When user taps on Edit link
    And user sees the Edit profile screen
    And user provides lets chat value
    And user taps on save changes
    Then lets chat value is shown on view profile screen

  @regression
  Scenario: User inputs the interests value
    When user taps on Edit link
    And user sees the Edit profile screen
    And user provides interests value
    And user taps on save changes
#    Then interests value is shown on view profile screen
#
  @regression
  Scenario: User inputs the website value
    When user taps on Edit link
    And user sees the Edit profile screen
    And user provides website value
    And user provides instagram value
    And user provides twitter value
    And user provides linkedin value
    And user provides spotify value
    And user provides youtube value
    And user taps on Done
    And user taps on save changes
    Then website value is shown on view profile screen
    Then instagram value is shown on view profile screen
    Then twitter value is shown on view profile screen
    Then linkedin value is shown on view profile screen
    Then spotify value is shown on view profile screen
    Then youtube value is shown on view profile screen

