@noticeBoard-screen

Feature: his feature enables us to test the house board functionality

  Background:

  @login-ex
  Scenario: User Logins to the app
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @smoke @verify_noticeboard @ios
  Scenario: Validate noticeboard section
    Given I see the post button on the home screen
    When I tap on Post

  @smoke @post_on_noticeboard
  Scenario: User posts a post on the local house notice board
    Given greetings should be visible
    And I navigate to connect screen
    And I write a post
      | Message           | House                | Topic |
      | How are you all   | Babington House      | Music |
    And I see the post on the noticeboard screen
    Then I click to Home tab


  @smoke @post_on_noticeboard
  Scenario: Like and Reply to a post
    Given greetings should be visible
    And I navigate to connect screen
    And I select a post and like the post
    And I reply to the post
    Then I verify post is liked and replied
    Then I click to Home tab

  @smoke @post_on_noticeboard
  Scenario: Delete a Post
    Given greetings should be visible
    And I navigate to connect screen
    And I delete the post
    And I verify post is deleted
    And I click to Home tab
    Then the user signs out and closes the app
