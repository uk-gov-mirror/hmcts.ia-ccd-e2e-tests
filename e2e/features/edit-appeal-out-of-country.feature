Feature: Out of Country - Edit appeal

  Background:
    Given I am signed in as a `Legal Rep`
    And I create a new case

  @edit-appeal-out-of-country @RIA-3878
  Scenario: Edit In country appeal to Out of country

    And I save my initial appeal with appellant living in UK `Yes`

    When I click the `Overview` tab
    Then I should see `No` for the `Out of country` field
    And I should see `001234567` for the `Home Office Reference/Case ID` field

    When I click the `Appeal` tab
    Then I should see `No` for the `Out of country` field
    And I should see `Yes` for the `Has a deportation order been made against the appellant?` field
    And I should see `{$TODAY-10|DD MMM YYYY}` for the `Home Office decision letter sent` field

    When I click the `Appellant` tab
    Then I should see `No` for the `Does the appellant have a fixed address?` field
    And I should see `Text message` for the `Communication Preference` field
    And I should see `07977111111` for the `Mobile phone number` field

    When I select the `Edit appeal` Next step
    And I edit the appeal with appellant living in UK `No`

    And I click the `Overview` tab
    And I should see `Yes` for the `Out of country` field
    And I should see `GWF1234567` for the `Global Web form` field
    And I should see `{$TODAY|D MMM YYYY}` for the `Date of entry clearance decision` field

    When I click the `Appeal` tab
    Then I should see `A decision to refuse a human rights claim for entry clearance` for the `Out of country decision` field
    And I should see `Yes` for the `Out of country` field

    When I click the `Appellant` tab
    Then I should see `Afghanistan` for the `Address` field
    And I should see `Smith Benett` for the `Sponsor name` field
    And I should see the text `First Tier Tribunal Immigration & Asylum Chamber, Taylor House`
    And I should see the text `88 Rosebery Avenue`
    And I should see the text `London`
    And I should see the text `EC1R 4QU`
    And I should see the text `United Kingdom`
    And I should see `07123456789` for the `Sponsor phone number` field
    And I should see `Yes` for the `Does your client give authorisation for the sponsor to access information relating to the appeal?` field

  @edit-appeal-out-of-country @RIA-3878
  Scenario: Edit Out of country appeal to In country
    And I save my out of country appeal with sponsor given name `Smith` family name `Benett` contactPreference `wantsSms` authorisation `Yes`

    And I click the `Overview` tab
    And I should see `Yes` for the `Out of country` field
    And I should see `GWF1234567` for the `Global Web form` field
    And I should see `{$TODAY|D MMM YYYY}` for the `Date of entry clearance decision` field

    When I click the `Appeal` tab
    Then I should see `A decision to refuse a human rights claim for entry clearance` for the `Out of country decision` field
    And I should see `Yes` for the `Out of country` field

    When I click the `Appellant` tab
    Then I should see `Afghanistan` for the `Address` field
    And I should see `Smith Benett` for the `Sponsor name` field
    And I should see the text `First Tier Tribunal Immigration & Asylum Chamber, Taylor House`
    And I should see the text `88 Rosebery Avenue`
    And I should see the text `London`
    And I should see the text `EC1R 4QU`
    And I should see the text `United Kingdom`
    And I should see `07123456789` for the `Sponsor phone number` field
    And I should see `Yes` for the `Does your client give authorisation for the sponsor to access information relating to the appeal?` field

    When I select the `Edit appeal` Next step
    And I edit the appeal with appellant living in UK `Yes`

    When I click the `Overview` tab
    Then I should see `No` for the `Out of country` field
    And I should see `001234567` for the `Home Office Reference/Case ID` field

    When I click the `Appeal` tab
    Then I should see `No` for the `Out of country` field
    And I should see `Yes` for the `Has a deportation order been made against the appellant?` field
    And I should see `{$TODAY-10|DD MMM YYYY}` for the `Home Office decision letter sent` field

    When I click the `Appellant` tab
    Then I should see `No` for the `Does the appellant have a fixed address?` field
    And I should see `Text message` for the `Communication Preference` field
    And I should see `07977111111` for the `Mobile phone number` field

