package com.yottabyte.stepDefs;

import com.gargoylesoftware.htmlunit.ElementNotFoundException;
import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import com.yottabyte.utils.WaitForElement;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

/**
 * Created by A on 2017/4/14.
 */
public class WaitForElementVisible {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    @When("^I wait for \"([^\"]*)\" will be visible")
    public void iWaitForWillBeVisible(String elementName) {
        Object o = GetElementFromPage.getWebElementWithName(elementName);
        if (o instanceof List) {
            List<WebElement> list = (List) o;
            for (WebElement ele : list) {
                this.elementInvisible(ele);
            }
        } else {
            WebElement element = GetElementFromPage.getWebElementWithName(elementName);
            this.elementInvisible(element);
        }
    }

    @And("^I wait for \"([^\"]*)\" will be invisible")
    public void iWaitForWillBeInvisible(String elementName) {
        try {
            WebElement element = GetElementFromPage.getWebElementWithName(elementName);
//            ExpectedCondition expectedCondition = ExpectedConditions.invisibilityOf(element);
//            WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
            WaitForElement.waitElementInvisible(element);
//            WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.invisibilityOf(element));
        } catch (ElementNotFoundException exception) {
            return;
        }
    }

    @Then("^I wait for loading invisible$")
    public void iWaitForLoadingInvisible() {
        WaitForElement.waitUntilLoadingDisappear();
    }

    public void waitUntilInvisible(String xpath) {
        WebElement element;
        try {
            element = webDriver.findElement(By.xpath(xpath));
        } catch (Exception e) {
            return;
        }
        this.elementInvisible(element);
    }

    private void elementInvisible(WebElement element) {
        ExpectedCondition expectedCondition = ExpectedConditions.visibilityOf(element);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
    }
}
