Feature: dashboard
  In order to coordinate and make visible the flows of working together
  As a player
  I want to be able coordinate all my action from one place

  Background:
    Given a "MutualCredit" currency "X"
    Given "joe" is a "member" of currency "X"
    Given a "MutualCredit" currency "Y"
    Given "joe" is a "member" of currency "Y"
    Given a "MutualCredit" currency "Z"
    Given I am logged into my account
    And a circle "the circle" with members "joe,jane,jacob"
    Given I go to the logout page

  Scenario: User looks at their dashboard and sees the currencies in their circle
    When I log in as "joe"
    Then I should be taken to the dashboard page
    And I should see "Dashboard" as the current tab
    And I should see an "X" dashboard item
    And I should see a "Y" dashboard item
    And I should not see a "Z" dashboard item

  Scenario: Users makes a play in a currency
    Given "Joe" is a "member" of currency "X"
    When I go to the my currencies page
    And I follow "X"
    Then I should be taken to the currency account play page for "Anonymous User's X member account"
    And I should see "X: Pay"
    And I should see "Balance: 0"
    When I select "Joe User's X member account" from "play_to"
    And I fill in "play_amount" with "20"
    And I fill in "play[memo]" with "leg waxing"
    And I press "Record Play"
    Then I should be taken to the my currencies page
    And I should see "-20"
    When I follow "history"
    Then I should be taken to the currency account history page for "Anonymous User's X member account"
    And I should see "leg waxing"
    
#  Scenario: User looks at a currency account
#    When I go to the currency accounts page
#    And I follow "X"
#    Then I should see "X" as the title of the page
#    And I should see "Currency Summary"
