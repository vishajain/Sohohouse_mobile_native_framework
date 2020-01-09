@Account-screen
Feature: Active functionality


  Background:

  @regression
  Scenario: Login to Non active local to soho warehouse
    Given user navigates to the account screen
    And user sign-out of the app from the previous user
    And user enters non-active-local as email address
    And user enters password
    And user clicks on go button
    Then greetings should be visible

  @regression
  Scenario: Non active local to SHW - User navigates to Member events section
    Given greetings should be visible
    When user clicks on what's on button
    Then user sees what's on screen title
    And tap on Events tab

  @smoke
  Scenario: Non active local to SHW - Book to the PAID member event
    Given user sees how many tickets to buy question
    When user taps on buy tickets on event screen
    And user sees confirm payment screen
    And user taps on buy tickets on confirm payment screen
    Then user sees you are on the guest list screen
    Then user taps on OK button
    Then user sees the event booking status as you are on the guest list on event details screen

  @smoke
  Scenario: Non active local to SHW - User cannot book to the 40 Greek street event
    Given tap on Events tab
    When user filters with 40 Greek Street house
    Then user sees the event status as House members only

  @regression
  Scenario: Non active local to SHW - User navigates to Gym classes section
    When user sees what's on screen title
    Then tap on Gym classes tab

  @regression
  Scenario: Non active local to SHW - User checks the status of Gym classes as "Active members only"
    Then user sees the status as Active members only

  @regression
  Scenario: Non active local to SHW - validate the status on event details screen
    When user taps on the soho warehouse event
    Then user sees the soho warehouse Active
    Then user sees the status as Active members only
    Then user sees the Find out more button

  @regression
  Scenario: Non active local to SHW - Navigate to Active membership slate
    When user taps on the symbol beside Active members only
    Then user sees Active membership slate

  @regression
  Scenario: Non active local to SHW - Validate Active membership slate content
    When user sees Active membership slate
    Then user sees Active section
    Then user sees Subscribe to Active membership link
    Then user sees Active plus section
    Then user sees Subscribe to Active plus membership link
    Then user sees Contact a house link
    Then user closes the Active membership slate slate

  @regression
  Scenario: Non active local to SHW - User taps on Find out more button and naviagate to Active membership slate
    Given user taps on Find out more button
    When user sees Active membership slate
    Then user sees Active section
    Then user sees Subscribe to Active membership link
    Then user sees Active plus section
    Then user sees Subscribe to Active plus membership link

  @regression
  Scenario: Non active local to SHW - User subscribes to Active membership
    Given user sees Active membership slate
    When user tap on Subscribe to Active membership link
    Then user sees Contact us form
    Then user sees enquiry type as Membership enquiry
    Then user sees enquiry topic as Add Active membership
    Then user sees the Active message
    Then user taps on submit
    Then user taps on OK

  @regression
  Scenario: Non active local to SHW - User subscribes to Active plus membership
    Given user sees Active membership slate
    When user tap on Subscribe to Active plus membership link
    Then user sees Contact us form
    Then user sees enquiry type as Membership enquiry
    Then user sees enquiry topic as Add Active membership
    Then user sees the Active plus message
    Then user taps on submit
    Then user taps on OK

  @regression
  Scenario: Non active local to SHW - User sign-out
    Given user sees Contact us form
    When user tap on back link
    When user closes the Active membership slate slate
    When user navigates to the account screen
    Then user sign-out of the app from the previous user




