@gym_events @smoke_old @regression
Feature: Book gym event
  As a member
  I navigate to events page
  So that I can book gym events


  @smoke @ios
  Scenario Outline: Book different gym event
    When greetings should be visible
    Given I navigate to what's on screen
    When tap on Gym tab and set filter
    And I "<Book>" for "<Event Name>" of "<Event Type>"
    And I should be able to successfully book event for member with status "<Status>"
    And I click on Account button on home screen
    And I verify that "<Event Name>" is displayed under Events in "Bookings" page
    And I cancel the above booked event
    Then I navigate to Home page
    Examples:
      | Event Type          | Event Name             | Book                      | Status                   |
      | Priceless,Gym_Event | Cashless Gym Event     | Book                      | YOU’RE ON THE GUEST LIST |
      | Paid,Gym_Event      | Paid Gym Event         | Book & pay,Buy ticket(s)  | YOU’RE ON THE GUEST LIST |
      | ticketless,Gym_Event| Ticketless Gym Event   | Book                      |                          |


  @smoke @android
  Scenario Outline: Book different gym event
    Given greetings should be visible
    When I navigate to what's on screen
    And tap on Gym tab and set filter
    And I "<Book>" for "<Event Name>" of "<Event Type>"
    And I should be able to successfully book event for member with status "<Status>"
    And I click on Account button on home screen
    And I verify that "<Event Name>" is displayed under Events in "Bookings" page
    And I cancel the above booked event
    Then I navigate to Home page
    Examples:
      | Event Type          | Event Name             | Book                      | Status                   |
      | Priceless,Gym_Event | Cashless Gym Event     | Book                      | YOU'RE ON THE GUEST LIST |
      | Paid,Gym_Event      | Paid Gym Event         | Book & Pay,Buy ticket(s)  | YOU'RE ON THE GUEST LIST |
      | ticketless,Gym_Event| Ticketless Gym Event   | Add to bookings           |                          |

