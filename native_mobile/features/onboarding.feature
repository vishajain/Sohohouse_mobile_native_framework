@onboarding
Feature: Onboarding

  Background:


  @valid-login @smoke
  Scenario: Login with valid user credentials
    Given app is launched
    And user is on sign in screen
    When user enters valid email address and password
    Then user clicks on go button

  @onboarding @smoke
  Scenario:: User accepts Terms & Conditions
    Given user clicks on go button and sees T & C screen
    Then user accepts T & C

  @onboarding @smoke
  Scenario:: User allows Help us improve
    Given user accepts T & C and sees Help us improve screen
    Then user allows to help us

  @onboarding @smoke
  Scenario:: User accepts House rules
    Given user allows help improve and sees House rules screen
    Then user accepts House rules

  @onboarding @smoke
  Scenario:: User continue without sync on my planner screen
    Given user accepts House rules and sees my planner screen
    Then user continue without syncing

  @onboarding @smoke
  Scenario:: User sees welcome page and continue
    Given user continue without syncing and sees welcome screen
    Then user continue from welcome screen

  @onboarding @smoke
  Scenario:: User personalises the favourite houses
    Given user continues from welcome screen and sees make it personal screen
    Then user selects the favourite houses
    And user continue from make it personal screen

  @onboarding @smoke
  Scenario:: User sees the Introducing Noticeboard screen and continue
    Given user continues from make it personal and sees Introducing Noticeboard screen
    Then user clicks on continue

  @onboarding @smoke
  Scenario:: User sees the Noticeboard screen and continue
    Given user continues from Notice intro and sees Noticeboard screen
    Then user clicks on next

  @onboarding @smoke
  Scenario:: User accepts the Notification preferences
    Given user continues from Noticeboard and sees Notification preferences screen
    Then user clicks on OK
    And user shown with alert to allow
    And user clicks on OK

  @onboarding @smoke
  Scenario:: User sees the You're all set screen and continue
    Given user continues from Notification preferences and sees You're all set screen
    Then user clicks on next