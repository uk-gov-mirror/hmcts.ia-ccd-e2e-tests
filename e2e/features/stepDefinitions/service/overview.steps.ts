import { CcdPage } from '../../../pages/ccd.page';
import { Then } from 'cucumber';
import { Wait } from '../../../enums/wait';
import { expect } from 'chai';

const ccdPage = new CcdPage();

Then(/^I should (see|not see) the case details$/, async function (seeOrNotSee) {

    const isDisplayed = (seeOrNotSee === 'see');

    expect(await ccdPage.headingContains('Case details', !isDisplayed)).to.equal(isDisplayed);

    if (isDisplayed) {

        const referenceNumberIsDraft = await ccdPage.isFieldValueDisplayed('Appeal reference', 'DRAFT');
        const referenceNumberIsCorrectLength = await ccdPage.isFieldValueCorrectLength('Appeal reference', 13);

        expect(referenceNumberIsDraft || referenceNumberIsCorrectLength).to.equal(true);
        expect(await ccdPage.isFieldValueDisplayed('Appellant', 'José González')).to.equal(true);
        expect(await ccdPage.isFieldValueDisplayed('Date of birth', '31 Dec 1999')).to.equal(true);
        expect(await ccdPage.isFieldValueDisplayed('Nationality', 'Finland', true, 'first', 'Nationalities', 'first')).to.equal(true);
        expect(await ccdPage.isFieldValueDisplayed('Type of appeal', 'The refusal of a protection claim')).to.equal(true);

        const homeOfficeNumberShort = await ccdPage.isFieldValueCorrectLength('Home Office reference', 7);
        const homeOfficeNumberLong = await ccdPage.isFieldValueCorrectLength('Home Office reference', 11);

        expect(homeOfficeNumberShort || homeOfficeNumberLong).to.equal(true);
        expect(await ccdPage.contentContains('A123456',  Wait.instant)).to.equal(true);

    } else {
        expect(await ccdPage.contentContains('Appeal reference', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Appellant', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Date of birth', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Nationality', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Type of appeal', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Hearing centre', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Home Office reference', Wait.instant)).to.equal(false);
    }
});

Then(/^I should (see|not see) the legal representative details$/, async function (seeOrNotSee) {

    const isDisplayed = (seeOrNotSee === 'see');

    expect(await ccdPage.headingContains('Legal representative', !isDisplayed)).to.equal(isDisplayed);

    if (isDisplayed) {

        expect(await ccdPage.isFieldValueDisplayed('Company', 'IA Legal Services')).to.equal(true);
        expect(await ccdPage.isFieldValueDisplayed('Email', 'ia-law-firm-a@fake.hmcts.net')).to.equal(true);
        expect(await ccdPage.isFieldValueDisplayed('Legal representative reference', 'ia-legal-fenn')).to.equal(true);

    } else {
        expect(await ccdPage.contentContains('Company', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Email', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Legal representative reference', Wait.instant)).to.equal(false);
    }
});

