@EditProfile-screen
Feature: This feature enables us to test the edit profile functionality

  Background:

  @login-ex
  Scenario: User Logins to the app
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @smoke @regression @edit_profile @ios
  Scenario: Validate Edit profile fields
    Given I click on Account button on home screen
    When I verify the profile screen title
    And I verify edit profile links
      | Link            | Value               |
      | What do you do  | profession          |
      | Industry        | industry            |
      | About me        | about-me            |
      | City            | city                |
      | Let's chat      | chat                |
      | Interests       | interest1           |
  And I verify the social account link
      | Link      |
      | Website   |
      | Instagram |
      | Twitter   |
      | LinkedIn  |
      | Spotify   |
      | YouTube   |
    Then I verify the updated fields
      | Value               |
      | profession          |
      | industry            |
      | about-me            |
      | city                |
      | chat                |
      | interest1           |
      | website             |
      | instagram           |
      | twitter             |
      | linkedIn            |
      | spotify             |
      | youtube             |
 Then the user signs out and closes the app

  @smoke @regression @edit_profile @android
  Scenario: Validate Edit profile fields
    Given I click on Account button on home screen
    When I verify the profile screen title
    And I verify edit profile links
      | Link            | Value               |
      | What you do     | profession          |
      | About me        | about-me            |
      | City            | city                |
      | Let's chat      | chat                |
      | Interests       | interest1           |
    And I verify the social account link
      | Link      |
      | Website   |
      | Instagram |
      | Twitter   |
      | LinkedIn  |
      | Spotify   |
      | YouTube   |
    Then I verify the updated fields
      | Value               |
      | profession          |
      | about-me            |
      | city                |
      | chat                |
      | interest1           |
      | Website             |
      | Instagram           |
      | Twitter             |
      | LinkedIn            |
      | Spotify             |
      | Youtube             |
    Then the user signs out and closes the app