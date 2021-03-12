@houseBoard-screen
Feature: This feature enables us to test the house board functionality

  Background:
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @smoke @house_board @ios
  Scenario: Validate Houseboard navigation
    Given username is visible
    When I tap on blackslate to view the blackslate screen
    And I verify the houseboard screen
    And I verify the link under blackslate
      | Link             | Title                          |
      | House Pay        | Add to Apple Wallet            |
      | Babington House  | House                          |
      | Membership card  | Your membership                |
      | Book a bedroom   | Stay with us                   |
      | House rules      | House guidelines               |
    Then I close the houseboard screen
    Then the user signs out and closes the app

  @smoke @house_board @android
  Scenario: Validate Houseboard navigation
    Given username is visible
    When I tap on blackslate to view the blackslate screen
    And I verify the houseboard screen
    And I verify the link under blackslate
      | Link            | Title          |
      | House Guest     | New invitation |
      | Babington House | House          |
      | Membership card | 20001 123 566  |
      | Book a bedroom  | Stay with us   |
      | House rules     | House Rules    |
    Then I close the houseboard screen

    Then the user signs out and closes the app
