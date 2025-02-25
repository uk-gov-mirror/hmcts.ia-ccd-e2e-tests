Feature: Relist an adjourned hearing without a date case

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
    And I switch to be a `Legal Rep`
    And I submit hearing requirements with all yes
    And I switch to be a `Case Officer`
    And I record agreed hearing requirements yes path
    And I switch to be a `Admin Officer`
    And I list the case

  @RIA-2960
  Scenario: Admin Officer restores state and relists the case after adjourned
    When I select the `Adjourn hearing without a date` Next step
    Then I am on the `Adjourn hearing without a date` page
    And I should see the text `Reasons for adjournment`
    And I should see the text `This will be visible to both parties`
    And the `Continue` button is disabled

    When I type `some reasons for adjournment` for the `Reasons for adjournment` field
    And I click the `Continue` button
    Then I should see the text `Check your answers`
    And I should see the text `Reasons for adjournment`
    And I should see the text `some reasons for adjournment`

    When I click the `Adjourn` button
    Then I should see the text `The hearing has been adjourned`
    And I should see the text `A new Notice of Hearing has been generated.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Adjourn hearing without a date`
    And I should only see the `caseOfficer_hearing_adjourned` case progress image
    And I should see the text `Do this next`
    And I should see the text `The hearing has been adjourned and there is no scheduled date for the hearing. You can view the reasons for this in the hearing tab.`
    And I should see the text `When the hearing is ready to be relisted, you must first restore the appeal to its previous state.`
    And I should see `Adjourned` for the `Appointment date and time` field

    When I click the `hearing tab` link
    Then I should see the `Hearing` page
    And I should see `Adjourned` for the `Appointment date and time` field
    And I should see `some reasons for adjournment` for the `Reasons for adjournment` field

    When I click the `Overview` tab
    Then I click the `restore the appeal to its previous state.` link
    And I should see the `Restore to previous state` page

    When I click the `Restore appeal` button
    And I should see the text `This case is ready to be relisted. Review the hearing requirements in the hearing tab and then relist the hearing in Aria.`
    And I should see the text `You should then relist the case on this service.`

    When I click the `relist the case on this service.` link
    Then I should see the `Edit case listing` page

    And I should see the option `Manchester` for the `Hearing centre` field
    And I should see the option `Taylor House` for the `Hearing centre` field
    And I should see the option `Newport` for the `Hearing centre` field
    And I should see the option `Bradford` for the `Hearing centre` field
    And I should see the option `North Shields` for the `Hearing centre` field
    And I should see the option `Birmingham` for the `Hearing centre` field
    And I should see the option `Hatton Cross` for the `Hearing centre` field
    And I should see the option `Glasgow (Eagle Building)` for the `Hearing centre` field
    And I should see the option `Glasgow Tribunals Centre` for the `Hearing centre` field
    And I should see the option `Coventry Magistrates Court` for the `Hearing centre` field
    And I should see the option `Newcastle Civil & Family Courts and Tribunals Centre` for the `Hearing centre` field
    And I should see the option `Nottingham Justice Centre` for the `Hearing centre` field
    And I should see the option `30 minutes` for the `Length` field
    And I should see the option `1 hour` for the `Length` field
    And I should see the option `1 hour 30 minutes` for the `Length` field
    And I should see the option `2 hours` for the `Length` field
    And I should see the option `2 hours 30 minutes` for the `Length` field
    And I should see the option `3 hours` for the `Length` field
    And I should see the option `3 hours 30 minutes` for the `Length` field
    And I should see the option `4 hours` for the `Length` field
    And I should see the option `4 hours 30 minutes` for the `Length` field
    And I should see the option `5 hours` for the `Length` field
    And I should see the option `5 hours 30 minutes` for the `Length` field
    And I should see the option `6 hours` for the `Length` field

    When I select `3 hours` for the `Length` field
    And I select `Manchester` for the `Hearing centre` field
    And I select `{$TODAY+14|DD-MM-YYYY} 11:30:00` for the `Date and time` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Manchester` for the `Hearing centre` field
    And I should see `3 hours` for the `Length` field
    And I should see `{$TODAY+14|D MMM YYYY}, 11:30:00 AM` for the `Date and time` field

    When I click the `List case` button
    Then I should see the text `The case has been re-listed`
    And I should see the text `What happens next`
    And I should see the text `A new Notice of Hearing has been generated. All parties will be notified by email.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Edit case listing`

    When I click the `Overview` tab
    And I should see the `Hearing details` field
    And I should see `Manchester` for the `Hearing centre` field
    And I should see `3 hours` for the `Length` field
    And I should see the text `11:30:00 AM`

  @RIA-2960
  Scenario: Case Officer restores state and relists the case after adjourned
    And I switch to be a `Case Officer`
    When I select the `Adjourn hearing without a date` Next step
    Then I am on the `Adjourn hearing without a date` page
    And I should see the text `Reasons for adjournment`
    And I should see the text `This will be visible to both parties`
    And the `Continue` button is disabled

    When I type `some reasons for adjournment` for the `Reasons for adjournment` field
    And I click the `Continue` button
    Then I should see the text `Check your answers`
    And I should see the text `Reasons for adjournment`
    And I should see the text `some reasons for adjournment`

    When I click the `Adjourn` button
    Then I should see the text `The hearing has been adjourned`
    And I should see the text `A new Notice of Hearing has been generated.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Adjourn hearing without a date`
    And I should only see the `caseOfficer_hearing_adjourned` case progress image
    And I should see the text `Do this next`
    And I should see the text `The hearing has been adjourned and there is no scheduled date for the hearing. You can view the reasons for this in the hearing tab.`     
    And I should see the text `When the hearing is ready to be relisted, you must first restore the appeal to its previous state.`
    And I should see `Adjourned` for the `Appointment date and time` field

    When I click the `hearing tab` link
    Then I should see the `Hearing` page
    And I should see `Adjourned` for the `Appointment date and time` field
    And I should see `some reasons for adjournment` for the `Reasons for adjournment` field

    When I click the `Overview` tab
    Then I click the `restore the appeal to its previous state.` link
    And I should see the `Restore to previous state` page

    When I click the `Restore appeal` button
    And I should see the text `This case is ready to be relisted. Review the hearing requirements in the hearing tab and then relist the hearing in Aria.`
    And I should see the text `You should then relist the case on this service.`

    When I click the `relist the case on this service.` link
    Then I should see the `Edit case listing` page

    And I should see the option `Manchester` for the `Hearing centre` field
    And I should see the option `Taylor House` for the `Hearing centre` field
    And I should see the option `Newport` for the `Hearing centre` field
    And I should see the option `Bradford` for the `Hearing centre` field
    And I should see the option `North Shields` for the `Hearing centre` field
    And I should see the option `Birmingham` for the `Hearing centre` field
    And I should see the option `Hatton Cross` for the `Hearing centre` field
    And I should see the option `Glasgow (Eagle Building)` for the `Hearing centre` field
    And I should see the option `Glasgow Tribunals Centre` for the `Hearing centre` field
    And I should see the option `Coventry Magistrates Court` for the `Hearing centre` field
    And I should see the option `Newcastle Civil & Family Courts and Tribunals Centre` for the `Hearing centre` field
    And I should see the option `Nottingham Justice Centre` for the `Hearing centre` field
    And I should see the option `30 minutes` for the `Length` field
    And I should see the option `1 hour` for the `Length` field
    And I should see the option `1 hour 30 minutes` for the `Length` field
    And I should see the option `2 hours` for the `Length` field
    And I should see the option `2 hours 30 minutes` for the `Length` field
    And I should see the option `3 hours` for the `Length` field
    And I should see the option `3 hours 30 minutes` for the `Length` field
    And I should see the option `4 hours` for the `Length` field
    And I should see the option `4 hours 30 minutes` for the `Length` field
    And I should see the option `5 hours` for the `Length` field
    And I should see the option `5 hours 30 minutes` for the `Length` field
    And I should see the option `6 hours` for the `Length` field

    When I select `3 hours` for the `Length` field
    And I select `Manchester` for the `Hearing centre` field
    And I select `{$TODAY+14|DD-MM-YYYY} 11:30:00` for the `Date and time` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Manchester` for the `Hearing centre` field
    And I should see `3 hours` for the `Length` field
    And I should see `{$TODAY+14|D MMM YYYY}, 11:30:00 AM` for the `Date and time` field

    When I click the `List case` button
    Then I should see the text `The case has been re-listed`
    And I should see the text `What happens next`
    And I should see the text `A new Notice of Hearing has been generated. All parties will be notified by email.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Edit case listing`

    When I click the `Overview` tab
    And I should see the `Hearing details` field
    And I should see `Manchester` for the `Hearing centre` field
    And I should see `3 hours` for the `Length` field
    And I should see the text `11:30:00 AM`

  @RIA-2960
  Scenario: Case Officer restores state and Admin Officer relists the case after adjourned
    And I switch to be a `Case Officer`
    When I select the `Adjourn hearing without a date` Next step
    Then I am on the `Adjourn hearing without a date` page
    And I should see the text `Reasons for adjournment`
    And I should see the text `This will be visible to both parties`
    And the `Continue` button is disabled

    When I type `some reasons for adjournment` for the `Reasons for adjournment` field
    And I click the `Continue` button
    Then I should see the text `Check your answers`
    And I should see the text `Reasons for adjournment`
    And I should see the text `some reasons for adjournment`

    When I click the `Adjourn` button
    Then I should see the text `The hearing has been adjourned`
    And I should see the text `A new Notice of Hearing has been generated.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Adjourn hearing without a date`
    And I should only see the `caseOfficer_hearing_adjourned` case progress image
    And I should see the text `Do this next`
    And I should see the text `The hearing has been adjourned and there is no scheduled date for the hearing. You can view the reasons for this in the hearing tab.`     
    And I should see the text `When the hearing is ready to be relisted, you must first restore the appeal to its previous state.`
    And I should see `Adjourned` for the `Appointment date and time` field

    When I click the `hearing tab` link
    Then I should see the `Hearing` page
    And I should see `Adjourned` for the `Appointment date and time` field
    And I should see `some reasons for adjournment` for the `Reasons for adjournment` field

    And I switch to be a `Admin Officer`
    When I click the `Overview` tab
    Then I click the `restore the appeal to its previous state.` link
    And I should see the `Restore to previous state` page

    When I click the `Restore appeal` button
    And I should see the text `This case is ready to be relisted. Review the hearing requirements in the hearing tab and then relist the hearing in Aria.`
    And I should see the text `You should then relist the case on this service.`

    When I click the `relist the case on this service.` link
    Then I should see the `Edit case listing` page

    And I should see the option `Manchester` for the `Hearing centre` field
    And I should see the option `Taylor House` for the `Hearing centre` field
    And I should see the option `Newport` for the `Hearing centre` field
    And I should see the option `Bradford` for the `Hearing centre` field
    And I should see the option `North Shields` for the `Hearing centre` field
    And I should see the option `Birmingham` for the `Hearing centre` field
    And I should see the option `Hatton Cross` for the `Hearing centre` field
    And I should see the option `Glasgow (Eagle Building)` for the `Hearing centre` field
    And I should see the option `Glasgow Tribunals Centre` for the `Hearing centre` field
    And I should see the option `Coventry Magistrates Court` for the `Hearing centre` field
    And I should see the option `Newcastle Civil & Family Courts and Tribunals Centre` for the `Hearing centre` field
    And I should see the option `Nottingham Justice Centre` for the `Hearing centre` field
    And I should see the option `30 minutes` for the `Length` field
    And I should see the option `1 hour` for the `Length` field
    And I should see the option `1 hour 30 minutes` for the `Length` field
    And I should see the option `2 hours` for the `Length` field
    And I should see the option `2 hours 30 minutes` for the `Length` field
    And I should see the option `3 hours` for the `Length` field
    And I should see the option `3 hours 30 minutes` for the `Length` field
    And I should see the option `4 hours` for the `Length` field
    And I should see the option `4 hours 30 minutes` for the `Length` field
    And I should see the option `5 hours` for the `Length` field
    And I should see the option `5 hours 30 minutes` for the `Length` field
    And I should see the option `6 hours` for the `Length` field

    When I select `3 hours` for the `Length` field
    And I select `Manchester` for the `Hearing centre` field
    And I select `{$TODAY+14|DD-MM-YYYY} 11:30:00` for the `Date and time` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Manchester` for the `Hearing centre` field
    And I should see `3 hours` for the `Length` field
    And I should see `{$TODAY+14|D MMM YYYY}, 11:30:00 AM` for the `Date and time` field

    When I click the `List case` button
    Then I should see the text `The case has been re-listed`
    And I should see the text `What happens next`
    And I should see the text `A new Notice of Hearing has been generated. All parties will be notified by email.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Edit case listing`

    When I click the `Overview` tab
    And I should see the `Hearing details` field
    And I should see `Manchester` for the `Hearing centre` field
    And I should see `3 hours` for the `Length` field
    And I should see the text `11:30:00 AM`

  @RIA-2960
  Scenario: Admin Officer restores state and Case Officer relists the case after adjourned
    When I select the `Adjourn hearing without a date` Next step
    Then I am on the `Adjourn hearing without a date` page
    And I should see the text `Reasons for adjournment`
    And I should see the text `This will be visible to both parties`
    And the `Continue` button is disabled

    When I type `some reasons for adjournment` for the `Reasons for adjournment` field
    And I click the `Continue` button
    Then I should see the text `Check your answers`
    And I should see the text `Reasons for adjournment`
    And I should see the text `some reasons for adjournment`

    When I click the `Adjourn` button
    Then I should see the text `The hearing has been adjourned`
    And I should see the text `A new Notice of Hearing has been generated.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Adjourn hearing without a date`
    And I should only see the `caseOfficer_hearing_adjourned` case progress image
    And I should see the text `Do this next`
    And I should see the text `The hearing has been adjourned and there is no scheduled date for the hearing. You can view the reasons for this in the hearing tab.`     
    And I should see the text `When the hearing is ready to be relisted, you must first restore the appeal to its previous state.`
    And I should see `Adjourned` for the `Appointment date and time` field

    When I click the `hearing tab` link
    Then I should see the `Hearing` page
    And I should see `Adjourned` for the `Appointment date and time` field
    And I should see `some reasons for adjournment` for the `Reasons for adjournment` field

    And I switch to be a `Case Officer`
    When I click the `Overview` tab
    Then I click the `restore the appeal to its previous state.` link
    And I should see the `Restore to previous state` page

    When I click the `Restore appeal` button
    And I should see the text `This case is ready to be relisted. Review the hearing requirements in the hearing tab and then relist the hearing in Aria.`
    And I should see the text `You should then relist the case on this service.`

    When I click the `relist the case on this service.` link
    Then I should see the `Edit case listing` page

    And I should see the option `Manchester` for the `Hearing centre` field
    And I should see the option `Taylor House` for the `Hearing centre` field
    And I should see the option `Newport` for the `Hearing centre` field
    And I should see the option `Bradford` for the `Hearing centre` field
    And I should see the option `North Shields` for the `Hearing centre` field
    And I should see the option `Birmingham` for the `Hearing centre` field
    And I should see the option `Hatton Cross` for the `Hearing centre` field
    And I should see the option `Glasgow (Eagle Building)` for the `Hearing centre` field
    And I should see the option `Glasgow Tribunals Centre` for the `Hearing centre` field
    And I should see the option `Coventry Magistrates Court` for the `Hearing centre` field
    And I should see the option `Newcastle Civil & Family Courts and Tribunals Centre` for the `Hearing centre` field
    And I should see the option `Nottingham Justice Centre` for the `Hearing centre` field
    And I should see the option `30 minutes` for the `Length` field
    And I should see the option `1 hour` for the `Length` field
    And I should see the option `1 hour 30 minutes` for the `Length` field
    And I should see the option `2 hours` for the `Length` field
    And I should see the option `2 hours 30 minutes` for the `Length` field
    And I should see the option `3 hours` for the `Length` field
    And I should see the option `3 hours 30 minutes` for the `Length` field
    And I should see the option `4 hours` for the `Length` field
    And I should see the option `4 hours 30 minutes` for the `Length` field
    And I should see the option `5 hours` for the `Length` field
    And I should see the option `5 hours 30 minutes` for the `Length` field
    And I should see the option `6 hours` for the `Length` field

    When I select `3 hours` for the `Length` field
    And I select `Manchester` for the `Hearing centre` field
    And I select `{$TODAY+14|DD-MM-YYYY} 11:30:00` for the `Date and time` field
    And I click the `Continue` button

    Then I am on the `Check your answers` page
    And I should see `Manchester` for the `Hearing centre` field
    And I should see `3 hours` for the `Length` field
    And I should see `{$TODAY+14|D MMM YYYY}, 11:30:00 AM` for the `Date and time` field

    When I click the `List case` button
    Then I should see the text `The case has been re-listed`
    And I should see the text `What happens next`
    And I should see the text `A new Notice of Hearing has been generated. All parties will be notified by email.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Edit case listing`

    When I click the `Overview` tab
    And I should see the `Hearing details` field
    And I should see `Manchester` for the `Hearing centre` field
    And I should see `3 hours` for the `Length` field
    And I should see the text `11:30:00 AM`
