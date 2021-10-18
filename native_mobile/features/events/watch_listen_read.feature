@watch-listen_read @regression
Feature: Verify watch, listen and read screen
  As a member
  I want to go through watch, listen and read feature

  @smoke @ios
  Scenario: Verify watch, listen and read screen
    Given greetings should be visible
    When I navigate to Watch_listen_read page
    And I verify the watch screen
    |Topic | Title  |
    |Watch | Watch  |
    |Listen| Listen |
    |Read  |  Read  |
    Then I navigate to Home page