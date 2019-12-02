@whatson-screen
Feature: What's on screen


  Background:

  @smoke @login-ex
  Scenario: Pre-requisite for What's on screen testing
    Given app is launched
    And user is on sign in screen
    And user enters valid email address and password
    And user clicks on go button

  @smoke
  Scenario: Validate Whatson screen title
    Given username is visible
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
  Scenario: Validate member event sections
    When the member event is found
    Then the Tickets section is present
    Then the Date and time setion is present
    Then the Event details section is present
    Then the Location section is present
    Then the Cancellation policy section is present


#  @smoke
#  Scenario: Book a member event
#    Given user sees how many tickets to buy question
#    When user taps on buy tickets
#    And user sees confirm payment screen
#    And user taps on buy tickets on confirm payment screen
#    Then user sees you are on the guest list screen

#  @smoke @hook
#    Scenario: Go back to the home page
#    When member is not on home screen
#    Then member is navigated to the home screen

