@myplanner-screen
Feature: My Planner screen


  Background:

  @smoke @login-ex
  Scenario: Login with valid user credentials
    Given app is launched
    And user is on sign in screen
    When user enters valid email address and password
    Then user clicks on go button

  @smoke
  Scenario: Validate Myplanner screen title
    Given username is visible
    When user clicks on my planner button
    Then user sees my planner screen title

  @smoke
  Scenario: Validate events section is present
    Then Events section is present

  @smoke
  Scenario: Validate event bookings if present under Events section
    Given user sees my planner screen title
    When Events list is present
    Then user taps on the first event to navigate to event details screen

  @smoke
  Scenario: Validate explore events button when no events bookings are present
    Given user sees my planner screen title
    When no Event bookings are present
    Then user taps on the explore events button to navigate to What's on screen

  @smoke
  Scenario: Validate screening section is present
    Given user sees my planner screen title
    Then Screenings section is present

  @smoke
  Scenario: Validate screening bookings if present under Screening section
    Given user sees my planner screen title
    When Screenings section is present
    Then user taps on the first screening event to navigate to event details screen

  @smoke
  Scenario: Validate explore screenings button when no screening events bookings are present
    Given user sees my planner screen title
    When no screening event bookings are present
    Then user taps on the explore screenings button to navigate to What's on screen

  @smoke
  Scenario: Validate classes section is present
    Given user sees my planner screen title
    Then Classes section is present

  @smoke
  Scenario: Validate Gym classes bookings if present under Classes section
    Given Classes section is present
    Then user taps on the first Gym class event to navigate to event details screen

  @smoke
  Scenario: Validate Explore gym classes button when no gym events bookings are present
    Given user sees my planner screen title
    When no gym event bookings are present
    Then user taps on the Explore gym classes button to navigate to What's on screen

  @smoke
  Scenario: Validate stay section is present
    Given user sees my planner screen title
    Then stay section is present

#  @smoke
#  Scenario: Validate view bedroom bookings text link navigation
#    Then member clicks on view bedroom bookings link and navigate back to my planner

  @smoke
  Scenario: Go back to the home page
    When member is not on home screen
    Then member is navigated to the home screen