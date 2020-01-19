@Account-screen
Feature: Active functionality

#  non.active.shw.local@example.com - Local House - non active
#  active.shw.local@example.com  - Local house- active
#  active-plus.shw.local@example.com  - Local house - active+
#  non.active.every.local@example.com  - Every House - non active
#  active.every.local@example.com - Every house - active
#  active-plus.every.local@example.com  - every house - active+
#  active-plus.shk.local@example.com - Local House - active +
#  non.active.shk.local@example.com ->  Local House - non active
#  active.shk.every@example.com -> Every House - active
#
#  gem.non.active.shw.local@example.com
#  gem.non.active.every.local@example.com
#  gem.active.shw.local@example.com
#  gem.active-plus.shw.local@example.com
#  gem.active.every.local@example.com
#  gem.active-plus.every.local@example.com
#  gem.active-plus.shk.local@example.com
#  gem.non.active.shk.local@example.com
#  gem.active.shk.every@example.com
#
#  app.non.active.shw.local@example.com
#  app.non.active.every.local@example.com
#  app.active.shw.local@example.com
#  app.active-plus.shw.local@example.com
#  app.active.every.local@example.com
#  app.active-plus.every.local@example.com
#  app.active-plus.shk.local@example.com
#  app.non.active.shk.local@example.com
#  app.active.shk.every@example.com
#
#  web.non.active.shw.local@example.com
#  web.non.active.every.local@example.com
#  web.active.shw.local@example.com
#  web.active-plus.shw.local@example.com
#  web.active.every.local@example.com
#  web.active-plus.every.local@example.com
#  web.active-plus.shk.local@example.com
#  web.non.active.shk.local@example.com
#  web.active.shk.every@example.com

  Background:

# ************ NON-ACTIVE LOCAL HOUSE MEMBER TO SOHO WAREHOUSE SCENARIOS ********************


  @regression @testing
  Scenario: Login to Non active - local member to soho warehouse
