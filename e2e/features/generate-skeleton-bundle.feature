Feature: Generate skeleton bundle


  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case
    And I save my initial appeal
    And I submit my appeal
    And I switch to be a `Case Officer`
    And I request respondent evidence
    And I upload respondent evidence
    And I switch to be a `Legal Rep`
    And I build my case

  @generate-skeleton-bundle @RIA-481
  Scenario: Generate skeleton bundle
    When I select the `Submit your case` Next step
    And I am on the `Submit your case` page
    And I click the `Submit` button
    And I click the `Close and Return to case details` button
    And I click the `Documents` tab
    Then I should see the `Documents` page
    And within the `Legal representative documents` collection's first item, I should see `-González-appeal-skeleton-argument.PDF` in the `Document` field
    And within the `Legal representative documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

  @generate-skeleton-bundle-request-case
  Scenario: Generate skeleton bundle after request case edit
    When I submit my case
    And I switch to be a `Case Officer`
    And I click the `Overview` tab
    And I select the `Request case edit` Next step
    And I type `Your case argument needs to be changed. Please make changes and resubmit.` for the `Explain the direction you are issuing` field
    And I type `{$TODAY+14}` for the `By what date must they comply?` field
    And I click the `Continue` button
    And I click the `Send direction` button
    And I click the `Close and Return to case details` button

    # second building and submitting case should replace already generated bundle and put new version in the first place in "Legal representative documents"
    When I switch to be a `Legal Rep`
    And I build my case
    And I submit my case
    And I click the `Close and Return to case details` button
    And I click the `Documents` tab

    Then I should see the `Documents` page
    And within the `Legal representative documents` collection's first item, I should see `-González-appeal-skeleton-argument.PDF` in the `Document` field
    And within the `Legal representative documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field