Then(/^I should (see|not see) the hearing details$/, async function (seeOrNotSee) {

    const isDisplayed = (seeOrNotSee === 'see');

    expect(await ccdPage.headingContains('Hearing details', !isDisplayed)).to.equal(isDisplayed);

    if (isDisplayed) {

        expect(await ccdPage.isFieldValueDisplayed('Length of hearing', '6 hours')).to.equal(true);
        expect(await ccdPage.isFieldValueDisplayed('Hearing date and time', '{$TODAY+14|D MMM YYYY}, 10:30:00 AM')).to.equal(true);

    } else {
        expect(await ccdPage.contentContains('Length of hearing', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Hearing date and time', Wait.instant)).to.equal(false);
    }
});

Then(/^I should (see|not see) the ended appeal details$/, async function (seeOrNotSee) {

    const isDisplayed = (seeOrNotSee === 'see');

    expect(await ccdPage.headingContains('Ended appeal details', !isDisplayed)).to.equal(isDisplayed);

    if (isDisplayed) {
        expect(await ccdPage.isFieldValueDisplayed('Outcome of the appeal', 'Struck out')).to.equal(true);
        expect(await ccdPage.isFieldValueDisplayed('Reasons for this outcome', 'some end appeal reason')).to.equal(true);
        expect(await ccdPage.isFieldValueDisplayed('Approved by', 'Judge')).to.equal(true);
        expect(await ccdPage.isFieldValueDisplayed('Name of approver', 'John Doe')).to.equal(true);
        expect(await ccdPage.isFieldValueDisplayed('Outcome date', '{$TODAY|D MMM YYYY}')).to.equal(true);

    } else {
        expect(await ccdPage.contentContains('Outcome of the appeal', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Reasons for this outcome', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Approved by', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Name of approver', Wait.instant)).to.equal(false);
        expect(await ccdPage.contentContains('Outcome date', Wait.instant)).to.equal(false);
    }
});

Then(/^I should (see|not see) the appeal removed from the online service details$/, async function (seeOrNotSee) {

    const isDisplayed = (seeOrNotSee === 'see');

    expect(await ccdPage.headingContains('Appeal removed from the online service', !isDisplayed)).to.equal(isDisplayed);

    if (isDisplayed) {
        expect(await ccdPage.isFieldValueDisplayed('Reasons for removal', 'some appeal removal reason')).to.equal(true);
        expect(await ccdPage.isFieldValueDisplayed('Removal date', '{$TODAY|D MMM YYYY}')).to.equal(true);

    } else {
        expect(await ccdPage.isFieldValueDisplayed('Reason for removal', 'some appeal removal reason')).to.equal(false);
        expect(await ccdPage.isFieldValueDisplayed('Removal date', '{$TODAY|D MMM YYYY}')).to.equal(false);
    }
});

Then(/^I should only see the `?([^\s`]+)`? case progress image$/, async function (imageName) {

    const caseProgressionImageSources =
        (await ccdPage.getDisplayedImageSources())
            .map(src => (src + ''))
            .filter(src => src.includes('/caseOfficer_') || src.includes('/legalRep_') || src.includes('/homeOffice_') || src.includes('/appeal_') || src.includes('/adminOfficer_'));

    expect(caseProgressionImageSources.some(src => src.includes('/' + imageName))).to.equal(true);
    expect(caseProgressionImageSources.length).to.equal(1);
});

Then(/^I should not see any case progress images$/, async function () {

    const caseProgressionImageSources =
        (await ccdPage.getDisplayedImageSources())
            .map(src => (src + ''))
            .filter(src => src.includes('/caseOfficer_') || src.includes('/legalRep_') || src.includes('/homeOffice_') || src.includes('/appeal_') || src.includes('/adminOfficer_'));

    expect(caseProgressionImageSources.length).to.equal(0);
});

Then(/^I should see the `?([^\s`]+)`? image$/, async function (imageName) {

    const imageSources =
        (await ccdPage.getDisplayedImageSources())
            .map(src => (src + ''))
            .filter(src => src.includes('/caseOfficer_') || src.includes('/legalRep_') || src.includes('/homeOffice_') || src.includes('/appeal_') || src.includes('/adminOfficer_')
                || src.includes('/caseFlag'));

    expect(imageSources.some(src => src.includes('/' + imageName))).to.equal(true);
});

Then(/^I see the 'Appellant in person' tag$/, async function () {
    const imageSources =
      (await ccdPage.getDisplayedImageSources())
        .map(src => (src + ''));

    expect(imageSources.some(src => src.includes('/journey_type_appellant_in_person.png'))).to.equal(true);
});

Then(/^I should (see|not see) `Legally Represented` tag$/, async function (seeOrNotSee) {
    const isDisplayed = (seeOrNotSee === 'see');
    const imageSources =
      (await ccdPage.getDisplayedImageSources())
        .map(src => (src + ''));
    if (isDisplayed) {
        expect(imageSources.some(src => src.includes('/journey_type_legally_represented.png'))).to.equal(true);
    } else {
        expect(imageSources.some(src => src.includes('/journey_type_legally_represented.png'))).to.equal(false);
    }
});
