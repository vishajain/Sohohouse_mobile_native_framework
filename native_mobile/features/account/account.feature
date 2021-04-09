@Account-screen
Feature: Account screen

  @login-ex
  Scenario: User Logins to the app
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @smoke @regression @verify_account_Screen @ios
  Scenario: Validate Account screen title
    Given greetings should be visible
    When I click on Account button on home screen
    Then I verify all the links under account
      | Link                  | Title                   |
      | View profile          | Edit profile            |
      | Membership            | Your membership         |
      | Guest invitations     | Guest invitations       |
      | Bookings              | Bookings                |
      | Payments              | Add payment method      |
      | Favourite Houses      | Favourite Houses        |
      | Terms and policies    | Sign in to your account |
      | Settings              | Settings                |
      | FAQs                  | FAQ                     |


  @smoke @regression @verify_account_Screen @android
  Scenario: Validate Account screen title
    Given greetings should be visible
    When I click on Account button on home screen
    Then I verify all the links under account
      | Link                  | Title               |
      | View profile          | Edit                |
      | Your membership       | Membership          |
      | Guest Invitations     | Guest Invitations   |
      | Payment               | Add payment method  |
      | Bookings              | Bookings            |
      | Settings              | Settings            |
      | Favourite Houses      | Favourite Houses    |
      | Terms & Policies      | Legal               |
      | Contact us            | Contact us          |
      | FAQ                   | FAQ                 |

  @smoke @test
  Scenario: I submit the enquiry using contact us form
    Given I tap on Contact us form
    When I provides Type of enquiry as General enquiry
    And I provides Topic of enquiry as Feedback
    And I enter enquiry message as I like your services
    Then I submits the enquiry
    Then I navigate to confirmation screen
    Then I navigate back and sign out of the app




