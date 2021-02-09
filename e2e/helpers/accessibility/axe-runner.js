const fs = require('fs');

const AxeBuilder = require('@axe-core/webdriverjs');

const iaconfig = require('../../ia.conf');

const result = {
  PASSED: 'passed',
  FAILED: 'failed'
};

const resultObj = {
  appName: 'Manage cases',
  passCount: 0,
  failCount: 0,
  tests: []
};

module.exports = {

  async runAndReportAccessibility() {
    const screenshotPath = iaconfig.TestOutputDir + '/assets';
    const screenshotName = Date.now() + '.png';
    const  screenshotReportRef = 'assets/' + screenshotName;

    const accessibilityErrorsOnThePage = await new AxeBuilder(browser.driver)
                          .withTags(['wcag2a', 'wcag2aa'])
                          .analyze();

    await browser.takeScreenshot()
                      .then( async (screenShot) => {
                        if (!await fs.existsSync(screenshotPath)) {
                          fs.mkdirSync(screenshotPath, {recursive: true});
                        } 
                        fs.writeFile(screenshotPath + "/" + screenshotName, screenShot, 'base64', (err) => {
                          if(err) {
                            console.log('Failed to copy the screenshot', err);
                          }
                        });
                      });

    const processIssue = function(issue) {
      return {
        code: issue.id,
        message: issue.description,
        helpurl: issue.helpUrl,
        type: issue.impact,
        element: issue.nodes,
        tags: issue.tags,
        runner: 'axe'
      };
    };
    const violations = accessibilityErrorsOnThePage.violations.map(processIssue);
    console.log('violations are..', violations);
    const isPageAccessible = violations.length === 0 ? result.PASSED : result.FAILED;

    const urlArr = accessibilityErrorsOnThePage.url.split('/');
    
    if (isPageAccessible === result.PASSED) {
      resultObj.passCount += 1;
    } else {
      resultObj.failCount += 1;
    }
    
      resultObj.tests.push({
        name: urlArr[urlArr.length -2] + '/' + urlArr[urlArr.length -1],
        pageUrl: accessibilityErrorsOnThePage.url,
        status: isPageAccessible,
        screenshot: screenshotReportRef,
        a11yIssues: violations
      });

    console.log('result obj is ...', resultObj);
  },

  async getAccessibilityTestResult() {
    console.log('result obj is1 ...', resultObj);
    return resultObj;
  }
}
