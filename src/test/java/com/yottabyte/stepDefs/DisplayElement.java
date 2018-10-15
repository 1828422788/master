package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import com.yottabyte.utils.WaitForElement;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;

import static org.openqa.grid.common.SeleniumProtocol.Selenium;

/**
 * @author sunxj
 */
public class DisplayElement {
    private WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    @And("^I display the element \"([^\"]*)\"$")
    public void iDisplayTheElement(String elementName) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
//        ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='inline';", element);
//        ((JavascriptExecutor) webDriver).executeScript("arguments[0].setAttribute('style','display');", element);

        if (element.isDisplayed()) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='none';", element);
            ExpectedCondition expectedCondition = ExpectedConditions.invisibilityOf(element);
            WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        }
    }
}
