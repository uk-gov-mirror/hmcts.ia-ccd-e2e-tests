Feature: Add addendum evidence by Home Office


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
    And I switch to be a `Case Officer`
    And I request respondent review
    And I add the appeal response
    And I request hearing requirements
    And I switch to be a `Admin Officer`
    And I list the case
    And I switch to be a `Case Officer`
    And I create case summary
    And I generate the hearing bundle
    And I wait for 10 seconds
    And I reload the Case Overview Page
    And I start decision and reasons

  @add-addendum-evidence-ho @RIA-1935
  Scenario Outline: Add addendum evidence by Home Office

    When I switch to be a <user>
    And I click the `Documents` tab

    Then I should see the `Documents` page
    And I should see the `Add additional evidence as an addendum` link

    When I click the `Add additional evidence as an addendum` link

    Then I should see the `Upload additional evidence` page
    And I should see the text `Add the evidence and the context. This evidence will not be included in the hearing bundle, it will be added as an addendum.`
    And I should see the text `You’ll need to explain why this evidence is being submitted after the hearing bundle has been produced.`

    When I add an item to the `Evidence` collection
    And within the `Evidence` collection's first item, I upload `{@Evidence1.pdf}` for the `Document` field
    And within the `Evidence` collection's first item, I type `some description` for the `Why it was late` field

    And I click the `Continue` button

    Then I should see the `Upload additional evidence` page
    And I should see the text `Check your answers`
    And I should see the text `Check the information below carefully.`
    And I should see the `Evidence1.pdf` link

    When I click the `Upload` button
    Then I should see the text `The evidence is now available in the documents tab. This is not included in the hearing bundle, it is added as an addendum.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Upload additional evidence`

    When I click the `Documents` tab

    Then I should see the `Documents` page
    And within the `Evidence supplied after the hearing bundle` collection's first item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Evidence supplied after the hearing bundle` collection's first item, I should see `The respondent` for the `Supplied by` field
    And within the `Evidence supplied after the hearing bundle` collection's first item, I should see `some description` for the `Description` field
    And within the `Evidence supplied after the hearing bundle` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    # Legal Rep
    When I switch to be a `Legal Rep`
    And I click the `Documents` tab

    Then I should see the `Documents` page
    And within the `Evidence supplied after the hearing bundle` collection's first item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Evidence supplied after the hearing bundle` collection's first item, I should see `The respondent` for the `Supplied by` field
    And within the `Evidence supplied after the hearing bundle` collection's first item, I should see `some description` for the `Description` field
    And within the `Evidence supplied after the hearing bundle` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    # Case Officer
    When I switch to be a `Case Officer`
    And I click the `Documents` tab

    Then I should see the `Documents` page
    And within the `Evidence supplied after the hearing bundle` collection's first item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Evidence supplied after the hearing bundle` collection's first item, I should see `The respondent` for the `Supplied by` field
    And within the `Evidence supplied after the hearing bundle` collection's first item, I should see `some description` for the `Description` field
    And within the `Evidence supplied after the hearing bundle` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    # Admin
    When I switch to be a `Admin Officer`
    And I click the `Documents` tab

    Then I should see the `Documents` page
    And within the `Evidence supplied after the hearing bundle` collection's first item, I should see `Evidence1.pdf` in the `Document` field
    And within the `Evidence supplied after the hearing bundle` collection's first item, I should see `The respondent` for the `Supplied by` field
    And within the `Evidence supplied after the hearing bundle` collection's first item, I should see `some description` for the `Description` field
    And within the `Evidence supplied after the hearing bundle` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field


    Examples:
      | user                |
      | Home Office APC     |
      | Home Office LART    |
      | Home Office POU     |
      | Home Office Generic |
