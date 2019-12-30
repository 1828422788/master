package com.yottabyte.stepDefs;

import com.yottabyte.constants.WebDriverConst;
import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.WaitForElement;
import cucumber.api.java.en.And;
import org.openqa.selenium.*;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.FluentWait;

import java.util.concurrent.TimeUnit;

import static com.yottabyte.utils.GetElementFromPage.getWebElementWithName;
import static com.yottabyte.utils.GetTableElement.getTableElementWithRowAndCol;

/**
 * 等待指定元素的文本变成指定内容
 * @author by A on 2017/4/13.
 */
public class WaitElementChangeTextTo {

    public void waitForElementWithExpectedCondition(WebDriver driver, ExpectedCondition expectedCondition) {
        FluentWait wait = new FluentWait(driver)
                .withTimeout(WebDriverConst.WAIT_FOR_ELEMENT_TIMEOUT, TimeUnit.MILLISECONDS)
                .pollingEvery(WebDriverConst.WAIT_FOR_ELEMENT_POLLING_DURING, TimeUnit.MILLISECONDS)
                .ignoring(NoSuchElementException.class)
                .ignoring(TimeoutException.class)
                .ignoring(StaleElementReferenceException.class);
        wait.until(expectedCondition);
    }

    /**
     * 等待指定表格的元素文本内容变化为指定值
     *
     * @param tableAddress 表格地址，格式为：表格元素的名称-行.列 如 SearchResultTable-1.2
     * @param text         指定的文本内容
     */
    @And("^I wait table element \"([^\"]*)\" change text to \"([^\"]*)\"$")
    public void iWaitTableElementChangeTextTo(String tableAddress, String text) {
        WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
        if (tableAddress.contains("-") && tableAddress.contains(".")) {
            String realTableName = tableAddress.split("-")[0];
            String address = tableAddress.split("-")[1];
            int index = tableAddress.split("-")[1].trim().indexOf('.');
            int row = Integer.parseInt(address.substring(0, index));
            int cell = Integer.parseInt(address.substring(index + 1));
            WebElement table = getWebElementWithName(realTableName);
            WebElement e = getTableElementWithRowAndCol(table, row, cell);
            ExpectedCondition expectedCondition = ExpectedConditions.textToBePresentInElement(e, text);
            WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        } else {
            System.out.println("Table Name is wrong!!!");
        }
    }

    /**
     * 验证元素的text变为某一值
     *
     * @param elementName 元素名称
     * @param text        文本值
     */
    @And("^I wait for element \"([^\"]*)\" change text to \"([^\"]*)\"$")
    public void waitUntilTextChange(String elementName, String text) {
        WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
        WebElement element = getWebElementWithName(elementName);
        ExpectedCondition expectedCondition = new ExpectedCondition<Boolean>() {
            @Override
            public Boolean apply(WebDriver driver) {
                Boolean flag = element.getText().contains(text);
                return flag;
            }
        };

        this.waitForElementWithExpectedCondition(webDriver, expectedCondition);
    }

    /**
     * 等待元素的value变为某一值
     *
     * @param elementName 元素名称
     * @param text        文本值
     */
    @And("^I wait for element \"([^\"]*)\" value change text to \"([^\"]*)\"$")
    public void iWaitForElementValueChangeTextTo(String elementName, String text) {
        WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
        WebElement element = getWebElementWithName(elementName);
        ExpectedCondition expectedCondition = new ExpectedCondition<Boolean>() {
            @Override
            public Boolean apply(WebDriver driver) {
                Boolean flag = element.getAttribute("value").contains(text);
                return flag;
            }
        };

        this.waitForElementWithExpectedCondition(webDriver, expectedCondition);

    }
}
