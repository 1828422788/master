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

public class AlterElementAttribute {
    private WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 隐藏元素
     *
     * @param elementName
     */
    @And("^I display the element \"([^\"]*)\"$")
    public void hideElement(String elementName) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        hideElement(element);
    }

    public void hideElement(WebElement element) {
        if (element.isDisplayed()) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='none';", element);
            ExpectedCondition expectedCondition = ExpectedConditions.invisibilityOf(element);
            WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        }
    }

    /**
     * 显示元素
     *
     * @param elementName
     */
    @And("^I make the element \"([^\"]*)\" visible$")
    public void makeElementVisible(String elementName) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        if (!element.isDisplayed()) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", element);
            ExpectedCondition expectedCondition = ExpectedConditions.invisibilityOf(element);
            WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        }
    }

    @And("^I alter the element \"([^\"]*)\" class to \"([^\"]*)\"$")
    public void alterElementClass(String elementName, String className) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        ((JavascriptExecutor) webDriver).executeScript("arguments[0].setAttribute('class','" + className + "')", element);
    }

    @And("^I alter the element \"([^\"]*)\" style to \"([^\"]*)\"$")
    public void alterElementStyle(String elementName, String styleName) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        ((JavascriptExecutor) webDriver).executeScript("arguments[0].setAttribute('style','" + styleName + "')", element);
    }
}
