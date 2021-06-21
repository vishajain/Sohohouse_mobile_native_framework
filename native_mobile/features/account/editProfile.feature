@EditProfile-screen @regression
Feature: This feature enables us to test the edit profile functionality


  @smoke @edit_profile @ios
  Scenario: Validate Edit profile fields
    Given I click on Account button on home screen
    When I verify the profile screen title
    And I verify edit profile links
      | Link            | Value               |
      | What do you do  | profession          |
      | Industry        | industry            |
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
    And I verify the updated fields
      | Value               |
      | profession          |
      | industry            |
      | city                |
      | chat                |
      | interest1           |
      | website             |
      | instagram           |
      | twitter             |
      | linkedIn            |
      | spotify             |
      | youtube             |
    Then I navigate to Home page

  @smoke @edit_profile @android
  Scenario: Validate Edit profile fields
    Given I click on Account button on home screen
    When I verify the profile screen title
    And I verify edit profile links
      | Link            | Value               |
      | What you do     | profession          |
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
      | Youtube   |
    And I verify the updated fields
      | Value               |
      | profession          |
      | city                |
      | chat                |
      | interest1           |
      | Website             |
      | Instagram           |
      | Twitter             |
      | LinkedIn            |
      | Spotify             |
      | Youtube             |
    Then I navigate to Home page