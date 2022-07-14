package com.yottabyte.stepDefs;

import com.gargoylesoftware.htmlunit.ElementNotFoundException;
import com.yottabyte.constants.WebDriverConst;
import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import com.yottabyte.utils.JsonStringPaser;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.TimeoutException;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.support.ui.FluentWait;

import java.util.Map;
import java.util.concurrent.TimeUnit;
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
    @When("^I wait for \"([^\"]*)\" will be visible$")
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
     * 等待元素可点击, enabled, visible
     *
     * @param buttonName 元素名称,对应的getxpath方法名字, 这个方法需要在page中定义
     * example: And I wait for "ButtonXpath" will be clickable by xpath
     *     or   And I wait for "{'ButtonXpath':'确定'}" will be clickable by xpath
     */
    @When("^I wait for \"([^\"]*)\" will be clickable by xpath$")
    public void iWaitForWillBeClickableByXpath(String buttonName) {
        String xpath = getXpathFromPage(buttonName);
        ExpectedCondition expectedCondition = ExpectedConditions.elementToBeClickable(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
    }

    /**
     * 等待元素可见, visible
     *
     * @param buttonName 元素名称,对应的getxpath方法名字, 这个方法需要在page中定义
     * example: And I wait for "ButtonXpath" will be clickable by xpath
     *     or   And I wait for "{'ButtonXpath':'确定'}" will be clickable by xpath
     */
    @When("^I wait for \"([^\"]*)\" will be visible by xpath$")
    public void iWaitForWillBeVisibleByXpath(String buttonName) {
        String xpath = getXpathFromPage(buttonName);
        ExpectedCondition expectedCondition = ExpectedConditions.visibilityOfElementLocated(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
    }

    /**
     * 等待元素不可见, invisible
     *
     * @param buttonName 元素名称,对应的getxpath方法名字, 这个方法需要在page中定义
     * example: And I wait for "ButtonXpath" will be clickable by xpath
     *     or   And I wait for "{'ButtonXpath':'确定'}" will be clickable by xpath
     */
    @When("^I wait for \"([^\"]*)\" will be invisible by xpath$")
    public void iWaitForWillBeInvisibleByXpath(String buttonName) {
        String xpath = getXpathFromPage(buttonName);
        ExpectedCondition expectedCondition = ExpectedConditions.invisibilityOfElementLocated(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
    }

    /**
     * Returns: the WebElement once it is located,也就是元素存在
     * @param buttonName 元素名称,对应的getxpath方法名字, 这个方法需要在page中定义
     * example: And I wait for "ButtonXpath" will be clickable by xpath
     *     or   And I wait for "{'ButtonXpath':'确定'}" will be clickable by xpath
     */
    @When("^I wait for \"([^\"]*)\" will be Located by xpath$")
    public void iWaitForWillBeLocatedByXpath(String buttonName) {
        String xpath = getXpathFromPage(buttonName);
        ExpectedCondition expectedCondition = ExpectedConditions.presenceOfElementLocated(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
    }

    /**
     * An expectation for checking WebElement with given locator has attribute with a specific value
     * Params:
     * locator – used to find the element
     * attribute – used to define css or html attribute
     * value – used as expected attribute value
     * Returns:
     * Boolean true when element has css or html attribute with the value
     *
     * example: And I wait for "ButtonXpath" will be clickable by xpath
     *     or   And I wait for "{'ButtonXpath':'确定'}" will be clickable by xpath
     */
    @When("^I wait for \"([^\"]*)\" attribute \"([^\"]*)\" value be \"([^\"]*)\" by xpath$")
    public void iWaitForElementBeLocatedByXpath(String buttonName, String attributeName, String expectAttributeValue) {
        String xpath = getXpathFromPage(buttonName);
        ExpectedCondition expectedCondition = ExpectedConditions.attributeToBe(By.xpath(xpath), attributeName, expectAttributeValue);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
    }

    private String getXpathFromPage(String buttonName) {
        String parameters = "";
        String xpath;
        if (JsonStringPaser.isJson(buttonName)) {
            Map<String, Object> map = JsonStringPaser.json2Stirng(buttonName);
            for (Map.Entry<String, Object> entry : map.entrySet()) {
                buttonName = entry.getKey();
                parameters = (String) entry.getValue();
            }
            xpath = GetElementFromPage.getWebElementWithName(buttonName, parameters);
        } else {
            xpath = GetElementFromPage.getWebElementWithName(buttonName);
        }
        return xpath;
    }

    /**
     * 等待元素可见,等待时间可自定义
     *
     * @param elementName 元素名称
     */
    @And("^I wait for \"([^\"]*)\" will be visible in \"([^\"]*)\" milliseconds$")
    public void iWaitForWillBeVisibleInMilliseconds(String elementName, int timeout) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        FluentWait wait = new FluentWait(webDriver)
                .withTimeout(timeout, TimeUnit.MILLISECONDS)
                .pollingEvery(WebDriverConst.WAIT_FOR_ELEMENT_POLLING_DURING, TimeUnit.MILLISECONDS)
                .ignoring(NoSuchElementException.class)
                .ignoring(TimeoutException.class)
                .ignoring(StaleElementReferenceException.class);
        wait.until(ExpectedConditions.visibilityOf(element));
    }

    /**
     * 等待元素不可见
     *
     * @param elementName 元素名称
     */
    @And("^I wait for \"([^\"]*)\" will be invisible$")
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
    @And("^I wait for \"([^\"]*)\" millsecond$")
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
