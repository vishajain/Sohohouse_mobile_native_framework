@Favourite-Houses-screen  @regression
Feature: This feature enables us to test the sync calendar functionality

  @smoke @favourite_houses
  Scenario: User adds a house to his list of favourite houses
    Given username is visible
    And I click on Account button on home screen
    When the user adds below favourite houses and clicks save button
      | Location | Houses               |
      | Europe   | Soho House Amsterdam |
    And I verify "Soho House Amsterdam" is displayed
    Then member is not on home screen from account screen