@whatson-screen
Feature: What's on screen


  Background:

  @smoke
  Scenario: Pre-requisite for What's on screen testing
    Given app is launched
    And user is on sign in screen
    And user enters valid email address and password
    And user clicks on go button

  @smoke
  Scenario: Validate Whatson screen title
    When user clicks on what's on button
    Then user sees what's on screen title

  @smoke
  Scenario: Validate Whatson screen title
    When user clicks on what's on button
    Then user sees what's on screen title

  @smoke
  Scenario: Validate whatson filter icon
    Then user sees what's on filter icon

  @smoke
  Scenario: Validate Whatson options
    Then Events button is visible
    And Screenings button is visible
    And Gym classes button is visible

  @smoke
  Scenario: Search for the member event
    When the member event is found
    Then tap on the member event

