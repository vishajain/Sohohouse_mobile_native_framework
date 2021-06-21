@Account-screen  @regression
Feature: Account screen

  @smoke @verify_account_Screen @ios
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
    Then I navigate to Home page


  @smoke @verify_account_Screen @android
  Scenario: Validate Account screen title
    Given greetings should be visible
    When I click on Account button on home screen
    Then I verify all the links under account
      | Link                  | Title               |
      | View profile          | Edit                |
      | My connections        | Connections         |
      | Your membership       | Membership          |
      | Guest Invitations     | Guest Invitations   |
      | Payment               | Add payment method  |
      | Settings              | Settings            |
      | Bookings              | Bookings            |
      | Favourite Houses      | Favourite Houses    |
      | Terms & Policies      | Legal               |
      | Contact us            | Contact us          |
      | FAQ                   | FAQ                 |
    Then I navigate to Home page

  @smoke @test
  Scenario: I submit the enquiry using contact us form
    Given I navigate to Account page
    Given I tap on Contact us form
    When I provides Type of enquiry as General enquiry
    And I provides Topic of enquiry as Feedback
    And I enter enquiry message as I like your services
    Then I submits the enquiry
    Then I navigate to confirmation screen
    Then I navigate back to accounts
    Then I navigate to Home page





