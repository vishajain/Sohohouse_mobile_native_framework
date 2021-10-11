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

  Scenario: Verify share your room functionality
    Given greetings should be visible
    When I navigate to Connect page
    And I click on Share your room
    And I navigate to room by clicking on open room
    | Fields        |
    | Camera        |
    | Microphone    |
    | Notifications |
    And I verified I am in a room
    And I come out of the room
    Then I navigate to Home page

  Scenario: Validate "Join a conversation" functionality
    Given greetings should be visible
    When I navigate to Connect page
    Then I verify all the sections under connect
      | Section               | Title           |
      | Share your room       | Your room       |
      | Join a conversation   | Interests       |
      | Find members          | Find members    |
      | Share profile         | Share profile   |
    And I verify the sections under set up your account panel
      | Section                                                        | Title           |
      | Let other members know what you are interested in talking about| Let's chat      |
      | Complete your profile                                          | Edit profile    |
    And I navigate to Home page


  Scenario Outline: Verify Call history and My connections and Block member functionality
    Given user enters test-connect as email address
    When user clicks on go button
    And Skip the onboarding screen
    And I navigate to Noticeboard page
    And I write a post
      | Message           | House                    | Topic |
      | How are you all   | UK->Babington House      | Music |
    And the user signs out and closes the app
    And user clicks on Member Sign in button
    And user enters test-user as email address
    And user clicks on go button
    And Skip the onboarding screen
    And I navigate to Noticeboard page
    And I selected "<Post>" and blocked a "<Member>"
    And I navigate to connect screen
    And I verify Call history details
    And I verify myConnections and block Member functionality
    Then I navigate to Home page
    Examples:
      | Post            | Member              |
      | How are you all | SFFactory TestUser  |


  Scenario Outline: Validate open users profile by clicking on profile picture
    Given user enters test-connect as email address
    When user clicks on go button
    And Skip the onboarding screen
    And user post a "<Message_text>" in group chat under "<Live stream event>"
    And user captures the username under account screen
    And the user signs out and closes the app
    And user clicks on Member Sign in button
    And user enters test-user as email address
    And user clicks on go button
    And Skip the onboarding screen
    And greetings should be visible
    And I verify the username under the message and open profile by clicking profile picture in "<Live stream event>"
    And I verify connect during a call functionality
    Then I navigate to Home page
    Examples:
      | Live stream event    | Message_text  |
      | Recurring_live_event | Hello!!       |