#    Given user navigates to the account screen
#    And user sign-out of the app from the previous user
    Given app is launched
    When user is on sign in screen
    And user enters non-active-local as email address
    And user enters password
    And user clicks on go button
    And user sees T & C screen
    And user accepts T & C
    And user allows to help us
    And user accepts House rules
    And user continue without syncing
    And user continue from welcome screen
    And user continue from make it personal screen
    And user clicks on continue
    And user clicks on next
    And user clicks on OK
    And user clicks on next on all set screen
    Then greetings should be visible

  @regression @testing
  Scenario: Non active - local member to SHW - User navigates to Member events section
    Given greetings should be visible
    When user clicks on what's on button
    Then user sees what's on screen title
    And tap on Events tab

  @regression @testing
  Scenario: Non active - local member to SHW - Book to the PAID member event of Soho Warehouse event
    Given the paid SW Events event is found
    When user sees how many tickets to buy question
    And user taps on buy tickets on event screen
    And user sees confirm payment screen
    And user taps on buy tickets on confirm payment screen
    Then user sees you are on the guest list screen
    Then user taps on OK button
    Then user sees the event booking status as you are on the guest list on event details screen

  @regression @testing
  Scenario: Non active - local member to SHW - Cancel the PAID member event booking
    When user sees the event booking status as you are on the guest list on event details screen
    Then user cancels the event booking
    Then user navigates back to the events list

  @regression @testing
  Scenario: Non active - local to SHW - User checks the status of Gym classes as "Active members only" for Soho Warehouse events
    Given tap on Gym classes tab
    When the paid SW Gym event is found
    Then user sees the status as Active members only

  @regression @testing
  Scenario: Non active - local to SHW - validate the status on event details screen
    Then user sees the soho warehouse Active location
    Then user sees the Find out more button

  @regression @testing
  Scenario: Non active - local to SHW - Navigate to Active membership slate
    When user taps on the symbol beside Active members only
    Then user sees Active membership slate

  @regression @testing
  Scenario: Non active - local to SHW - Validate Active membership slate content
    When user sees Active membership slate
    Then user sees Active section
    Then user sees Subscribe to Active membership link
    Then user sees Active Plus section
    Then user sees Subscribe to Active Plus membership link
    Then user closes the Active membership slate slate

  @regression @testing
  Scenario: Non active - local to SHW - User taps on Find out more button and naviagate to Active membership slate
    Given user taps on Find out more button
    When user sees Active membership slate
    Then user sees Active section
    Then user sees Subscribe to Active membership link
    Then user sees Active Plus section
    Then user sees Subscribe to Active Plus membership link

  @regression @testing
  Scenario: Non active - local to SHW - User subscribes to Active membership
    Given user sees Active membership slate
    When user tap on Subscribe to Active membership link
    Then user sees Contact us form
    Then user sees enquiry type as Membership enquiry
    Then user sees enquiry topic as Add Active membership
    Then user tap on Submit link
    Then user tap on back button

  @regression @testing
  Scenario: Non active - local to SHW - User subscribes to Active plus membership
    Given user sees Active membership slate
    When user tap on Subscribe to Active Plus membership link
    Then user sees Contact us form
    Then user sees enquiry type as Membership enquiry
    Then user sees enquiry topic as Add Active membership
    Then user tap on Submit link

  @regression @testing
  Scenario: Non active - local to SHW - navigate to
    Given user sees Contact us form
    When user tap on back button
    When user closes the Active membership slate slate
    When user tap on back button
    When user clicks on Account button on home screen
    Then user sign-off from the account
    Then app is closed


 # ************ NON-ACTIVE EVERY HOUSE MEMBER TO SOHO WAREHOUSE SCENARIOS ********************


  @regression @testing
  Scenario: Login to Non-active - every house member to soho warehouse

    Given app is launched
    When user is on sign in screen
    And user enters non-active-every as email address
    And user enters password
    And user clicks on go button
    And user sees T & C screen
    And user accepts T & C
    And user allows to help us
    And user accepts House rules
    And user continue without syncing
    And user continue from welcome screen
    And user continue from make it personal screen
    And user clicks on continue
    And user clicks on next
    And user clicks on OK
    And user clicks on next on all set screen
    Then greetings should be visible

  @regression @testing
  Scenario: Non active every house member to SHW - User navigates to Member events section
    Given greetings should be visible
    When user clicks on what's on button
    Then user sees what's on screen title
    And tap on Events tab

  @regression @testing
  Scenario: Non active every house member to SHW - Book to the PAID member event of Soho Warehouse event
    Given the paid SW Events event is found
    When user sees how many tickets to buy question
    When user taps on buy tickets on event screen
    And user sees confirm payment screen
    And user taps on buy tickets on confirm payment screen
    Then user sees you are on the guest list screen
    Then user taps on OK button
    Then user sees the event booking status as you are on the guest list on event details screen

  @regression @testing
  Scenario: Non active - every member to SHW - Cancel the PAID member event booking
    When user sees the event booking status as you are on the guest list on event details screen
    Then user cancels the event booking
    Then user navigates back to the events list

  @regression @testing
  Scenario: Non active every house member to SHW - User books to the 40 Greek street Member event
    When the paid Events event is found
    And user sees how many tickets to buy question
    And user taps on buy tickets on event screen
    And user sees confirm payment screen
    And user taps on buy tickets on confirm payment screen
    Then user sees you are on the guest list screen
    Then user taps on OK button
    Then user sees the event booking status as you are on the guest list on event details screen

  @regression @testing
  Scenario: Non active - local member to SHW - Cancel the PAID member event booking
    When user sees the event booking status as you are on the guest list on event details screen
    Then user cancels the event booking
    Then user navigates back to the events list

  @regression @testing
  Scenario: Non active every house member to SHW - User books to the 40 Greek street GYM event
    When user sees the Gym classes tab
    Then tap on Gym classes tab
    And the paid Gym classes event is found
    And user taps on buy tickets on gym event screen
    And user sees confirm payment screen
    And user taps on buy tickets on confirm payment screen
    Then user sees you are on the guest list screen
    Then user taps on OK button
    Then user sees the event booking status as you are on the guest list on event details screen

  @regression @testing
  Scenario: Non active every house member to SHW - Cancel the 40 Greek street GYM event booking
    When user sees the event booking status as you are on the guest list on event details screen
    Then user cancels the event booking
    Then user navigates back to the events list

  @regression @testing
  Scenario: Non active - every house member to SHW - User checks the status of Gym classes as "Active members only" for Soho Warehouse events
    When the paid SW Gym event is found
    Then user sees the status as Active members only
    Then user sees the soho warehouse Active location
    Then user sees the Find out more button
    Then user tap on back button

  @regression @testing
  Scenario: Non active - every house member - sign out
    When user clicks on Account button on home screen
    Then user sign-off from the account
    Then app is closed


 # ************ ACTIVE LOCAL HOUSE MEMBER TO SOHO WAREHOUSE SCENARIOS ********************

  @regression @testing @active-local
  Scenario: Login to Active - local member to soho warehouse
