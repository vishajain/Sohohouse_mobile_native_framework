@member_events @smoke @regression
Feature: Book member event
  As a member
  I navigate to events page
  So that I can book member events

  @login-ex
  Scenario: : Login as member and navigate to whats'on page
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

  @smoke @ios
  Scenario Outline: Book different member event
    Given greetings should be visible
    When I navigate to what's on screen
    And tap on Events tab and set filter
    And I click on the below "<Event Name>" of "<Event Type>" and book "<Tickets>" tickets with "<Book>"
    And I should be able to successfully book event for member with status "<Status>"
    And I click on Account button on home screen
    And I verify that "<Event Name>" is displayed under Events in "Bookings" page
    And I book <No. of Guest> ticket for guests  and verify status for the "<Event Name>" of "<Event Type>"
    And I cancel the above booked event
    Then I click to Home tab
    Examples:
      | Event Type             | Event Name              | Book                      | Tickets | Status                   | No. of Guest |
      | Priceless,Member_Event | Cashless Member Event   | Book                      | 1       | YOU’RE ON THE GUEST LIST | 2            |
      | Paid,Member_Event      | Paid Member Event       | Book & pay,Buy ticket(s)  | 1       | YOU’RE ON THE GUEST LIST | 0            |
      | ticketless,Member_Event| Ticketless Member Event | Book                      | NA      |                          | NA           |


  @smoke @android
  Scenario Outline: Book different member event
    Given greetings should be visible
    When I navigate to what's on screen
    And tap on Events tab and set filter
    And I click on the below "<Event Name>" of "<Event Type>" and book "<Tickets>" tickets with "<Book>"
    And I should be able to successfully book event for member with status "<Status>"
    And I click on Account button on home screen
    And I verify that "<Event Name>" is displayed under Events in "Bookings" page
    And I book <No. of Guest> ticket for guests  and verify status for the "<Event Name>" of "<Event Type>"
    Then I cancel the above booked event
    Examples:
      | Event Type             | Event Name              | Book                      | Tickets | Status                   | No. of Guest |
      | Priceless,Member_Event | Cashless Member Event   | Book                      | 1       | YOU'RE ON THE GUEST LIST | 2            |
      | Paid,Member_Event      | Paid Member Event       | Buy tickets,Buy ticket(s) | 1       | YOU'RE ON THE GUEST LIST | 0            |
      | ticketless,Member_Event| Ticketless Member Event | Add to bookings           | NA      |                          | NA           |

  @login-ex
  Scenario: : Logout from the app
    Given the user signs out and closes the app
