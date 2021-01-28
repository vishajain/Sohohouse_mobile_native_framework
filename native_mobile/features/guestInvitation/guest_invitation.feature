@guest-invitation-screen
Feature: This is a feature to test Guest Invitations functionality for iOS and Android

  @login-ex
  Scenario: User Logins to the app
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @smoke
  Scenario: Guest Invitations functionality from house board Screen (This Week)
    Given username is visible
    When user verifies no existing guest invitations are present
    And user taps on blackslate to view the blackslate screen
    And houseboard screen is shown
    And user click on the "House Guest"
    And user create a Guest invitation for "this week"
    And Navigate to home screen
    Then user should see an invitation under guest invitations for "this week"


  @smoke
  Scenario: Guest Invitations functionality from homeScreen (Future Week)
    Given username is visible
    When user click on the "Invite a Guest"
    And user create a Guest invitation for "future week"
    Then user should see an invitation under guest invitations for "future week"

  @smoke
  Scenario: Guest Invitations assertion & deletions under guest invitations
    Given greetings should be visible
    When I click on Account button on home screen
    And user click on the "Guest Invitations"
    And user delete the existing invitations
    And user confirms existing invitations deleted
      | invite      |
      | this week   |
      | future week |
    Then the user signs out and closes the app