Feature: Modify and delete a previous created opportunity.

  Background: User is logged, create an account, campaign and opportunity.
    Given I login as a User
    And Home Page should be displayed
    And I go to "ACCOUNT" Section
    And I click on New button
    And I fill the fields of Account and press the save button
      | ACCOUNT_NAME | AccountOpp2 |
    And I go to "ACCOUNT" Section
    Then I verify if "AccountOpp2" "ACCOUNT" was created/modified on Detail Page
    And I go to "CAMPAIGN" Section
    And I click on New button
    And I create or modify a campaign fill the fields and press the save button
      | CAMPAIGN_NAME   | CampaignOpp2 |
      | CAMPAIGN_ACTIVE | true         |
    And I go to "CAMPAIGN" Section
    Then I verify if "CampaignOpp2" "CAMPAIGN" was created/modified on Detail Page
    And I go to "OPPORTUNITY" Section
    And I click on New button
    And I fill the fields of Opportunity and press the save button
      | OPPORTUNITY_NAME                    | Opportunity  |
      | OPPORTUNITY_ACCOUNT_NAME            | AccountOpp2  |
      | OPPORTUNITY_CLOSE_DATE              | 20/08/2018   |
      | OPPORTUNITY_STAGE                   | Closed Lost  |
      | OPPORTUNITY_PRIMARY_CAMPAIGN_SOURCE | CampaignOpp2 |
    And I go to "OPPORTUNITY" Section
    Then I verify if "Opportunity" "OPPORTUNITY" was created/modified on Detail Page

  @deleteAccount @deleteCampaign @deleteOpportunity
  Scenario: Edit opportunity previously created
    Given I go to "OPPORTUNITY" Section
    And I edit "Opportunity" at list on Main Page
    And I fill the fields of Opportunity and press the save button
      | OPPORTUNITY_PRIVATE                      | false          |
      | OPPORTUNITY_NAME                         | OpportunityMod |
      | OPPORTUNITY_TYPE                         | New Customer   |
      | OPPORTUNITY_LEAD_SOURCE                  | Other          |
      | OPPORTUNITY_AMOUNT                       | 5000           |
      | OPPORTUNITY_CLOSE_DATE                   | 17/06/2018     |
      | OPPORTUNITY_NEXT_STEP                    | 31/08/2018     |
      | OPPORTUNITY_STAGE                        | Qualification  |
      | OPPORTUNITY_PROBABILITY                  | 50             |
      | OPPORTUNITY_ORDER_NUMBER                 | 2020           |
      | OPPORTUNITY_CURRENT_GENERATOR            | Current2       |
      | OPPORTUNITY_TRACKING                     | 213213         |
      | OPPORTUNITY_MAIN_COMPETITORS             | Competitor2    |
      | OPPORTUNITY_DELIVERY_INSTALLATION_STATUS | In progress    |
      | OPPORTUNITY_DESCRIPTION                  | Don't modify   |
    And I go to "OPPORTUNITY" Section
    Then I verify if "OpportunityMod" "OPPORTUNITY" was created/modified on Detail Page

  @deleteAccount @deleteCampaign
  Scenario: Delete account
    When I go to "OPPORTUNITY" Section
    And  I delete "Opportunity" at list on Main Page
    Then I verify that "Opportunity" "OPPORTUNITY" was deleted
