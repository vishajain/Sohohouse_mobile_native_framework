@notification-screen @iOS_will_fail
Feature: This feature enables us to test the notifications functionality

  @smoke @regression @notification_preferences @events
  Scenario: User updates their notification preferences for events
    When greetings should be visible
    And I click on Account button on home screen
    And I tap on settings
   And verify the toggle functionality
      | Event                |
      | Your events          |
      | Your screenings      |
      | Welcome to the House |
    And user goes back to the account screen
    Then member is not on home screen from account screen

  @smoke @regression @notification_preferences
  Scenario: User verifies the different notification preferences
    Given I click on Account button on home screen
    And I tap on settings
    And verify push notifications preference for connect is displayed
      | Event                     |
      | Events                    |
      | Your events               |
      | Your screenings           |
      | Connect                   |
      | Noticeboard reactions     |
      | Noticeboard               |
      | Contact details           |
      | Reminder                  |
      | Soho House Communications |
    Then user goes back to the account screen

  @smoke @regression @notification_preferences @connects
  Scenario: User updates their notification preferences for Connect
    Given I click on Account button on home screen
    And I tap on settings
    And verify the toggle functionality
      | Event                 |
      | Noticeboard reactions |
      | Noticeboard           |
      | Contact details       |
      | Reminder              |
    Then user goes back to the account screen
    Then member is not on home screen from account screen


  @smoke @regression @notification_preferences @communication
  Scenario: User updates their notification preferences for communication
    Given I click on Account button on home screen
    And I tap on settings
    And verify the toggle functionality
      | Event                           |
      | News, events and stories->email |
      | News, events and stories->push  |
    And user goes back to the account screen
    Then the user signs out and closes the app

