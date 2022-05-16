package com.yottabyte.stepDefs;

import com.yottabyte.config.ConfigManager;
import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import com.yottabyte.utils.WaitForElement;
import cucumber.api.java.en.And;
import org.junit.Assert;
import org.openqa.selenium.*;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.ArrayList;
import java.util.List;

/**
 * 对下拉框的选择操作
 * Created by A on 2017/4/7.
 */
public class IChooseValueFromSelectList {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 在下拉框中，根据配置文件名称选择
     *
     * @param propertyName   配置文件中的key
     * @param selectListName 下拉框元素名称
     */
    @And("^I choose the \"([^\"]*)\" from the \"([^\"]*)\" with property$")
    public void iChooseTheValueFromTheListWithProperty(String propertyName, String selectListName) {
        ConfigManager manager = new ConfigManager();
        List<String> list = new ArrayList<>();
        list.add(manager.get(propertyName));
        this.iChooseTheValueFromTheList(list, selectListName);
    }

    /**
     * 选择下拉框内容
     *
     * @param values         想要选择的内容，支持list
     * @param selectListName 下拉框元素名称
     */
    @And("^I choose the \"([^\"]*)\" from the \"([^\"]*)\"$")
    public void iChooseTheValueFromTheList(List<String> values, String selectListName) {
        if (values.size() == 0) {
            return;
        }
        Object elementObj = GetElementFromPage.getWebElementWithName(selectListName);
        WebElement parentElementOfTheList;
        if (elementObj != null) {
            if (elementObj instanceof List) {
                List list = (List) elementObj;
                parentElementOfTheList = ((WebElement)list.get(0)).findElement(By.xpath("./parent::*"));
            } else {
                parentElementOfTheList = (WebElement) elementObj;
            }
            iChooseTheValueFromTheList(values, parentElementOfTheList);
        }
    }

    //TODO:调查下，是否可以删除这个，用上面的方法代替
    /**
     * 选择下拉框内容
     *
     * @param values         想要选择的内容，支持list
     * @param selectListName 下拉框元素名称
     */
    @And("^I choose the \"([^\"]*)\" from the \"([^\"]*)\" in the time list$")
    public void iChooseTheValueFromTheTimeList(List<String> values, String selectListName) {
        if (values.size() == 0) {
            return;
        }
        Object elementObj = GetElementFromPage.getWebElementWithName(selectListName);
        WebElement parentElementOfTheList;
        if (elementObj != null) {
            if (elementObj instanceof List) {
                List list = (List) elementObj;
                parentElementOfTheList = ((WebElement)list.get(0)).findElement(By.xpath("./parent::*"));
            } else {
                parentElementOfTheList = (WebElement) elementObj;
            }
            iChooseTheValueFromTheTimeList(values, parentElementOfTheList);
        }
    }

    /**
     * 取消下拉框的选择
     *
     * @param values         待取消的内容
     * @param selectListName 下拉框元素名称
     */
    @And("^I cancel selection \"([^\"]*)\" from the \"([^\"]*)\"$")
    public void iCancelSelectionOfValueFromTheList(List<String> values, String selectListName) {
        WebElement parentElement = GetElementFromPage.getWebElementWithName(selectListName);
        iCancelSelectionOfValueFromTheList(values, parentElement);
    }

    /**
     * 根据配置文件取消下拉框的选择
     *
     * @param propertyName   配置文件中的key
     * @param selectListName 下拉框元素名称
     */
    @And("^I cancel selection \"([^\"]*)\" from the \"([^\"]*)\" with property$")
    public void iCancelSelectionOfValueFromTheListWithProperty(String propertyName, String selectListName) {
        WebElement parentElement = GetElementFromPage.getWebElementWithName(selectListName);
        ConfigManager configManager = new ConfigManager();
        List<String> list = new ArrayList<>();
        list.add(configManager.get(propertyName));
        iCancelSelectionOfValueFromTheList(list, parentElement);
    }

