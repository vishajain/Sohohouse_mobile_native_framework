@gym_events @smoke_old @regression
Feature: Book gym event
  As a member
  I navigate to events page
  So that I can book gym events

  @login-ex
  Scenario: : Login as member and navigate to whats'on page
    Given app is launched
    And the user is on main screen
    When user enters valid email address and password

@smoke
  Scenario Outline: Book different gym event
    When greetings should be visible
    And I navigate to what's on screen
    And tap on Gym tab and set filter
    And I "<Book>" for "<Event Name>" of "<Event Type>"
    And I should be able to successfully book event for member with status "<Status>"
    Then user clicks on Account button on home screen
    And I verify that "<Event Name>" is displayed under Events in "Bookings" page
    Then I cancel the above booked event
    Examples:
      | Event Type          | Event Name             | Book                      | Status                   |
      | Priceless,Gym_Event | Cashless Gym Event     | Book                      | YOU'RE ON THE GUEST LIST |
      | Paid,Gym_Event      | Paid Gym Event         | Book & Pay,Buy ticket(s)  | YOU'RE ON THE GUEST LIST |
      | ticketless,Gym_Event| Ticketless Gym Event   | Add to bookings           |                          |

  @login-ex
  Scenario: : Logout from the app
    Given the user signs out and closes the app