#    Given user navigates to the account screen
#    And user sign-out of the app from the previous user
    Given app is launched
    When user is on sign in screen
    And user enters active-local as email address
    And user enters password
    And user clicks on go button
    And user sees T & C screen
    And user accepts T & C
    And user allows to help us
    And user accepts House rules
    And user continue without syncing
    And user continue from welcome screen
    And user continue from make it personal screen
    And user clicks on continue
    And user clicks on next
    And user clicks on OK
    And user clicks on next on all set screen
    Then greetings should be visible

  @regression @testing @active-local
  Scenario: Active - local member to SHW - User navigates to Member events section
    Given greetings should be visible
    When user clicks on what's on button
    Then user sees what's on screen title
    And tap on Events tab

  @regression @testing @active-local
  Scenario: Active - local member to SHW - Book to the PAID member event of Soho Warehouse
    Given the paid SW Events event is found
    When user sees how many tickets to buy question
    When user taps on buy tickets on event screen
    And user sees confirm payment screen
    And user taps on buy tickets on confirm payment screen
    Then user sees you are on the guest list screen
    Then user taps on OK button
    Then user sees the event booking status as you are on the guest list on event details screen

  @regression @testing @active-local
  Scenario: Active - local member to SHW - Cancel the PAID member event booking of Soho Warehouse
    When user sees the event booking status as you are on the guest list on event details screen
    Then user cancels the event booking
    Then user navigates back to the events list

  @regression @testing @active-local
  Scenario: Active - local to SHW - validate the status GYM event details screen
    When user sees the Gym classes tab
    Then tap on Gym classes tab
    When the paid SW Gym event is found
    Then user sees the soho warehouse Active location
    Then user sees the Book & Pay button

  @regression @testing @active-local
  Scenario: Active - local to SHW - Navigate to Active membership slate
    When user taps on the symbol beside Active members only
    Then user sees Active membership slate

  @regression @testing @active-local
  Scenario: Active - local to SHW - Validate Active membership slate content
    When user sees Active membership slate
    Then user sees Active section
    Then user sees Subscribe to Active membership link
    Then user sees Active Plus section
    Then user sees Subscribe to Active Plus membership link
    Then user closes the Active membership slate slate

  @regression @testing @active-local
  Scenario: Active - local to SHW - Navigation to confirm payment screen
    When user taps on buy tickets on gym event screen
    Then user sees confirm payment screen
    And user sees Get it free link


  @regression @testing @active-local
  Scenario: Active - local to SHW - User taps on Get it free and naviagate to Active membership slate
    Given user taps on Get it free button
    When user sees Active membership slate
    Then user sees Active section
    Then user sees Subscribe to Active membership link
    Then user sees Active Plus section
    Then user sees Subscribe to Active Plus membership link
    Then user closes the Active membership slate slate

  @regression @testing @active-local
  Scenario: Active - local to SHW - User books to the Active GYM event
    When user taps on buy tickets on confirm payment screen
    Then user sees you are on the guest list screen
    Then user taps on OK button
    Then user sees the event booking status as you are on the guest list on event details screen


  @regression @testing @active-local
  Scenario: Active - local to SHW - User cancels the Active GYM event
    When user sees the event booking status as you are on the guest list on event details screen
    Then user cancels the event booking
    Then user navigates back to the events list

  @regression @testing @active-local
  Scenario: Active - local to SHW - sign out
    When user clicks on Account button on home screen
    Then user sign-off from the account
    Then app is closed


 # ************ ACTIVE EVERY HOUSE MEMBER TO SOHO WAREHOUSE SCENARIOS ********************

  @regression @active-every
  Scenario: Login to Active - every house member to soho warehouse
