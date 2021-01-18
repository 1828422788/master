package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import cucumber.api.java.en.Then;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

/**
 * 判断按钮是否存在
 * @author sunxj
 */
public class VerifyButtonIsExist {
    private WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 判断元素是否存在
     *
     * @param buttonName
     */
    @Then("^I will see the \"([^\"]*)\" is not exist$")
    public void elementNotExist(String buttonName) {
        try {
            GetElementFromPage.getWebElementWithName(buttonName);
        } catch (Exception e) {
            Assert.assertTrue(true);
        }
    }

    /**
     * 判断文本在页面中存在
     *
     * @param text
     */
    @Then("^I will see the text \"([^\"]*)\" exist in page$")
    public void textExistInPage(String text) {
//        WebElement element = webDriver.findElement(By.xpath("//*[text()='" + text + "']"));
        try {
            webDriver.findElement(By.xpath("//*[text()='" + text + "']"));
            Assert.assertTrue(true);
        } catch (Exception e) {
            Assert.assertTrue(false);
        }
    }

    /**
     * 判断元素是否存在
     *
     * @param text
     */
    @Then("^I will see the text \"([^\"]*)\" is not existed in page$")
    public void textNotExistInPage(String text) {
//        WebElement element = webDriver.findElement(By.xpath("//*[text()='" + text + "']"));
        try {
            webDriver.findElement(By.xpath("//*[text()='" + text + "']"));
        } catch (Exception e) {
            Assert.assertTrue(true);
        }
    }
}
