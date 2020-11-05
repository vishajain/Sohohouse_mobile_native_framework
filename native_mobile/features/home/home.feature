@home-screen
Feature: Home Screen all sections validation

  Background:

  @login-ex
  Scenario: User Logins to the app
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @smoke
  Scenario: Pre-requisite for home screen testing
    Given greetings should be visible
    And user verifies all sections of 'What can we help you with'
      | Section                  | Links            |
      | Invite a Guest           |  New invitation  |
      | Visit a House            |  House visit     |
      | Stay with Us             |  Bedrooms        |
      | Book an Event            |  Events          |
      | Book a Gym Class         |  Gym             |
      | Book a Screening         |  Screenings      |
      | Discover Member Benefits |  Benefits        |
    Then greetings should be visible

  @smoke
  Scenario: Pre-requisite for home screen testing
    Given greetings should be visible
    And user sees all the sections on home screen
      | Section                     |
      | SFFactory                   |
      | What can we help you with?  |
      | Set up your app             |
      | House Notes                 |
      | Babington House Noticeboard |
      | Our Houses                  |
      | Member Benefits             |
    Then the user signs out and closes the app

