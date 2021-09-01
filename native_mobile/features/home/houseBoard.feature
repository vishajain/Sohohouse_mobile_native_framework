@houseBoard-screen @regression
Feature: This feature enables us to test the house board functionality

  @smoke @house_board @ios
  Scenario: Validate Houseboard navigation
    Given greetings should be visible
    When I tap on blackslate to view the blackslate screen
    And I verify the houseboard screen
    And I verify the link under blackslate
      | Link             | Title                          |
      | Babington House  | House                          |
      | Membership card  | Your membership                |
      | Book a bedroom   | Stay with us                   |
      | House rules      | House guidelines               |
    Then I close the houseboard screen
    Then greetings should be visible

  @smoke @house_board @android
  Scenario: Validate Houseboard navigation
    Given greetings should be visible
    When I tap on blackslate to view the blackslate screen
    And I verify the houseboard screen
    And I verify the link under blackslate
      | Link            | Title          |
      | House Guest     | New invitation |
      | Babington House | House          |
      | Membership card | 20001 123 566  |
      | Book a bedroom  | Stay with us   |
      | House rules     | Global House Rules    |
    Then I close the houseboard screen
