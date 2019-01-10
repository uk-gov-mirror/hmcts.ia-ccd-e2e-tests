Feature: Home Office reference number is validated

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I complete the `Tell us about your client` page

  @start-appeal @alternate @RIA-597 @migrate-to-unit-tests
  Scenario Outline: Invalid home office reference is not allowed

    Given I am on the `Home Office reference` page
    When I type <invalidReference> for the `Home Office reference number` field
    And I type `31-10-2018` for the `Date on the decision letter` field
    And I click the `Continue` button
    Then I should see an error saying `The data entered is not valid for this type of field, please delete and re-enter using only valid data`
    And the `Continue` button is disabled

    Examples:
      | invalidReference |
      | A                |
      | 123              |
      | A123             |
      | A123456001       |
      | A123456/         |
      | 123456/001       |
      | A123456/1234     |
      | A12345678/1234   |

  @start-appeal @alternate @RIA-597 @migrate-to-unit-tests
  Scenario Outline: Valid home office reference is allowed

    Given I am on the `Home Office reference` page
    When I type <validReference> for the `Home Office reference number` field
    And I type `31-10-2018` for the `Date on the decision letter` field
    And I click the `Continue` button
    Then I am on the `Basic details` page

    Examples:
      | validReference |
      | A123456        |
      | X123456        |
      | A123456/001    |
      | X123456/1      |
      | X123456/12     |
      | X123456/123    |
      | X1234567/1     |
      | X1234567/12    |
      | X1234567/123   |
