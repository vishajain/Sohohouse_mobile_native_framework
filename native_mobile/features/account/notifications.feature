@notification-screen @iOS_will_fail
Feature: This feature enables us to test the notifications functionality

  @login-ex
  Scenario: User Logins to the app
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @smoke @regression @notification_preferences @events
  Scenario: User updates their notification preferences for events
    Given user clicks on Account button on home screen
    And user taps on settings
   And unselect push notification preference
      | Event                |
      | Your events          |
      | Your screenings      |
      | Welcome to the House |
    And push notifications preference is switched off
      | Event                |
      | Your events          |
      | Your screenings      |
      | Welcome to the House |
    And select push notifications preference
      | Event                |
      | Your events          |
      | Your screenings      |
      | Welcome to the House |
    Then push notifications preference is switched on
     | Event                |
     | Your events          |
     | Your screenings      |
     | Welcome to the House |
    Then user goes back to the account screen

  @smoke @regression @notification_preferences
  Scenario: User verifies the different notification preferences
    Given user clicks on Account button on home screen
    And user taps on settings
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
    Given user clicks on Account button on home screen
    And user taps on settings
    And unselect push notifications preference
      | Event                 |
      | Noticeboard reactions |
      | Noticeboard           |
      | Contact details       |
      | Reminder              |
    And push notifications preference is switched off
      | Event                 |
      | Noticeboard reactions |
      | Noticeboard           |
      | Contact details       |
      | Reminder              |
    And select push notifications preference
      | Event                 |
      | Noticeboard reactions |
      | Noticeboard           |
      | Contact details       |
      | Reminder              |
    And push notifications preference is switched on
      | Event                 |
      | Noticeboard reactions |
      | Noticeboard           |
      | Contact details       |
      | Reminder              |
    Then user goes back to the account screen


  @smoke @regression @notification_preferences @communication
  Scenario: User updates their notification preferences for communication
    Given user clicks on Account button on home screen
    And user taps on settings
    And select push notifications preference
      | Event                           |
      | News, events and stories->email |
      | News, events and stories->push  |
    And push notifications preference is switched on
      | Event                           |
      | News, events and stories->email |
      | News, events and stories->push  |
    And unselect push notifications preference
      | Event                           |
      | News, events and stories->email |
      | News, events and stories->push  |
    And push notifications preference is switched off
      | Event                           |
      | News, events and stories->email |
      | News, events and stories->push  |
    And user goes back to the account screen
    Then the user signs out and closes the app