#    Given user navigates to the account screen
#    And user sign-out of the app from the previous user
    Given app is launched
    When user is on sign in screen
    And user enters active-every as email address
    And user enters password
    And user clicks on go button
    And user sees T & C screen
    And user accepts T & C
    And user allows to help us
    And user accepts House rules
    And user continue without syncing
    And user continue from welcome screen
    And user continue from make it personal screen
    And user clicks on continue
    And user clicks on next
    And user clicks on OK
    And user clicks on next on all set screen
    Then greetings should be visible

  @regression @active-every
  Scenario: Active - every house member to SHW - User navigates to Member events section
    Given greetings should be visible
    When user clicks on what's on button
    Then user sees what's on screen title
    And tap on Events tab

  @regression @active-every
  Scenario: Active - every house member to SHW - Book to the PAID member event of Soho Warehouse
    Given the paid SW Events event is found
    When user sees how many tickets to buy question
    When user taps on buy tickets on event screen
    And user sees confirm payment screen
    And user taps on buy tickets on confirm payment screen
    Then user sees you are on the guest list screen
    Then user taps on OK button
    Then user sees the event booking status as you are on the guest list on event details screen

  @regression @active-every
  Scenario: Active - every house member to SHW - Cancel the PAID member event booking of Soho Warehouse
    When user sees the event booking status as you are on the guest list on event details screen
    Then user cancels the event booking
    Then user navigates back to the events list

  @regression @active-every
  Scenario: Active - every house member to SHW - User books to the 40 Greek street MEMBER event
    Given tap on Events tab
    When the paid Events event is found
    And user sees how many tickets to buy question
    And user taps on buy tickets on event screen
    And user sees confirm payment screen
    And user taps on buy tickets on confirm payment screen
    Then user sees you are on the guest list screen
    Then user taps on OK button
    Then user sees the event booking status as you are on the guest list on event details screen

  @regression @active-every
  Scenario: Active - Every member to SHW - Cancel the PAID member event booking of 40 Greek street
    When user sees the event booking status as you are on the guest list on event details screen
    Then user cancels the event booking
    Then user navigates back to the events list

  @regression @active-every
  Scenario: Active - Every house member to SHW - User books to the 40 Greek street GYM event
    Given user sees the Gym classes tab
    And tap on Gym classes tab
    And the paid Gym classes event is found
    And user taps on buy tickets on gym event screen
    And user sees confirm payment screen
    And user taps on buy tickets on confirm payment screen
    Then user sees you are on the guest list screen
    Then user taps on OK button
    Then user sees the event booking status as you are on the guest list on event details screen

  @regression @active-every
  Scenario: Active - Every house member to SHW - Cancel the 40 Greek street GYM event booking
    When user sees the event booking status as you are on the guest list on event details screen
    Then user cancels the event booking
    Then user navigates back to the events list

  @regression @active-every
  Scenario: Active - Every house member to SHW - validate the status on event details screen
    Given user sees the Gym classes tab
    And tap on Gym classes tab
    When the paid SW Gym event is found
    Then user sees the soho warehouse Active location
    Then user sees the Book & Pay button

  @regression @active-every
  Scenario: Active - Every house member to SHW - Navigation to confirm payment screen
    When user taps on buy tickets on gym event screen
    Then user sees confirm payment screen
    And user sees Get it free link

  @regression @active-every
  Scenario: Active - Every house member to SHW - User taps on Get it free and naviagate to Active membership slate
    Given user taps on Get it free button
    When user sees Active membership slate
    Then user sees Active section
    Then user sees Subscribe to Active membership link
    Then user sees Active Plus section
    Then user sees Subscribe to Active Plus membership link
    Then user closes the Active membership slate slate

  @regression @active-every
  Scenario: Active - Every house member to SHW - User books to the Active event
    When user taps on buy tickets on confirm payment screen
    Then user sees you are on the guest list screen
    Then user taps on OK button
    Then user sees the event booking status as you are on the guest list on event details screen

  @regression @active-every
  Scenario: Active - Every house member to SHW - User cancels the Active GYM event
    When user sees the event booking status as you are on the guest list on event details screen
    Then user cancels the event booking
    Then user navigates back to the events list

  @regression @active-every
  Scenario: Active - every house member - sign out
    When user clicks on Account button on home screen
    Then user sign-off from the account
    Then app is closed


     # ************ ACTIVE-PLUS LOCAL HOUSE MEMBER TO SOHO WAREHOUSE SCENARIOS ********************

  @regression @active-plus-local
  Scenario: Login to Active plus - local member to soho warehouse
