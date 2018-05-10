Feature: Accounts feature

  Background: User is logged in the application
    Given Open the Firefox and launch the application
    When Enter the Username and Password
    Then login to the application

  Scenario: Create a new account with only obligatory fields filled
    Given Go to accounts section
    When I press new account button
    Then new account form is displayed
    Then I fill the account name field
    And press the save button
    Then a new account is created

  Scenario: Modify an existing account
    Given Go to accounts section
    When I choose all accounts
    And click on Go
    Then A list of accounts is displayed
    And I click on edit link
    Then All data is displayed to edit
    And I change its name
    And I press the save button
    Then the account is modified

