#@myplanner-screen
#Feature: My Planner screen
#
#
#  Background:
#
#  @smoke @login-ex
#  Scenario: Login with valid user credentials
#    Given app is launched
#    And user is on sign in screen
#    When user enters valid email address and password
#    Then user clicks on go button
#
#  @smoke
#  Scenario: Validate Myplanner screen title
#    Given username is visible
#    When user clicks on my planner button
#    Then user sees my planner screen title
#
#  @smoke
#  Scenario: Validate my planner sections
#    Given user sees my planner screen title
#    Then user sees the Upcoming tab
#    Then user sees the Booking history tab
#
#  @smoke
#  Scenario: Select the favourite house as Shoreditch house
#    When user clicks on Account button on home screen
#    When user taps on favourite houses
#    And user selects Shoreditch house
#    And tap on Save changes
#
#  @smoke
#  Scenario: Book a member event and verify in the my planner section
#    Given user clicks on what's on button
#    And user books to the My planner member event
#    Then user sees the My planner member event booking in the my planner
#
#  @smoke
#  Scenario: Book a gym event and verify in the my planner section
#    Given user clicks on what's on button
#    And user books to the My planner gym event
#    Then user sees the My planner gym event booking in the my planner
#
#  @smoke
#  Scenario: Upcoming tab validation
#    Given user sees the Booking history tab
#    When user taps the Booking history tab
#    Then user sees the See the events and rooms you've booked in the past description
#
#  @smoke
#  Scenario: Verify the member event booked in the upcoming bookings section of house board screen
#    When user taps on blackslate to view the blackslate screen
#    Then user sees My planner member under upcoming bookings heading
#
#  @smoke
#  Scenario: Verify the gym event booked in the upcoming bookings section of house board screen
#    Then user sees My planner gym under upcoming bookings heading
#
#  @smoke
#  Scenario: Close the houseboard screen and navigate to home screen
#    Then member is not on home screen from blackslate screen
#    Then user navigates back to the home screen from my planner