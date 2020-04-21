@noticeboard-screen
Feature: Home Screen

Background:
  Given app is launched
  And the user is on main screen
  When user enters valid email address and password

  @smoke
  Scenario: Validate noticeboard section
    Given the user sees post button on the home screen
    And user taps on View another noticeboard link to see Noticeboards screen
    When the user taps on Post
    And user is be navigated to the noticeboard screen
    Then the user signs out of the app

  @smoke
  Scenario: User posts a post on the local house notice board
    Given the user sees post button on the home screen
    When the user taps on Post
    And the user enters a new post
    And the user sees post button on the home screen
    And user sees the post on the home screen
    But user taps on view another noticeboard
    And user sees the posts count incremented by one
    Then the user signs out of the app

  @regression
  Scenario: Amend and delete the local house's post on the noticeboard
    Given the user sees post button on the home screen
    When user inputs the text to amend
    And user sees the post amended on the home screen
    And user taps on delete post
    And user sees the post deleted from the home screen
    Then the user signs out of the app

  @regression
  Scenario: Navigate to other house noticeboard
    Given the user sees post button on the home screen
    And user taps on view another noticeboard
    When the user taps on Soho house Berlin
    And the user enters a new post on another notice board
    And user sees the post amended on the noticeboard screen
    And user sees the post deleted on the noticeboard screen
    Then the user signs out of the app