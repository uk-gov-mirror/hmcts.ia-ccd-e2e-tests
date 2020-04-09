Feature: Leadership judge record the respondent decision and reasons

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
    And I generate the hearing bundle
    And I start decision and reasons
    And I prepare decision and reasons
    And I send decision and reasons
    And I switch to be a `Home Office POU`
    And I apply for ftpa permission to appeal

  @ftpa-respondent-leadership-judge-decision-granted @ftpa-respondent-leadership-judge-decision  @RIA-1434
  Scenario: FTPA respondent leadership judge decision - Granted
    When I switch to be a Judge
    And I select the `Leadership judge FTPA decision` Next step
    And I am on the `Leadership judge FTPA decision` page
    And I select Home Office for the applicant type

    Then I click the `Continue` button
    And I select `Permission granted` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field

    When I click the `Continue` button
    And I should see the text `Notes for the Upper Tribunal`
    And I should see the text `Do not issue any case specific directions to the parties regarding the onward conduct`
    And I should see the text `of the appeal in the Upper Tribunal. The Upper Tribunal will prepare and issue`
    And I should see the text `standard directions in every case. You should refer the file to the Principal Resident`
    And I should see the text `Judge of UTIAC if you believe further directions should be issued in advance of the`
    And I should see the text `initial Upper Tribunal Hearing.`
    And I click the `There is a point of special difficulty or importance` label
    And I type `This is information to the upper tribunal` for the `Provide any information that may be helpful to the Upper Tribunal judge (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Home Office` in the `Who made the application?` field
    And I should see `Permission granted` in the `The outcome of the application` field
    And I should see `There is a point of special difficulty or importance` in the `Tick any applicable points` field
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` for the `Describe the document` field

    When I click the `Submit` button
    Then I should see the text `You've recorded the First-tier permission to appeal decision`
    And I should see the text `What happens next`
    And I should see the text `Both parties have been notified of the decision. The Upper Tribunal has also been`
    And I should see the text `notified, and will now proceed with the case.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Leadership judge FTPA decision`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Permission granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Tribunal Notes`
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Case Officer`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Permission granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Tribunal Notes`
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Admin Officer`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Permission granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Tribunal Notes`
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Home Office POU`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Permission granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Tribunal Notes`
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Home Office Generic`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Permission granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Tribunal Notes`
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Legal Rep`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Permission granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Tribunal Notes`
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

  @ftpa-respondent-leadership-judge-decision-partially-granted @ftpa-respondent-leadership-judge-decision @RIA-1434
  Scenario: FTPA respondent leadership judge decision - Partially granted
    When I switch to be a Judge
    And I select the `Leadership judge FTPA decision` Next step
    And I am on the `Leadership judge FTPA decision` page
    And I select Home Office for the applicant type

    Then I click the `Continue` button
    And I select `Permission partially granted` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field

    When I click the `Continue` button
    And I should see the text `Notes for the Upper Tribunal`
    And I should see the text `Do not issue any case specific directions to the parties regarding the onward conduct`
    And I should see the text `of the appeal in the Upper Tribunal. The Upper Tribunal will prepare and issue`
    And I should see the text `standard directions in every case. You should refer the file to the Principal Resident`
    And I should see the text `Judge of UTIAC if you believe further directions should be issued in advance of the`
    And I should see the text `initial Upper Tribunal Hearing.`
    And I click the `There is a point of special difficulty or importance` label
    And I type `This is information to the upper tribunal` for the `Provide any information that may be helpful to the Upper Tribunal judge (Optional)` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Home Office` in the `Who made the application?` field
    And I should see `Permission partially granted` in the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` for the `Describe the document` field
    And I should see `There is a point of special difficulty or importance` in the `Tick any applicable points` field
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    When I click the `Submit` button
    Then I should see the text `You've recorded the First-tier permission to appeal decision`
    And I should see the text `What happens next`
    And I should see the text `Both parties have been notified of the decision. The Upper Tribunal has also been`
    And I should see the text `notified, and will now proceed with the case.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Leadership judge FTPA decision`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Permission partially granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Tribunal Notes`
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Case Officer`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Permission partially granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Tribunal Notes`
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Admin Officer`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Permission partially granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Tribunal Notes`
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Home Office POU`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Permission partially granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Tribunal Notes`
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Home Office Generic`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Permission partially granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Tribunal Notes`
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Legal Rep`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Permission partially granted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field
    And I should see the text `Tribunal Notes`
    And I should see `This is information to the upper tribunal` in the `Provide any information that may be helpful to the Upper Tribunal judge` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

  @ftpa-respondent-leadership-judge-decision-refused @ftpa-respondent-leadership-judge-decision @RIA-1434
  Scenario: FTPA respondent leadership judge decision - refused
    When I switch to be a Judge
    And I select the `Leadership judge FTPA decision` Next step
    And I am on the `Leadership judge FTPA decision` page
    And I select Home Office for the applicant type

    Then I click the `Continue` button
    And I select `Permission refused` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Home Office` in the `Who made the application?` field
    And I should see `Permission refused` in the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` for the `Describe the document` field

    When I click the `Submit` button
    Then I should see the text `You've recorded the First-tier permission to appeal decision`
    And I should see the text `What happens next`
    And I should see the text `Both parties have been notified that permission was refused. They'll also be able to access this information in the FTPA tab.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Leadership judge FTPA decision`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Case Officer`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Admin Officer`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Home Office POU`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Home Office Generic`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Permission refused` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Legal Rep`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should not see the `The outcome of the application` field
    And I should not see the `FTPA Decision and Reasons document` field
    And I should not see the `Decision date` field

    Then I click the `Documents` tab
    And I should not see the `FTPA Appellant Decision and Reasons documents` field


  @ftpa-respondent-leadership-judge-not-admitted @ftpa-respondent-leadership-judge-decision @RIA-1434
  Scenario: FTPA respondent leadership judge decision - Not admitted
    When I switch to be a Judge
    And I select the `Leadership judge FTPA decision` Next step
    And I am on the `Leadership judge FTPA decision` page
    And I select Home Office for the applicant type

    Then I click the `Continue` button
    And I select `Application not admitted` for the `The outcome of the application` field
    And I add an item to the `FTPA Decision and Reasons document` collection
    And within the `FTPA Decision and Reasons document` collection's first item, I upload `{@FTPADecisionAndReasons.pdf}` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I type `This is the ftpa decision and reasons` for the `Describe the document` field

    When I click the `Continue` button
    Then I am on the `Check your answers` page
    And I should see `Home Office` in the `Who made the application?` field
    And I should see `Application not admitted` in the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` for the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` for the `Describe the document` field

    When I click the `Submit` button
    Then I should see the text `You've recorded the First-tier permission to appeal decision`
    And I should see the text `What happens next`
    And I should see the text `The applicant has been notified that the application was not admitted. They'll also be able to access this information in the FTPA tab.`

    When I click the `Close and Return to case details` button
    Then I should see an alert confirming the case `has been updated with event: Leadership judge FTPA decision`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Application not admitted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Case Officer`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Application not admitted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Admin Officer`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Application not admitted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Home Office POU`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Application not admitted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Home Office Generic`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should see the text `Respondent: Decision on permission to appeal`
    And I should see `Application not admitted` for the `The outcome of the application` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Decision and Reasons document` collection's first item, I should see `This is the ftpa decision and reasons` in the `Describe the document` field
    And I should see `{$TODAY|D MMM YYYY}` in the `Decision date` field

    Then I click the `Documents` tab
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `FTPADecisionAndReasons.pdf` in the `Document` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `This is the ftpa decision and reasons` in the `Description` field
    And within the `FTPA Respondent Decision and Reasons documents` collection's first item, I should see `{$TODAY|D MMM YYYY}` for the `Date uploaded` field

    When I switch to be a `Legal Rep`
    And I click the `FTPA` tab
    And I should see the `FTPA` page
    And I should not see the `The outcome of the application` field
    And I should not see the `FTPA Decision and Reasons document` field
    And I should not see the `Decision date` field

    Then I click the `Documents` tab
    And I should not see the `FTPA Appellant Decision and Reasons documents` field
