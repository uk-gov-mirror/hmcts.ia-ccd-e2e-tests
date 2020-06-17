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
    And I request appellant review
    And I request hearing requirements
    And I switch to be a `Legal Rep`
    And I submit hearing requirements with all yes
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path
    And I switch to be a `Admin Officer`
    And I list the case
    And I switch to be a `Case Officer`
    And I create case summary

  @regression @generate-hearing-bundle @RIA-941 @RIA-1846 @RIA-3116
  Scenario: Generate hearing bundle
    When I click the `Documents` tab
    Then I should see the `Documents` page

    When I select the `Generate hearing bundle` Next step
    Then I should see the `Generate hearing bundle` page
    And I should see the `Generate` button

    When I click the `Generate` button
    Then I should see the text `The hearing bundle is being generated`
    Then I should see the text `What happens next`
    Then I should see the text `You will soon be able to view the hearing bundle in the documents tab.`
    Then I should see the text `You and the other parties will be notified when the hearing bundle is available.`
    Then I should see the text `If the bundle fails to generate, you will be notified and will need to generate the bundle again.`

    When I click the `Close and Return to case details` button
    Then I should see the `Overview` page
    Then I should see the text `The hearing bundle is being generated. You will soon be able to view the hearing bundle in the documents tab.`
    Then I should see the text `You and the other parties will be notified when the hearing bundle is available.`
    Then I should see the text `If the bundle fails to generate, you will be notified and need to generate the bundle again.`

    And I wait for 10 seconds
    And I switch to be a `Legal Rep`

    When I switch to be a `Case Officer`
    And I click the `Documents` tab
    Then I should see the `Documents` page
    And within the `Hearing documents` collection's first item, I should see `-González-hearing-bundle.pdf` in the `Document` field
    And within the `Hearing documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

