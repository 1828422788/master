package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedCondition;

import static com.yottabyte.utils.GetElementFromPage.getWebElementWithName;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

/**
 * 断言title的内容是指定内容
 * Created by A on 2017/4/7.
 */
public class VerifyTitle {

    @Then("^the page's title will be \"([^\"]*)\"$")
    public void theTitleWillBe(String titleName) {
        String realResult = GetElementFromPage.getCurrentPageTitle();
        assertEquals(titleName, realResult);
    }

    @And("^the page's title will contains \"([^\"]*)\"$")
    public void thePageSTitleWillContains(String titleName) {
        String realResult = GetElementFromPage.getCurrentPageTitle();
        assertTrue(realResult.contains(titleName));
    }

    @And("^I wait for title change text to \"([^\"]*)\"$")
    public void waitForTitleChangeTextTo(String titleName) {
        WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
        ExpectedCondition expectedCondition = new ExpectedCondition<Boolean>() {
            @Override
            public Boolean apply(WebDriver driver) {
                Boolean flag = GetElementFromPage.getCurrentPageTitle().contains(titleName);
                return flag;
            }
        };

        new WaitElementChangeTextTo().waitForElementWithExpectedCondition(webDriver, expectedCondition);
    }
}
