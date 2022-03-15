package com.yottabyte.utils;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.stepDefs.ClickSomeButton;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

/**
 * @author sunxj
 */
public class DropdownUtils {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    public WebElement getDropdownListbyPath(String xpath) {
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getYottaDropdownList(String test) {
        String xpath = "(//div[@yotta-test='" + test + "']//div[contains(@class,'yotta-select-selection')])[last()]";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getDropdownListByLabel(String label) {
        String xpath = "(//label[text()='" + label +"']//parent::div//following-sibling::div//div[contains(@class,'yotta-select-selection-content')])[last()]";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getLastDropdownList() {
        List<WebElement> list = webDriver.findElements(By.className("yotta-select-menu"));
        WebElement lastDropdownList = list.get(list.size() - 1);
        if (lastDropdownList.getAttribute("style").contains("display: none;")) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", lastDropdownList);
        }
        return lastDropdownList;
    }

    public WebElement getMenuList() {
        List<WebElement> list = webDriver.findElements(By.className("yotta-menu"));
        WebElement lastMenuList = list.get(list.size() - 1);
        if (lastMenuList.getAttribute("style").contains("display: none;")) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", lastMenuList);
        }
        return lastMenuList;
    }

    public WebElement getSubMenu() {
        List<WebElement> list = webDriver.findElements(By.className("yotta-submenu"));
        WebElement lastMenuList = list.get(list.size() - 1);
        if (lastMenuList.getAttribute("style").contains("display: none;")) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", lastMenuList);
        }
        return lastMenuList;
    }
}
