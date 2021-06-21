@guest-invitation-screen @regression
Feature: This is a feature to test Guest Invitations functionality for iOS and Android

  @smoke @ios
  Scenario: Guest Invitations assertion & deletions under guest invitations
    Given greetings should be visible
    When user verifies no existing guest invitations are present
    And I click on Account button on home screen
    And user click on the "Guest invitations"
    And user click on the "Create a new invitation"
    And user create a Guest invitation for "this week"
    And I navigate back
    Then user should see an invitation under guest invitations for "this week"

  @smoke @android
  Scenario: Guest Invitations functionality from house board Screen (This Week)
    Given greetings should be visible
    When user verifies no existing guest invitations are present
    And I tap on blackslate to view the blackslate screen
    And I verify the houseboard screen
    And user click on the "House Guest"
    And user create a Guest invitation for "this week"
    And Navigate to home screen
    Then user should see an invitation under guest invitations for "this week"


  @smoke @ios
  Scenario: Guest Invitations functionality from homeScreen (Future Week)
    Given greetings should be visible
    When user click on the "Invite a guest"
    And user create a Guest invitation for "future week"
    Then user should see an invitation under guest invitations for "future week"

  @smoke @android
  Scenario: Guest Invitations functionality from homeScreen (Future Week)
    Given greetings should be visible
    When user click on the "Invite a Guest"
    And user create a Guest invitation for "future week"
    Then user should see an invitation under guest invitations for "future week"

  @smoke
  Scenario: Guest Invitations assertion & deletions under guest invitations
    Given greetings should be visible
    When I click on Account button on home screen
    And user click on the Guest Invitations
    And user delete the existing invitations
    And user confirms existing invitations deleted
      | invite      |
      | this week   |
      | future week |
  Then I navigate to Home page