    //TODO:调查下，是否可以使用以下方法代替这个方法
    @And("^I cancel all selections from the element \"([^\"]*)\" except value \"([^\"]*)\"$")
    public void iCancelAllSelectionFromTheListExceptValueLi(WebElement parentElement, List<String> values) {
        List<WebElement> selections = parentElement.findElements(By.xpath("./li[contains(@class,'selected')]"));
        for (WebElement e : selections) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", e);
            if (e.getAttribute("class").contains("selected")) {
                if (e.getAttribute("style").contains("display: none;")) {
                    ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", e);
                }
            }
            boolean flag = false;
            for (String v : values) {
                if (v.equals(e.getText())) {
                    flag = false;
                    break;
                } else {
                    flag = true;
                }
            }
            if (flag) {
                e.click();
            }
        }
    }

    /**
     * 取消下拉框的选择
     *
     * @param values         不取消的内容
     * @param selectListName 下拉框元素名称
     */
    @And("^I cancel all selections from the \"([^\"]*)\" except value \"([^\"]*)\"$")
    public void iCancelAllSelectionFromTheListExceptValue(String selectListName, List<String> values) {
        WebElement parentElement = GetElementFromPage.getWebElementWithName(selectListName);
        List<WebElement> selections = parentElement.findElements(By.xpath("./div[contains(@class,'selected')]"));
        for (WebElement e : selections) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", e);
            if (e.getAttribute("class").contains("selected")) {
                if (e.getAttribute("style").contains("display: none;")) {
                    ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", e);
                }
            }
            boolean flag = false;
            for (String v : values) {
                if (v.equals(e.getText())) {
                    flag = false;
                    break;
                } else {
                    flag = true;
                }
            }
            if (flag) {
                e.click();
            }
        }
    }

    /**
     * 添加新选项到下拉框，选择这个新添加的选项
     * 比如，添加新资源标签
     *
     * @param elementName 元素名称
     * @param value       输入的值
     */
    @And("^I choose the new value \"([^割]*)\" from the \"([^\"]*)\"$")
    public void iChooseTheNewValueFromTheList(String value, String elementName) {
        WebElement selectList = GetElementFromPage.getWebElementWithName(elementName);
        WebElement inputElement = webDriver.findElement(By.xpath("//input[@class='yotta-select-selection-search']"));
        inputElement.sendKeys(value);
        selectList.findElement(By.xpath(".//*[contains(@class,'option') and text()='" + value + "']")).click();
    }

    public void iChooseTheValueFromTheList(List<String> values, WebElement parentElement) {
        String option = ".//span";
        List<WebElement> elements = parentElement.findElements(By.xpath(option));
        boolean success = false;
        for (String value : values) {
            if (value != null && value.trim().length() != 0) {
                WebElement e = elements.get(0);
                int counter = 0;
                while (true) {
                    ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", e);
                    String cur_text = e.getText();
                    if (value.equals(cur_text)) {
                        success = true;
                        e.click();
                        break;
                    }
                    counter++;
                    if (counter == elements.size()) {
                        if (parentElement.findElements(By.xpath(option)).equals(elements)) {
                            break;
                        } else {
                            elements = parentElement.findElements(By.xpath(option));
                            counter = 0;
                        }
                    }
                    e = elements.get(counter);
                }
            }
            if (!success)
                Assert.fail("No such option in the list:" + value + " is missing");
            //选择下拉列表的内容以后，等待下拉列表不可见了
            WaitForElement.waitUntilElementLocatedByAttributeDisappear(By.className("yotta-select-option-selected"));
        }
    }

    public void iChooseTheValueFromTheTimeList(List<String> values, WebElement parentElement) {
        List<WebElement> elements = parentElement.findElements(By.xpath(".//li"));
        for (String value : values) {
            if (value != null && value.trim().length() != 0) {
                for (WebElement e : elements) {
                    ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", e);
                    String cur_text = e.getText();
                    if (value.equals(cur_text)) {
                        e.click();
                        break;
                    }
                }
            }
        }
    }

    public void iCancelSelectionOfValueFromTheList(List<String> values, WebElement parentElement) {
        if (!parentElement.getTagName().equals("div")) {
            parentElement = parentElement.findElement(By.tagName("div"));
        }
        List<WebElement> selectLists = parentElement.findElements(By.xpath("./div[contains(@class,'selected')]"));
        for (String value : values) {
            if (value != null && value.trim().length() != 0) {
                for (WebElement e : selectLists) {
                    ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", e);
                    if (e.getAttribute("class").contains("selected")) {
                        if (e.getAttribute("style").contains("display: none;")) {
                            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", e);
                            if (value.equalsIgnoreCase(e.getText()) || value.equals("all")) {
                                e.click();
                            }
                        } else {
                            if (value.equalsIgnoreCase(e.getText()) || value.equals("all")) {
                                e.click();
                            }
                        }
                    }
                }
            }
        }
        if (parentElement.isDisplayed()) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='none';", parentElement);
            ExpectedCondition expectedCondition = ExpectedConditions.invisibilityOf(parentElement);
            WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        }
    }
}