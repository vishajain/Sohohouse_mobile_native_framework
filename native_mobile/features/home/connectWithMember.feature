@connect-screen @regression
Feature: This feature enables us to test the connect with members functionality

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

  Scenario Outline: Verify leaving a live stream room confirmation pop up and post call connection
    Given user enters test-connect as email address
    When user clicks on go button
    And Skip the onboarding screen
    And user join the "<Live stream event>" and leave it
    And the user signs out and closes the app
    And user clicks on Member Sign in button
    And user enters test-user as email address
    And user clicks on go button
    And Skip the onboarding screen
    And greetings should be visible
    And I verify the confirmation pop up on leaving a "<Live stream event>"
    And user verify the post call connection screen is displayed
    Then I navigate to Home page
    Examples:
      | Live stream event    |
      | Recurring_live_event |
