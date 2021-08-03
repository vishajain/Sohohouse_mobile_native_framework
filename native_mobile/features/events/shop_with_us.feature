@shop_with_us @regression
  Feature: Shop with us
    As a member
    I navigate to shop
    So that I can purchase shop items

  @smoke @ios
  Scenario: Navigate through shop links
    Given greetings should be visible
    When I navigate to Shop page
    Then I clicked on Shop link & verify the shopLinks
      |Links      | Title                    |
      |Soho Home  | Soho Home                |
      |Cowshed    | Cowshed                  |
      |Neville    | Neville                  |
      |Store X    | A world of possibilities |
    When I navigate to Home page