#    Given user navigates to the account screen
#    And user sign-out of the app from the previous user
    Given app is launched
    When user is on sign in screen
    And user enters active-plus-local as email address
    And user enters password
    And user clicks on go button
    And user sees T & C screen
    And user accepts T & C
    And user allows to help us
    And user accepts House rules
    And user continue without syncing
    And user continue from welcome screen
    And user continue from make it personal screen
    And user clicks on continue
    And user clicks on next
    And user clicks on OK
    And user clicks on next on all set screen
    Then greetings should be visible

  @regression @active-plus-local
  Scenario: Active plus - local member to SHW - User navigates to Member events section
    Given greetings should be visible
    When user clicks on what's on button
    Then user sees what's on screen title
    And tap on Events tab

  @regression @active-plus-local
  Scenario: Active plus - local house member to SHW - Book to the PAID MEMBER event of Soho Warehouse
    Given the paid SW Events event is found
    When user sees how many tickets to buy question
    When user taps on buy tickets on event screen
    And user sees confirm payment screen
    And user taps on buy tickets on confirm payment screen
    Then user sees you are on the guest list screen
    Then user taps on OK button
    Then user sees the event booking status as you are on the guest list on event details screen

  @regression @active-plus-local
  Scenario: Active plus - local member to SHW - Cancel the PAID member event booking of Soho Warehouse
    When user sees the event booking status as you are on the guest list on event details screen
    Then user cancels the event booking
    Then user navigates back to the events list

  @regression @active-plus-local
  Scenario: Active plus - local to SHW - PAID Soho Warehouse GYM event - validate the status on event details screen
    When user sees the Gym classes tab
    Then tap on Gym classes tab
    When the paid SW Gym event is found
    Then user sees the soho warehouse Active location

  @regression @active-plus-local
  Scenario: Active plus - local to SHW - Book to the GYM Active Soho Warehouse event
    When user taps on book gym tickets on event screen
    Then user sees you are on the guest list screen
    Then user taps on OK button
    Then user sees the event booking status as you are on the guest list on event details screen

  @regression @active-plus-local
  Scenario: Active plus - local to SHW - User cancels the Active GYM event
    When user sees the event booking status as you are on the guest list on event details screen
    Then user cancels the event booking
    Then user navigates back to the events list

  @regression @active-plus-local
  Scenario: Active plus - local to SHW - sign out
    When user clicks on Account button on home screen
    Then user sign-off from the account
    Then app is closed



 # ************ ACTIVE-PLUS EVERY HOUSE MEMBER TO SOHO WAREHOUSE SCENARIOS ********************

  @regression @active-plus-every
  Scenario: Login to Active plus - every house member to soho warehouse
