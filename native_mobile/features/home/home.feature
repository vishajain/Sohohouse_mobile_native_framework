@home-screen
Feature: Home Screen all sections validation

  Background:

  @login-ex
  Scenario: User Logins to the app
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @smoke @ios
  Scenario: Pre-requisite for home screen testing
    Given greetings should be visible
    And user verifies all sections of 'What can we help you with'
      | Section                  | Links                 |
      | Create a Room            |  Share your room link |
      | Invite a Guest           |  New guest Invitation |
      | Visit a House            |  House visit          |
      | Stay with us             |  Bedrooms             |
      | Book an event            |  Events               |
      | Book a screening         |  Screenings           |
      | Discover member benefits |  Benefits             |
    Then greetings should be visible


  @smoke @android
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

  @smoke @android
  Scenario: Verifying Set up your app
    Given greetings should be visible
    When user sees the sections and subheading
      | Section         |  SubHeading                   |  Title         |
      | Set up your app |  Complete Your Profile        |  Edit profile  |
      | Set up your app |  Customise your notifications |  Settings      |

  @smoke @ios
  Scenario: Pre-requisite for home screen testing
    Given greetings should be visible
    When user sees all the sections on home screen
      | Section                     |
      | SFFactory                   |
      | What can we help you with?  |
      | Noticeboard                 |
      | Member events on demand     |
      | Member Stories              |
      | Our Houses                  |
      | Member benefits             |
    And the user scrolls to the top
    Then the user signs out and closes the app

  @smoke @android
  Scenario: Pre-requisite for home screen testing
    Given greetings should be visible
    When user sees all the sections on home screen
      | Section                     |
      | SFFactory                   |
      | What can we help you with?  |
      | Set up your app             |
      | Member Stories              |
      | Our Houses                  |
      | Member Benefits             |
    And the user scrolls to the top
    Then the user signs out and closes the app

