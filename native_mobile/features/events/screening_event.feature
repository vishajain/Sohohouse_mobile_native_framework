@screening_events @smoke_old @regression
Feature: Book Screening event
  As a member
  I navigate to events page
  So that I can book screening events

  @smoke @ios
  Scenario Outline: Book different screening event
    Given greetings should be visible
    When I navigate to what's on screen
    And tap on Screenings tab and set filter
    And I click on the below "<Event Name>" of "<Event Type>" and book "<Tickets>" tickets with "<Book>"
    And I should be able to successfully book event for member with status "<Status>"
    And I click on Account button on home screen
    And I verify that "<Event Name>" is displayed under Events in "Bookings" page
    And I book <No. of Guest> ticket for guests  and verify status for the "<Event Name>" of "<Event Type>"
    And I cancel the above booked event
    Then I navigate to Home page
    Examples:
      | Event Type                        | Event Name                      | Book                        | Tickets | Status                      | No. of Guest |
     | Priceless_lottery,Screening_Event | Monty Python and the Holy Grail  | Join lottery                | 1       | YOU HAVE JOINED THE LOTTERY | 1            |
      | Paid,Screening_Event              | Avataar                         | Book & pay,Confirm deposit  | 2       | YOU AND 1 GUEST(S) ARE GOING| -1           |
      | ticketless,Screening_Event        | Red Rose                        | Book                        | NA      |                             | NA           |


  @smoke @android
  Scenario Outline: Book different screening event
    Given greetings should be visible
    When I navigate to what's on screen
    And tap on Screenings tab and set filter
    And I click on the below "<Event Name>" of "<Event Type>" and book "<Tickets>" tickets with "<Book>"
    And I should be able to successfully book event for member with status "<Status>"
    Then I click on Account button on home screen
    And I verify that "<Event Name>" is displayed under Events in "Bookings" page
    And I book <No. of Guest> ticket for guests  and verify status for the "<Event Name>" of "<Event Type>"
    And I cancel the above booked event
    Then I navigate to Home page
    Examples:
      | Event Type                        | Event Name                      | Book                        | Tickets | Status                      | No. of Guest |
      | Priceless_lottery,Screening_Event | Monty Python and the Holy Grail | Join lottery                | 1       | You have joined the lottery | 1            |
      | Paid,Screening_Event              | Avataar                         | Buy tickets,Confirm deposit | 2       | YOU AND 1 GUEST(S) ARE GOING| -1           |
      | ticketless,Screening_Event        | Red Rose                        | Add to bookings             | NA      |                             | NA           |

#  @login-ex
#  Scenario: : Logout from the app
#    Given the user signs out and closes the app
