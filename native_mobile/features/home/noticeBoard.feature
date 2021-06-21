@noticeBoard-screen @regression
Feature: his feature enables us to test the house board functionality

  @smoke @post_on_noticeboard
  Scenario: User posts a post on the local house notice board
    Given greetings should be visible
    When I navigate to connect screen
    And I write a post
      | Message           | House                    | Topic |
      | How are you all   | UK->Babington House      | Music |
    And I see the post on the noticeboard screen
    Then I navigate to Home page


  @smoke @post_on_noticeboard
  Scenario: Like and Reply to a post
    Given greetings should be visible
    When I navigate to connect screen
    And I select a post and like the post
    And I reply to the post
    And I verify post is liked and replied
    Then I navigate to Home page

  @smoke @post_on_noticeboard
  Scenario: Delete a Post
    Given greetings should be visible
    When I navigate to connect screen
    And I delete the post
    And I verify post is deleted
    Then I navigate to Home page
