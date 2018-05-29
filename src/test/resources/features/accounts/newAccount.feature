Feature: Create a new account

  Background: User is logged in the application
    Given I login as a User
    Then Home Page should be displayed

  Scenario: Create a new account with only obligatory fields filled
    Given I can go to "ACCOUNT" Section
    And I can click on New button
    And I can fill the fields of Account and press the save button
      | ACCOUNT_NAME | Account with only obligatory fields filled |
    Then I can go to "ACCOUNT" Section
    And I can verify if "Account with only obligatory fields filled" "ACCOUNT" was created/modified on Detail Page

  Scenario: Create a new account with all fields filled
    Given I can go to "ACCOUNT" Section
    And I can click on New button
    And I can fill the fields of Account and press the save button
      | ACCOUNT_NAME   | Account with all fields filled |
      | ACCOUNT_NUMBER | 100                            |
      | ACCOUNT_SITE   | 2                              |
      | PARENT_ACCOUNT | Edge Communications            |
      | TYPE           | Prospect                       |
      | INDUSTRY       | Agriculture                    |
      | ANNUAL_REVENUE | 200                            |
      | RATING         | Hot                            |
      | PHONE          | 591591591                      |
      | FAX            | 591591222                      |
      | WEBSITE        | www.website.com                |
      | TICKER_SYMBOL  | ACC                            |
      | OWNERSHIP      | Private                        |
      | EMPLOYEES      | 10                             |
      | SIC_CODE       | 200200200                      |

    Then I can go to "ACCOUNT" Section
    And I can verify if "Account with all fields filled" "ACCOUNT" was created/modified on Detail Page