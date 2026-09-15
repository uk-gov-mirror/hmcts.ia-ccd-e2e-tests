import { $, browser, ExpectedConditions } from 'protractor';
import { AnyPage } from './any.page';
import { FormFiller } from '../helpers/form-filler';

export class IdamSignInPage extends AnyPage {
  private formFiller = new FormFiller();

  // private username = 'form[name="loginForm"] input#username';
  // private password = 'form[name="loginForm"] input#password';
  private username = '#email';
  private password = '#password';

  // first selector is for Idam, second selector is for Idam simulator
  // private signInButton = 'form[name="loginForm"] input[type=submit], form[name="loginForm"] button[type=submit]';
  private signInButton = '#main-content > div > div > form > div.govuk-button-group > button';

  async signIn(emailAddress: string, password: string) {
    await this.waitUntilLoaded();
    await this.runAccessbility();
    await this.formFiller.replaceText($(this.username), emailAddress);
    await $(this.signInButton).click();
    await this.formFiller.replaceText($(this.password), password);
    await $(this.signInButton).click();
    await browser.sleep(3000);
    await browser.refresh();
  }

  async isLoaded() {
    // const hasLogin = (await browser.driver.getCurrentUrl()).includes('login');
    // const signInButtonVisible = await ExpectedConditions.visibilityOf($(this.signInButton))();
    // return hasLogin && signInButtonVisible;
    return (await browser.driver.getCurrentUrl()).includes('login') && (await ExpectedConditions.visibilityOf($(this.signInButton))());
  }

  async waitUntilLoaded() {
    await browser.driver.wait(ExpectedConditions.visibilityOf($(this.signInButton)), 30000, 'IDAM Sign In page did not load in time');
  }
}
