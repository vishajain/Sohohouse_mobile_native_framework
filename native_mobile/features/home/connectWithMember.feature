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


  Scenario: Verify live stream event on home page
    Given greetings should be visible
    When I verify liveStreamed Rooms heading and events available on the screen
    Then I verify the Live event
      |Live stream event  |
      |Visha_test_event_5 |


  Scenario: Verify live stream event on connect screen
    Given greetings should be visible
    When I navigate to Connect page
    Then I verify liveStreamed Rooms heading and events available on the screen
    And I verify the Live event
      |Live stream event  |
      |Visha_test_event_5 |
    And I navigate to Home page


  Scenario: Verify post message in live stream event
    When I verify liveStreamed Rooms heading and events available on the screen
    Then I verify posting message
      |Live stream event  |
      |Visha_test_event_5 |

  Scenario: Verify non Live stream event on Home screen
    Given greetings should be visible
    When I verify liveStreamed Rooms heading and events available on the screen
    And I verify the non Live event
      |Live stream event  |
      |Visha_test_non_live_event_1 |