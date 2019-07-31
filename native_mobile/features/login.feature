@login
Feature: Login

  Background:


  @valid-login @smoke
  Scenario: Login with valid user credentials
    Given app is launched
    And user is on sign in screen
    When user enters valid email address and password
    Then user clicks on go button