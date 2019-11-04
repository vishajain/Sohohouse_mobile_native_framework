@Black-slate-screen
Feature: Blackslate screen


  Background:

  @smoke @login-ex
  Scenario: Pre-requisite for Black slate screen testing
    Given app is launched
    And user is on sign in screen
    And user enters valid email address and password
    And user clicks on go button

  @smoke
  Scenario: Validate Blackslate navigation
    Given username is visible
    When user taps on blackslate to view the blackslate screen
    Then blackslate screen is opened

  @smoke
  Scenario: Validate House name link and its navigation to browse houses screen
    Then user taps on house name to navigate to browse houses screen

  @smoke
  Scenario: Validate membership card link  and its navigation to membership card screen
    Then user taps on membership card to navigate to membership card screen

  @smoke
  Scenario: Validate book a bedroom link and its navigation to bedrooms screen
    Then user taps on book a bedroom to see bedrooms screen

  @smoke
  Scenario: Validate contact a house link and its navigation to contact us screen
    Then user taps on contact a house link to see contact a house screen
    Then navigate back to home screen


