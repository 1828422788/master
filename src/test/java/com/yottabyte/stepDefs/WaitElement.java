package com.yottabyte.stepDefs;

import com.gargoylesoftware.htmlunit.ElementNotFoundException;
import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import com.yottabyte.utils.WaitForElement;

import java.util.List;

/**
 * 等待元素
 *
 * @author by A on 2017/4/14.
 */
public class WaitElement {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 等待元素可见
     *
     * @param elementName 元素名称
     */
    @When("^I wait for \"([^\"]*)\" will be visible")
    public void iWaitForWillBeVisible(String elementName) {
        Object o = GetElementFromPage.getWebElementWithName(elementName);
        if (o instanceof List) {
            List<WebElement> list = (List) o;
            for (WebElement ele : list) {
                this.elementVisible(ele);
            }
        } else {
            WebElement element = GetElementFromPage.getWebElementWithName(elementName);
            this.elementVisible(element);
        }
    }

    /**
     * 等待元素不可见
     *
     * @param elementName 元素名称
     */
    @And("^I wait for \"([^\"]*)\" will be invisible")
    public void waitForElementInvisible(String elementName) {
        try {
            WebElement element = GetElementFromPage.getWebElementWithName(elementName);
            WaitForElement.waitElementInvisible(element);
        } catch (ElementNotFoundException exception) {
            return;
        }
    }

    /**
     * 等待loading元素消失
     */
    @Then("^I wait for loading invisible$")
    public void iWaitForLoadingInvisible() {
        WaitForElement.waitUntilLoadingDisappear();
    }

    /**
     * 等待多少毫秒
     *
     * @param millseconds 毫秒值
     * @throws InterruptedException
     */
    @And("^I wait for \"([^\"]*)\" millsecond")
    public void iWaitForSecond(String millseconds) throws InterruptedException {
        Thread.sleep(Long.parseLong(millseconds));
    }

    public void waitUntilInvisible(String xpath) {
        WebElement element;
        try {
            element = webDriver.findElement(By.xpath(xpath));
        } catch (Exception e) {
            return;
        }
        this.elementVisible(element);
    }

    public void elementVisible(WebElement element) {
        ExpectedCondition expectedCondition = ExpectedConditions.visibilityOf(element);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
    }

    /**
     * 等待元素enabled和displayed
     *
     * @param elementName 元素名称
     */
    @When("^I wait for \"([^\"]*)\" to be clickable")
    public void iWaitForElementToBeClickable(String elementName) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
    }
}
