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

//3.6版本方式
//    public WebElement getDropdownList(String text) {
//        String xpath;
//        if (currentUrl.contains("/dictionary/") && (text.equals("字典标签") || text.equals("资源标签"))) {
//            xpath = "//div[contains(text(),'" + text + "')]/following-sibling::span//div[@class='ant-select-selection__rendered']/following-sibling::span/i";
//        } else {
//            xpath = "//div[contains(text(),'" + text + "')]/following-sibling::div//div[@class='ant-select-selection__rendered']/following-sibling::span/i";
//        }
//        WebElement element = webDriver.findElement(By.xpath(xpath));
//        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
//        ClickEvent.clickUnderneathButton(element);
//        return getLastDropdownList();
//    }

//3.6版本方式
//    public WebElement getLastDropdownList() {
//        String className = "ant-select-dropdown-menu-root";
//        List<WebElement> list = webDriver.findElements(By.className(className));
//        WebElement lastDropdownList = list.get(list.size() - 1);
//        if (lastDropdownList.getAttribute("style").contains("display: none;")) {
//            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", lastDropdownList);
//        }
//        return lastDropdownList;
//    }

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

    public WebElement getDropdownListbyPath(String xpath) {
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getDropdownListByCruxeePageXpath(String text) {
        String xpath = text;
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getLastDropdownListOnSendPolicyPage() {
        String className;
        Paging paging = new Paging();
        className = "yotta-select-menu";

        List<WebElement> list = webDriver.findElements(By.className(className));

//      WebElement lastDropdownList = list.get(list.size() - 1);
        WebElement lastDropdownList = list.get(1);
        if (lastDropdownList.getAttribute("style").contains("display: none;")) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", lastDropdownList);
        }

        WebElement li = lastDropdownList.findElement(By.xpath("//span"));
        return lastDropdownList;
    }

    public WebElement getLastSendPluginDropdownList() {
        String className;
        Paging paging = new Paging();
        className = "yotta-select-menu";

        List<WebElement> list = webDriver.findElements(By.className(className));

        WebElement lastDropdownList = list.get(list.size() - 1);
        if (lastDropdownList.getAttribute("style").contains("display: none;")) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", lastDropdownList);
        }

        WebElement li = lastDropdownList.findElement(By.xpath("//li"));
        return lastDropdownList;
    }

    public WebElement getDropdownList(String test) {
        String xpath;
        xpath = "(//div[@yotta-test='" + test + "']/div[@class='yotta-select-selection'])[last()]";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getLastDropdownList() {
        String className = "yotta-select-menu";
        List<WebElement> list = webDriver.findElements(By.className(className));
        WebElement lastDropdownList = list.get(list.size() - 1);
        if (lastDropdownList.getAttribute("style").contains("display: none;")) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", lastDropdownList);
        }
        return lastDropdownList;
    }

    public WebElement getLastDropdownList37() {
        String className = "yotta-dropdown-menu";
        List<WebElement> list = webDriver.findElements(By.className(className));
        WebElement lastDropdownList = list.get(list.size() - 1);
        if (lastDropdownList.getAttribute("style").contains("display: none;")) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", lastDropdownList);
        }
        return lastDropdownList;
    }

    public WebElement getLastDropdownResourceGroupList() {
        String str_selector = "[class='yotta-select-menu yotta-resource-tag-select-menu']";
        List<WebElement> list = webDriver.findElements(By.cssSelector(str_selector));

        WebElement lastDropdownList = list.get(list.size() - 1);
        if (lastDropdownList.getAttribute("style").contains("display: none;")) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", lastDropdownList);
        }
        return lastDropdownList;
    }

    public WebElement getLastDropdownListOfUser() {
        String xpath;
        xpath = "//span[text()='请选择分组']";
        List<WebElement> list = webDriver.findElements(By.xpath(xpath));
        WebElement lastDropdownList = list.get(list.size() - 1);
        if (lastDropdownList.getAttribute("style").contains("display: none;")) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", lastDropdownList);
        }
        return lastDropdownList;
    }

    //仪表盘下拉菜单
    public WebElement getLastDropdownListDashboard() {
        String className = "yotta-dropdown-trigger";
        List<WebElement> list = webDriver.findElements(By.className(className));
        WebElement lastDropdownList = list.get(list.size() - 1);
        if (lastDropdownList.getAttribute("style").contains("display: none;")) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", lastDropdownList);
        }
        return lastDropdownList;
    }

    //编辑应用下拉
    public WebElement getLastDropdownListEditApp() {
        String className = "yotta-dropdown-menu";
        List<WebElement> list = webDriver.findElements(By.className(className));
        WebElement lastDropdownList = list.get(list.size() - 1);
        if (lastDropdownList.getAttribute("style").contains("display: none;")) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", lastDropdownList);
        }
        return lastDropdownList;
    }

    public WebElement getMaintainTimeDropdownList() {
        String className;
//      className = "ant-time-picker-panel-select";
        className = "yotta-time-table-column-list";
        List<WebElement> list = webDriver.findElements(By.className(className));
//        WebElement lastDropdownList = list.get(list.size() - 1);
        WebElement lastDropdownList = list.get(0);
        if (lastDropdownList.getAttribute("style").contains("display: none;")) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", lastDropdownList);
        }
        return lastDropdownList;
    }

    public WebElement getAlertNoteTypeDropdownList() {
        String className = "yotta-dropdown-menu";
        List<WebElement> list = webDriver.findElements(By.className(className));
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

}
