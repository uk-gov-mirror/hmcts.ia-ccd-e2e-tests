import { CcdFormPage } from '../pages/ccd-form.page';

export class BuildCaseFlow {

    private ccdFormPage = new CcdFormPage();

    async buildCase(clickContinue = false) {

        await this.ccdFormPage.selectNextStep('Build your case');
        await this.ccdFormPage.click('Go');

        await this.ccdFormPage.headingContains('Build your case');
        await this.ccdFormPage.setFieldValue(
            'Appeal skeleton argument',
            '{@CaseArgument.pdf}'
        );

        await this.ccdFormPage.setFieldValue(
            'Describe the document (Optional)',
            'This is the case argument'
        );

        await this.ccdFormPage.addCollectionItem('Evidence (Optional)');
        await this.ccdFormPage.contentContains('Describe the document');

        await this.ccdFormPage.setFieldValue(
            'Document (Optional)',
            '{@CaseArgumentEvidence.pdf}',
            'first',
            'Evidence (Optional)',
            'first'
        );

        await this.ccdFormPage.setFieldValue(
            'Describe the document (Optional)',
            'The is the case argument evidence',
            'first',
            'Evidence (Optional)',
            'first'
        );

        await this.ccdFormPage.click('Continue');
        await this.ccdFormPage.click('Upload');

        if (clickContinue) {
            await this.ccdFormPage.click('Close and Return to case details');
            await this.ccdFormPage.waitUntilLoaded();
        }
    }
}
