package com.yottabyte.utils;

import com.yottabyte.hooks.LoginBeforeAllTests;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

/**
 * @author sunxj
 */
public class DropdownUtils {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
    String currentUrl = webDriver.getCurrentUrl();

    public WebElement getDropdownList(String text) {
        String xpath;
        if (currentUrl.contains("/dictionary/") && (text.equals("字典标签") || text.equals("资源标签"))) {
            xpath = "//div[contains(text(),'" + text + "')]/following-sibling::span//div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        }
        else {
            xpath = "//div[contains(text(),'" + text + "')]/following-sibling::div//div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        }
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getLastDropdownList() {
        String className;
        Paging paging = new Paging();
        if (paging.checkUrl()) {
            className = "el-select-dropdown__list";
        } else {
            className = "ant-select-dropdown-menu-root";
        }

        List<WebElement> list = webDriver.findElements(By.className(className));
        WebElement lastDropdownList = list.get(list.size() - 1);
        if (lastDropdownList.getAttribute("style").contains("display: none;")) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", lastDropdownList);
        }
        WebElement li = lastDropdownList.findElement(By.xpath(".//li"));
//        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(li));
        return lastDropdownList;
    }

    public WebElement getGroupDropdownList() {
        WebElement searchGroupButton = webDriver.findElement(By.xpath("//span[text()='全部资源']/preceding-sibling::i"));
        searchGroupButton.click();
        WebElement groupDropdownList = webDriver.findElement(By.xpath("//li[contains(text(),'全部资源')]"));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(groupDropdownList));
        return this.lastGroupDropdownList();
    }

    public WebElement lastGroupDropdownList() {
        WebElement element = webDriver.findElement(By.xpath("(//ul[@class='el-dropdown-menu yw-table-group__group-menu'])[last()]"));
        return element;
    }
}
