@Favourite-Houses-screen @regression
Feature: This feature enables us to test the FavouriteHouses functionality

  @smoke @favourite_houses
  Scenario: User adds a house to his list of favourite houses
    Given greetings should be visible
    And I click on Account button on home screen
    When the user adds below favourite houses and clicks save button
      | Location | Houses         |
      | UK       | 76 Dean Street |
    And I verify "76 Dean Street" is displayed
    Then I navigate to Home page