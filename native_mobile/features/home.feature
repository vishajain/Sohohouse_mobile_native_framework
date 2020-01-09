@home-screen
Feature: Home Screen


  Background:

  @smoke @login-ex
  Scenario: Pre-requisite for home screen testing
    Given app is launched
    And user is on sign in screen
    And user enters valid email address and password
    And user clicks on go button

  @smoke
  Scenario: Validate home screen header
    Given user is on home screen
    Then greetings should be visible
    And username is visible

  @smoke
    Scenario: Validate happening now section
    Then happening now should be visible

  @smoke
  Scenario: Validate house notes section
    Then house notes should be visible
    And user taps on see all stories CTA to see house notes screen

  @smoke
  Scenario: Validate noticeboard section
    Then noticeboard section is visible
    And user taps on View another noticeboard link to see Noticeboards screen

  @regression
  Scenario: Post on the noticeboard
#    Given the house is open
    When the user taps on Post
    Then user is be navigated to the noticeboard screen
    And user sees the house name

  @regression
  Scenario: Create a post on the noticeboard for the local house
    Given user is be navigated to the noticeboard screen
    When user inputs the text
    And the user taps on Post
    Then user sees the post on the home screen

  @regression
  Scenario: Increase of posts count on the noticeboards screen
    Given user sees the post on the home screen
    When user taps on view another noticeboard
    Then user sees the posts count incremented by one
    And user closes the modal screen

  @regression
  Scenario: Amend the local house's post on the noticeboard
    Given user sees the post on the home screen
    When the user taps on Post
    And user inputs the text to amend
    And the user taps on Post
    Then user sees the post amended on the home screen

  @regression
  Scenario: Delete the local house's post on the noticeboard
    Given user sees the post on the home screen
    When the user taps on Post
    And user taps on delete post
    Then user sees the post deleted from the home screen

  @regression
  Scenario: Navigate to other house noticeboard
    Given user taps on view another noticeboard
    When the user taps on Soho house Berlin
    Then user sees Soho house berlin noticeboard

  @regression
  Scenario: Create a post on other house's noticeboard
    Given user sees Soho house berlin noticeboard
    When the user taps on Post
    And user inputs the text
    And the user taps on Post
    Then user sees the post on the noticeboard screen

  @regression
  Scenario: Amend the post on other house's noticeboard
    Given user sees the post on the noticeboard screen
    When the user taps on Post
    And user inputs the text to amend
    And the user taps on Post
    Then user sees the post amended on the noticeboard screen

  @regression
  Scenario: Delete the post on other house's noticeboard
    Given user sees the post on the noticeboard screen
    When the user taps on Post
    And user taps on delete post
    Then user sees the post deleted on the noticeboard screen
    And go back to the home screen

  @smoke
  Scenario: Validate house perks and browse houses links
    Then user taps on house perks link to see House perks screen
    And user taps on browse the houses link to see Browse houses screen

  @smoke @ios
  Scenario: Validate home screen footer
    Then HOME button should be visible
    And WHAT'S ON button should be visible
    And MY PLANNER button should be visible
    And ACCOUNT button should be visible

  @smoke @android
  Scenario: Validate android home screen footer
    Then HOME button should be seen in menu bar
    And WHAT'S ON button should be seen in menu bar
    And MY PLANNER bbutton should be seen in menu bar
    And ACCOUNT button should be seen in menu bar

