@whatson-screen
Feature: What's on screen


  Background:

  @smoke @login-ex @wip
  Scenario: Pre-requisite for What's on screen testing
    Given app is launched
    And user is on sign in screen
    And user enters valid email address and password
    And user clicks on go button

  @smoke @wip
  Scenario: Validate Whatson screen title
    Given username is visible
    When user clicks on what's on button
    Then user sees what's on screen title

  @smoke @wip
  Scenario: Validate whatson filter icon
    Then user sees what's on filter icon

  @smoke
  Scenario: Validate Whatson options
    Then Events button is visible
    And Screenings button is visible
    And Gym classes button is visible

  @smoke
  Scenario: Validate PAID member event sections
    Given user sees the Events tab
    And tap on Events tab
    When the paid Events event is found
    Then the Tickets section is present
    Then the Date and time section is present
    Then the Event details section is present
    Then the Location section is present
    Then the Cancellation policy section is present

  @smoke
  Scenario: Book to the PAID member event
    Given user sees how many tickets to buy question
    When user taps on buy tickets on event screen
    And user sees confirm payment screen
    And user taps on buy tickets on confirm payment screen
    Then user sees you are on the guest list screen
    Then user taps on OK button
    Then user sees the event booking status as you are on the guest list on event details screen

  @smoke
  Scenario: Add 1 guest to the PAID member event
    Given user sees how many tickets to buy question
    When user taps on invite guests on event screen
    Then user sees you are on the guest list screen
    Then user sees Guest 1 on you are on the guest list screen
    Then user taps on OK button
    Then user sees Guest 1 under Guests up to section
    Then user sees the event booking status as you and 1 guest going on event details screen


  @smoke
  Scenario: Cancel the guest member booking - PAID event
    When user sees the event booking status as you and 1 guest going on event details screen
    When user sees Guest 1 under Guests up to section
    When user cancels Guest 1 booking
    Then Guest 1 booking should be cancelled

  @smoke
    Scenario: Cancel the PAID member event booking
    When user sees the event booking status as you are on the guest list on event details screen
    Then user cancels the event booking
    Then user navigates back to the events list

  @smoke
  Scenario: Validate FREE member event sections
    Given user sees the Events tab
    And tap on Events tab
    When the free Events event is found
    Then the Tickets section is present
    Then the Date and time section is present
    Then the Event details section is present
    Then the Location section is present
    Then the Cancellation policy section is present

  @smoke
  Scenario: Book to the FREE member event
    Given user sees how many tickets to buy question
    When user taps on book tickets on event screen
    Then user sees you are on the guest list screen
    Then user taps on OK button
    Then user sees the event booking status as you are on the guest list on event details screen

  @smoke
  Scenario: Cancel the FREE member event booking
    When user sees the event booking status as you are on the guest list on event details screen
    Then user cancels the event booking
    Then user navigates back to the events list

  @smoke
  Scenario: Validate PAID screening event sections
    Given user sees the Screenings tab
    And tap on Screenings tab
    When the paid Screenings event is found
    Then the Tickets section is present
    Then the Date and time section is present
    Then the About this film section is present
    Then the Location section is present
    Then the Cancellation policy section is present
    Then the Deposit policy section is present

  @smoke
  Scenario: Book to the PAID screening event
    Given user sees how many tickets to buy question
    When user taps on buy tickets on screening event screen
    And user sees confirm deposit screen
    And user taps on Confirm deposit on confirm deposit screen
    Then user sees you are on the guest list screen
    Then user taps on OK button
    Then user sees the event booking status as you are on the guest list on event details screen

  @smoke
  Scenario: Cancel the PAID screening event booking
    When user sees the event booking status as you are on the guest list on event details screen
    Then user cancels the event booking
    Then user navigates back to the events list

  @smoke
  Scenario: Validate FREE screening event sections
    Given user sees the Screenings tab
    And tap on Screenings tab
    When the free Screenings event is found
    Then the Tickets section is present
    Then the Date and time section is present
    Then the About this film section is present
    Then the Location section is present
    Then the Cancellation policy section is present


  @smoke
  Scenario: Book to the FREE screening event
    Given user sees how many tickets to buy question
    When user taps on book tickets on event screen
    Then user sees you are on the guest list screen
    Then user taps on OK button
    Then user sees the event booking status as you are on the guest list on event details screen

  @smoke
  Scenario: Cancel the FREE screening event booking
    When user sees the event booking status as you are on the guest list on event details screen
    Then user cancels the event booking
    Then user navigates back to the events list

  @smoke
  Scenario: Validate PAID gym event sections
    Given user sees the Gym classes tab
    And tap on Gym classes tab
    When the paid Gym classes event is found
    Then the Tickets section is present
    Then the Date and time section is present
    Then the Event details section is present
    Then the Location section is present
    Then the Cancellation policy section is present

  @smoke
  Scenario: Book to the PAID Gym event
    When user taps on buy tickets on gym event screen
    And user sees confirm payment screen
    And user taps on buy tickets on confirm payment screen
    Then user sees you are on the guest list screen
    Then user taps on OK button
    Then user sees the event booking status as you are on the guest list on event details screen

  @smoke
  Scenario: Cancel the PAID screening event booking
    When user sees the event booking status as you are on the guest list on event details screen
    Then user cancels the event booking
    Then user navigates back to the events list

  @smoke
  Scenario: Validate FREE gym event sections
    Given user sees the Gym classes tab
    And tap on Gym classes tab
    When the free Gym classes event is found
    Then the Tickets section is present
    Then the Date and time section is present
    Then the Event details section is present
    Then the Location section is present
    Then the Cancellation policy section is present

  @smoke
  Scenario: Book to the FREE Gym event
    When user taps on book gym tickets on event screen
    Then user sees you are on the guest list screen
    Then user taps on OK button
    Then user sees the event booking status as you are on the guest list on event details screen

  @smoke
  Scenario: Cancel the FREE Gym event booking
    When user sees the event booking status as you are on the guest list on event details screen
    Then user cancels the event booking
    Then user navigates back to the events list

  @smoke @wip
  Scenario: Validate the what's on filter - select the Soho House Berlin
    Given user sees the Events tab
    When user taps on the filter
    And user selects Soho House Berlin house
    Then user should see the events of Soho House Berlin only