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
     * 判断文本在页面中存在
     *
     * @param text
     */
    @Then("^I will see the div text \"([^\"]*)\" exist in page$")
    public void divTextExistInPage(String text) {
        try {
            webDriver.findElement(By.xpath("//td/div[@yotta-test='search-reduce_detail-dom'][text()='" + text + "']"));
            Assert.assertTrue(true);
        } catch (Exception e) {
            Assert.assertTrue(false);
        }
    }
    /**
     * 判断文本在页面中不存在
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
