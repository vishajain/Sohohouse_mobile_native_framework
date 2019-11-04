@Onboarding-screens
Feature: Onboarding

  Background:

  @smoke
  Scenario: Login with valid user credentials
    Given app is launched
    And user is on sign in screen
    When user enters valid email address and password
    Then user clicks on go button

  @ios @smoke
  Scenario:: User accepts Terms & Conditions to see Help us improve screen
    Given user sees T & C screen
    When user accepts T & C
    Then user sees Help us improve screen

  @ios @smoke
  Scenario:: User continues to see the House rules screen
    When user allows to help us
    Then user sees House rules screen

  @ios @smoke
  Scenario:: User accepts House rules to see my planner screen
    When user accepts House rules
    Then user sees my planner screen

  @ios @smoke
  Scenario:: User continues to see welcome screen
    When user continue without syncing
    Then user sees welcome screen

  @smoke
  Scenario:: User continues to see the make it personal screen
    When user continue from welcome screen
    Then user sees make it personal screen

  @smoke
  Scenario:: User continues to see Introducing noticeboard screen
    When user selects the favourite houses
    And user continue from make it personal screen
    Then user sees Introducing Noticeboard screen

  @smoke
  Scenario:: User continues to see Noticeboard screen
    When user clicks on continue
    Then user sees Noticeboard screen

  @smoke
  Scenario:: User continues to see Notification preferences screen
    When user clicks on next
    Then user sees Notification preferences screen

  @smoke
  Scenario:: User continues to see You're all set screen
    When user clicks on OK
    And user shown with alert to allow
    Then user sees You're all set screen

  @smoke
  Scenario:: User continues to see the home screen
    When user clicks on next on all set screen
    Then user sees the home screen