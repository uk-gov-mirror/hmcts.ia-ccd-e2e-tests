import { CcdFormPage } from '../pages/ccd-form.page';

export class CaseListFlow {

    private ccdFormPage = new CcdFormPage();

    async filterCasesByTodaysDate(clickApply = false) {

        await this.ccdFormPage.setFieldValue(
            'Appeal start date',
            '{$TODAY}'
        );

        if (clickApply) {
            await this.ccdFormPage.click('Apply');
            await this.ccdFormPage.waitUntilLoaded();
        }
    }
}
