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

    @regression234
  Scenario Outline: Verify live stream event on connect screen
    Given greetings should be visible
    When I navigate to Connect page
    And I verify the "<Live event>" is displayed on the screen
    And user post a "<Message_text>" in group chat
    And I verify "<See all>" functionality and verify the screen "<Title>"
    Then I navigate to Home page
    Examples:
      |Live event           | Message_text  | See all | Title      |
      |Recurring_live_event | Hi!! | See all | Live Rooms |


