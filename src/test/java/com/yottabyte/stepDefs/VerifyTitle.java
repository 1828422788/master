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

    /**
     * 断言页面的标题为某一值
     *
     * @param titleName 标题名称
     */
    @Then("^the page's title will be \"([^\"]*)\"$")
    public void theTitleWillBe(String titleName) {
        String realResult = GetElementFromPage.getCurrentPageTitle();
        assertEquals(titleName, realResult);
    }

    /**
     * 断言页面的标题包含某一值
     *
     * @param titleName 标题名称
     */
    @And("^the page's title will contains \"([^\"]*)\"$")
    public void thePageSTitleWillContains(String titleName) {
        String realResult = GetElementFromPage.getCurrentPageTitle();
        assertTrue(realResult.contains(titleName));
    }

    /**
     * 等待标题变为某一值
     *
     * @param titleName 标题名称
     */
    @And("^I wait for title change text to \"([^\"]*)\"$")
    public void waitForTitleChangeTextTo(String titleName) {
        WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
        ExpectedCondition expectedCondition = new ExpectedCondition<Boolean>() {
            @Override
            public Boolean apply(WebDriver driver) {
                Boolean flag = GetElementFromPage.getCurrentPageTitle().contains(titleName);
                if ("仪表盘|搜索".equals(titleName)) {
                    flag = GetElementFromPage.getCurrentPageTitle().contains("仪表盘") || GetElementFromPage.getCurrentPageTitle().contains("搜索");
                }
                return flag;
            }
        };

        new WaitElementChangeTextTo().waitForElementWithExpectedCondition(webDriver, expectedCondition);
    }
}
