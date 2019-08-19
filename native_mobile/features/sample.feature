Feature: Adding

  @verify-home-screen @smoke
  Scenario: Validate home screen
    Given user is on sign in screen
    And user enters valid email address and password
    And user clicks on go button
    Then username should be visible
    And happening now should be visible
    And house notes should be visible
    And see all stories should be visible
    And house perks link should be visible
    And browse the houses link should be visible