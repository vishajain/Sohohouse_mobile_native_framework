@Upcoming-bookings
Feature: Upcoming bookings


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
    Then houseboard screen is shown

  @smoke
  Scenario: Validate Events list under upcoming bookings section
    Given user sees Upcoming bookings
    Then user sees the events under upcoming bookings

  @smoke
  Scenario: Validate Events list under upcoming bookings section
    Given user sees Upcoming bookings
    Then user sees the status of the event as YOU'RE ON THE GUEST LIST

  @smoke
  Scenario: First event - navigate to the event details screen
    Given user sees Upcoming bookings
    And user sees the events under upcoming bookings
    And user taps on the first event
    Then user is navigated to the event details screen

  @smoke
  Scenario: User navigation from event details screen to house board
    When user is navigated to the event details screen
    And user is navigated back
    Then user sees houseboard screen

  @smoke
  Scenario: User is able to scroll left to navigate thru multiple booked events
    Given user sees Upcoming bookings
    When user sees multiple events
    Then user is able to scroll left to view the multiple events

  @smoke
  Scenario: User is navigated to the my planner screen when tapped on See all button
    Given user sees See all button
    When user taps on See all button
    Then user is navigated to the my bookings screen

  @smoke
  Scenario: User navigation from my bookings screen to house board
    When user is navigated back from my bookings screen
    Then user sees See all button

  @smoke
  Scenario: Go back to the home page from blackslate screen
    Then member is not on home screen from blackslate screen


#  @smoke
#  Scenario: User only sees the maximum of 7 events upon scrolling left
#    Given user sees Upcoming bookings
#    When user sees multiple events
#    Then user sees maximum of seven events upon scrolling to the left
