Feature: Generate hearing bundle


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
    And I submit my case
    And I upload additional evidence
    And I switch to be a `Case Officer`
    And I request respondent review
    And I add the appeal response
    And I request hearing requirements
    And I switch to be a `Legal Rep`
    And I submit hearing requirements with all yes
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path
    And I switch to be a `Admin Officer`
    And I list the case
    And I switch to be a `Case Officer`
    And I create case summary

  @regression @generate-hearing-bundle @RIA-941 @RIA-1846
  Scenario: Generate hearing bundle
    When I click the `Documents` tab


    When I select the `Generate hearing bundle` Next step
    Then I should see the `Generate hearing bundle` page
    And I should see the `Generate` button

    When I click the `Generate` button
    Then I should see the text `You have generated the hearing bundle`
    Then I should see the text `What happens next`
    Then I should see the text `You can view the hearing bundle in the documents tab. All parties have been notified that the hearing bundle is now available.`

    When I click the `Close and Return to case details` button
    And I click the `Documents` tab

    And within the `Hearing documents` collection's first item, I should see `-González-hearing-bundle.PDF` in the `Document` field
    And within the `Hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field
