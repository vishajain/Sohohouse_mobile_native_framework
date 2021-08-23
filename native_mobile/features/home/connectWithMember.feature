@connect-screen @regression
Feature: This feature enables us to test the connect with members functionality

  @smoke @connect @ios
  Scenario: Validate "Join a conversation" functionality
    Given greetings should be visible
    When I navigate to Connect page
    And I verify the title on connect screen
      |Title               |
      |Connect with members|
    Then I click on Join the Conversation and schedule the call
      |Interests|
      |Travel   |
    And I confirm call is scheduled
    And I cancelled the scheduled call
    And I navigate to Home page

  Scenario: Navigate to blocked members screen
    Given greetings should be visible
    When I navigate to Connect page
    Then I navigate to blockedMembers screen
    And I verify the title of blocked members screen
    And I navigate to Home page