#    Given user navigates to the account screen
#    And user sign-out of the app from the previous user
    Given app is launched
    When user is on sign in screen
    And user enters active-plus-every as email address
    And user enters password
    And user clicks on go button
    And user sees T & C screen
    And user accepts T & C
    And user allows to help us
    And user accepts House rules
    And user continue without syncing
    And user continue from welcome screen
    And user continue from make it personal screen
    And user clicks on continue
    And user clicks on next
    And user clicks on OK
    And user clicks on next on all set screen
    Then greetings should be visible

  @regression @active-plus-every
  Scenario: Active plus - every house member to SHW - User navigates to Member events section
    Given greetings should be visible
    When user clicks on what's on button
    Then user sees what's on screen title
    And tap on Events tab

  @regression @active-plus-every
  Scenario: Active plus - every house member to SHW - Book to the PAID member event of Soho Warehouse
    Given the paid SW Events event is found
    When user sees how many tickets to buy question
    When user taps on buy tickets on event screen
    And user sees confirm payment screen
    And user taps on buy tickets on confirm payment screen
    Then user sees you are on the guest list screen
    Then user taps on OK button
    Then user sees the event booking status as you are on the guest list on event details screen

  @regression @active-plus-every
  Scenario: Active plus - every house member to SHW - Cancel the PAID member event booking of Soho Warehouse
    When user sees the event booking status as you are on the guest list on event details screen
    Then user cancels the event booking
    Then user navigates back to the events list

  @regression @active-plus-every
  Scenario: Active plus - every house member to SHW - User books to the 40 Greek street MEMBER event
    And the paid Events event is found
    And user sees how many tickets to buy question
    And user taps on buy tickets on event screen
    And user sees confirm payment screen
    And user taps on buy tickets on confirm payment screen
    Then user sees you are on the guest list screen
    Then user taps on OK button
    Then user sees the event booking status as you are on the guest list on event details screen

  @regression @active-plus-every
  Scenario: Active plus - Every member to SHW - Cancel the PAID member event booking of 40 Greek street
    When user sees the event booking status as you are on the guest list on event details screen
    Then user cancels the event booking
    Then user navigates back to the events list

  @regression @active-plus-every
  Scenario: Active plus - Every house member to SHW - User books to the 40 Greek street GYM event
    Given user sees the Gym classes tab
    And tap on Gym classes tab
    When the paid Gym classes event is found
    Then user taps on book gym tickets on event screen
    Then user sees you are on the guest list screen
    Then user taps on OK button
    Then user sees the event booking status as you are on the guest list on event details screen

  @regression @active-plus-every
  Scenario: Active plus - Every house member to SHW - Cancel the 40 Greek street GYM event booking
    When user sees the event booking status as you are on the guest list on event details screen
    Then user cancels the event booking
    Then user navigates back to the events list

  @regression @active-plus-every
  Scenario: Active plus - Every house member to SHW - validate the status on event details screen
    Given user sees the Gym classes tab
    And tap on Gym classes tab
    When the paid SW Gym event is found
    Then user sees the soho warehouse Active location

  @regression @active-plus-every
  Scenario: Active plus - Every house member to SHW - Navigation to confirm payment screen
    When user taps on book gym tickets on event screen
    Then user sees you are on the guest list screen
    Then user taps on OK button
    Then user sees the event booking status as you are on the guest list on event details screen


  @regression @active-plus-every
  Scenario: Active plus - Everyhouse member to SHW - User cancels the Active GYM event
    When user sees the event booking status as you are on the guest list on event details screen
    Then user cancels the event booking
    Then user navigates back to the events list

  @regression @active-plus-every
  Scenario: Active plus - Everyhouse member to SHW - sign out
    When user clicks on Account button on home screen
    Then user sign-off from the account
    Then app is closed