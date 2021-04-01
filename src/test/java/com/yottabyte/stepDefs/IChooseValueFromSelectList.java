package com.yottabyte.stepDefs;

import com.yottabyte.config.ConfigManager;
import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import com.yottabyte.utils.WaitForElement;
import com.yottabyte.utils.ElementExist;
import com.yottabyte.webDriver.SharedDriver;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
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
    public void iChooseTheFromTheWithProperty(String propertyName, String selectListName) {
        ConfigManager manager = new ConfigManager();
        List<String> list = new ArrayList<>();
        list.add(manager.get(propertyName));
        this.iChooseTheFromThe(list, selectListName);
    }

    /**
     * 选择下拉框内容
     *
     * @param values         想要选择的内容，支持list
     * @param selectListName 下拉框元素名称
     */
    @And("^I choose the \"([^\"]*)\" from the \"([^\"]*)\"$")
    public void iChooseTheFromThe(List<String> values, String selectListName) {
        if (values.size() == 0) {
            return;
        }
        Object o = GetElementFromPage.getWebElementWithName(selectListName);
        if (o != null) {
            if (o instanceof List) {
                List fatherSelectList = (List) o;
                iChooseTheFromThe(values, fatherSelectList);
            } else {
                WebElement element = (WebElement) o;
                iChooseTheFromThe(values, element);
            }
        }
    }

    public void iChooseTheFromThe2(List<String> values, WebElement parentElement) {
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

    /**
     * 选择下拉框内容
     *
     * @param values         想要选择的内容，支持list
     * @param selectListName 下拉框元素名称
     */
    @And("^I choose2 the \"([^\"]*)\" from the \"([^\"]*)\"$")
    public void iChooseTheFromThe2(List<String> values, String selectListName) {
        if (values.size() == 0) {
            return;
        }
        Object o = GetElementFromPage.getWebElementWithName(selectListName);
        if (o != null) {
            if (o instanceof List) {
                List fatherSelectList = (List) o;
                iChooseTheFromThe(values, fatherSelectList);
            } else {
                WebElement element = (WebElement) o;
                iChooseTheFromThe2(values, element);
            }
        }
    }

    @And("^I choose the \"([^\"]*)\" from the \"([^\"]*)\" in agent$")
    public void iChooseTheFromTheAgent(List<String> values, String selectListName) {
        if (values.size() == 0) {
            return;
        }
        Object o = GetElementFromPage.getWebElementWithName(selectListName);
        if (o != null) {
            if (o instanceof List) {
                List fatherSelectList = (List) o;
                iChooseTheFromThe(values, fatherSelectList);
            } else {
                WebElement element = (WebElement) o;
                iChooseTheFromTheAgent(values, element);
            }
        }
    }


    @And("^I choose the \"([^\"]*)\" from the \"([^\"]*)\" in page$")
    public void iChooseTheFromTheEvent(List<String> values, String selectListName) {
        if (values.size() == 0) {
            return;
        }
        Object o = GetElementFromPage.getWebElementWithName(selectListName);
        if (o != null) {
            if (o instanceof List) {
                List fatherSelectList = (List) o;
                iChooseTheFromThe(values, fatherSelectList);
            } else {
                WebElement element = (WebElement) o;
                iChooseTheFromTheEvent(values, element);
            }
        }
    }



    public void iChooseTheFromThe(List<String> values, List<WebElement> elements) {
        if (values.size() == 1) {
            String value = values.get(0);
            if (value != null && value.trim().length() != 0) {
                String attribute = elements.get(0).findElement(By.xpath("./parent::ul")).getAttribute("class");
                WebElement parentElement = null;
                if (attribute.contains("el-dropdown-menu"))
                    parentElement = elements.get(0).findElement(By.xpath("./parent::ul[contains(@class,'el-dropdown-menu')]"));
                else if (attribute.contains("el-select-dropdown__list"))
                    parentElement = elements.get(0).findElement(By.xpath("./parent::ul[contains(@class,'el-select-dropdown__list')]"));
                if (parentElement.getAttribute("style").contains("display: none;")) {
                    ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", parentElement);
                }
                for (WebElement e : elements) {
                    ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", e);
                    if (value.equalsIgnoreCase(e.getText())) {
                        e.click();
                        break;
                    }
                }
                try {
                    if (parentElement.isDisplayed()) {
                        ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='none';", parentElement);
                        ExpectedCondition expectedCondition = ExpectedConditions.invisibilityOf(parentElement);
                        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
                    }
                } catch (StaleElementReferenceException e) {
                    System.out.println(e.getMessage());
                }
            }
        } else {
            for (String s : values) {
                for (WebElement e : elements) {
                    if (s.equalsIgnoreCase(e.getText())) {
                        ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", e);
                        e.click();
                    }
                }
            }
//            String attribute = elements.get(0).findElement(By.xpath("./parent::ul")).getAttribute("class");
            String attribute = elements.get(elements.size() - 1).findElement(By.xpath("./parent::ul")).getAttribute("class");
            WebElement e = null;
            if (attribute.contains("el-dropdown-menu"))
                e = elements.get(0).findElement(By.xpath("./parent::ul[contains(@class,'el-dropdown-menu')]"));
            else if (attribute.contains("el-select-dropdown__list"))
//                e = elements.get(0).findElement(By.xpath("./parent::ul[contains(@class,'el-select-dropdown__list')]"));
                e = elements.get(elements.size() - 1).findElement(By.xpath("./parent::ul[contains(@class,'el-select-dropdown__list')]"));

            if (e.isDisplayed()) {
                ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='none';", e);
                ExpectedCondition expectedCondition = ExpectedConditions.invisibilityOf(e);
                WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
            }
        }
    }

//    3.6 版本方式
//    public void iChooseTheFromThe(List<String> values, WebElement parentElement) {
//
//        if (parentElement.getAttribute("class").contains("ant-select-dropdown-menu-root")) {
//            ((JavascriptExecutor) webDriver).executeScript("arguments[0].parentNode.parentNode.style.display='block';", parentElement);
//        }
//        List<WebElement> elements = parentElement.findElements(By.tagName("li"));
//        for (String value : values) {
//            if (value != null && value.trim().length() != 0) {
//                for (WebElement e : elements) {
//                    ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", e);
//                    if (value.equals(e.getText())) {
//                        e.click();
//                        break;
//                    }
//                }
//            }
//        }
//        if (parentElement.getAttribute("class").contains("ant-select-dropdown-menu-root")) {
//            ((JavascriptExecutor) webDriver).executeScript("arguments[0].parentNode.parentNode.style.display='none';", parentElement);
//        }
////        try {
////            if (parentElement.isDisplayed()) {
////                ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='none';", parentElement);
////                ExpectedCondition expectedCondition = ExpectedConditions.invisibilityOf(parentElement);
////                WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
////            }
////        } catch (Exception e) {
//////            return;
////        }
//    }

    public void iChooseTheFromThe(List<String> values, WebElement parentElement) {
        List<WebElement> elements = parentElement.findElements(By.xpath(".//span"));
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
//        System.out.println(parentElement);
//        if (ElementExist.isElementExist(webDriver, parentElement) && values.size() > 1) {
//            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='none';", parentElement);
//        }
    }

    /**
     * 选择下拉框内容
     *
     * @param values         想要选择的内容，支持list
     * @param selectListName 下拉框元素名称
     */
    @And("^I choose the \"([^\"]*)\" from the \"([^\"]*)\" in report$")
    public void iChooseTheFromTheInReport(List<String> values, String selectListName) {
        if (values.size() == 0) {
            return;
        }
        Object o = GetElementFromPage.getWebElementWithName(selectListName);
        if (o != null) {
            if (o instanceof List) {
                List fatherSelectList = (List) o;
                iChooseTheFromThe(values, fatherSelectList);
            } else {
                WebElement element = (WebElement) o;
                iChooseTheFromTheInReport(values, element);
            }
        }
    }
    public void iChooseTheFromTheInReport(List<String> values, WebElement parentElement) {
        List<WebElement> elements = webDriver.findElements(By.xpath("//li"));
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
//        System.out.println(parentElement);
//        if (ElementExist.isElementExist(webDriver, parentElement) && values.size() > 1) {
//            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='none';", parentElement);
//        }
    }

    public void iChooseTheFromTheAgent(List<String> values, WebElement parentElement) {

        if (parentElement.getAttribute("class").contains("ant-select-dropdown-menu-root")) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].parentNode.parentNode.style.display='block';", parentElement);
        }
        List<WebElement> elements = parentElement.findElements(By.tagName("li"));
        for (String value : values) {
            if (value != null && value.trim().length() != 0) {
                for (WebElement e : elements) {
                    ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", e);
                    if (value.equals(e.getText())) {
                        e.click();
                        break;
                    }
                }
            }
        }
    }

    public void iChooseTheFromTheEvent(List<String> values, WebElement parentElement) {

        if (parentElement.getAttribute("class").contains("ant-select-dropdown-menu-root")) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].parentNode.parentNode.style.display='block';", parentElement);
        }
        List<WebElement> elements = parentElement.findElements(By.tagName("span"));
        for (String value : values) {
            if (value != null && value.trim().length() != 0) {
                for (WebElement e : elements) {
                    ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", e);
                    if (value.equals(e.getText())) {
                        e.click();
                        break;
                    }
                }
            }
        }
    }

    /**
     * 取消下拉框的选择
     *
     * @param values         待取消的内容
     * @param selectListName 下拉框元素名称
     */
    @And("^I cancel selection \"([^\"]*)\" from the \"([^\"]*)\"$")
    public void iCancelSelectionFromThe(List<String> values, String selectListName) {
        WebElement parentElement = GetElementFromPage.getWebElementWithName(selectListName);
        iCancelSelectionFromThe(values, parentElement);
    }

    /**
     * 根据配置文件取消下拉框的选择
     *
     * @param propertyName   配置文件中的key
     * @param selectListName 下拉框元素名称
     */
    @And("^I cancel selection \"([^\"]*)\" from the \"([^\"]*)\" with property$")
    public void cancelSelectionWithProperty(String propertyName, String selectListName) {
        WebElement parentElement = GetElementFromPage.getWebElementWithName(selectListName);
        ConfigManager configManager = new ConfigManager();
        List<String> list = new ArrayList<>();
        list.add(configManager.get(propertyName));
        iCancelSelectionFromThe(list, parentElement);
    }

    public void iCancelSelectionFromThe(List<String> values, WebElement parentElement) {
        if (!parentElement.getTagName().equals("ul")) {
            parentElement = parentElement.findElement(By.tagName("ul"));
        }
        List<WebElement> selectLists = parentElement.findElements(By.xpath("./li[contains(@class,'selected')]"));
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

    @And("^I cancel all selections from the element \"([^\"]*)\" except value \"([^\"]*)\"$")
    public void iCancelAllSelectionExcept(WebElement parentElement, List<String> values) {
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

//    3.6 版本方式
//    /**
//     * 字段提取下拉框失去焦点
//     *
//     * @param values         想要选择的内容，支持list
//     * @param selectListName 下拉框元素名称
//     */
//    @And("^I choose the \"([^\"]*)\" from the \"([^\"]*)\" in config$")
//    public void iChooseTheFromTheInConfig(List<String> values, String selectListName) {
//        if (values.size() == 0) {
//            return;
//        }
//        Object o = GetElementFromPage.getWebElementWithName(selectListName);
//        if (o != null) {
//            if (o instanceof List) {
//                List fatherSelectList = (List) o;
//                iChooseTheFromThe(values, fatherSelectList);
//            } else {
//                WebElement element = (WebElement) o;
//                if (element.getAttribute("class").contains("ant-select-dropdown-menu-root")) {
//                    ((JavascriptExecutor) webDriver).executeScript("arguments[0].parentNode.parentNode.style.display='block';", element);
//                }
//                iChooseTheFromTheYotta(values, element);
//                if (element.getAttribute("class").contains("ant-select-dropdown-menu-root")) {
//                    ((JavascriptExecutor) webDriver).executeScript("arguments[0].parentNode.parentNode.style.display='none';", element);
//                }
//            }
//        }
//    }

    /**
     * 字段提取下拉框失去焦点
     *
     * @param values         想要选择的内容，支持list
     * @param selectListName 下拉框元素名称
     */
    @And("^I choose the \"([^\"]*)\" from the \"([^\"]*)\" in config$")
    public void iChooseTheFromTheInConfig(List<String> values, String selectListName) {
        if (values.size() == 0) {
            return;
        }
        Object o = GetElementFromPage.getWebElementWithName(selectListName);
        if (o != null) {
            if (o instanceof List) {
                List fatherSelectList = (List) o;
                iChooseTheFromThe(values, fatherSelectList);
            } else {
                WebElement element = (WebElement) o;
                iChooseTheFromThe(values, element);
            }
        }
    }

    /**
     * 字段提取下拉框失去焦点
     *
     * @param values         待取消的内容
     * @param selectListName 下拉框元素名称
     */
    @And("^I cancel selection \"([^\"]*)\" from the \"([^\"]*)\" in config$")
    public void iCancelSelectionFromTheInConfig(List<String> values, String selectListName) {
        WebElement element = GetElementFromPage.getWebElementWithName(selectListName);
        if (element.getAttribute("class").contains("ant-select-dropdown-menu-root")) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].parentNode.parentNode.style.display='block';", element);
        }
        iCancelSelectionFromThe(values, element);
        if (element.getAttribute("class").contains("ant-select-dropdown-menu-root")) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].parentNode.parentNode.style.display='none';", element);
        }
    }


//    public static void main(String args[]) throws InterruptedException {
//        SharedDriver driver = new SharedDriver();
//        ConfigManager c = new ConfigManager();
//        LoginBeforeAllTests login = new LoginBeforeAllTests(driver, c);
//        login.beforeScenario();Thread.sleep(10000);
////
//                driver.get("http://alltest.rizhiyi.com/account/usergroups/1/");
//        driver.findElements(By.className("el-input__inner")).get(2).click();
//        WebElement e = driver.findElement(By.className("el-select-dropdown__list"));
//        List list = new ArrayList<>();
//        list.add("admin");
//        list.add("sunxc");
//        new IChooseValueFromSelectList().iCancelAllSelectionExcept(e, list);
//
//        System.out.println("done");
//    }

    @And("^I choose1 the \"([^\"]*)\" from the \"([^\"]*)\" in config$")
    public void iChooseTheFromTheInConfig1(List<String> values, String selectListName) {
        if (values.size() == 0) {
            return;
        }
        Object o = GetElementFromPage.getWebElementWithName(selectListName);
        if (o != null) {
            WebElement element = (WebElement) o;
            iChooseTheFromThe1(values, element);
        }
    }



    @And("^I choose1 the \"([^\"]*)\" from the \"([^\"]*)\"$")
    public void iChooseTheFromThe1(List<String> values, String selectListName) {
        Object o = GetElementFromPage.getWebElementWithName(selectListName);
        WebElement element = (WebElement) o;
        iChooseTheFromThe1(values, element);
    }

    public void iChooseTheFromThe1(List<String> values, WebElement parentElement) {
        List<WebElement> elements = parentElement.findElements(By.xpath("//span"));
        for (String value : values) {
            if (value != null && value.trim().length() != 0) {
                for (WebElement e : elements) {
                    ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", e);
                    String curText = e.getText();
                    if (value.equals(curText)) {
                            e.click();
                            break;
                    }
                }
            }

        }
    }

    @And("^I choose3 the \"([^\"]*)\" from the \"([^\"]*)\"$")
    public void iChooseTheFromThe3(List<String> values, String selectListName) {
        if (values.size() == 0) {
            return;
        }
        Object o = GetElementFromPage.getWebElementWithName(selectListName);
        if (o != null) {
            if (o instanceof List) {
                List fatherSelectList = (List) o;
                iChooseTheFromThe(values, fatherSelectList);
            } else {
                WebElement element = (WebElement) o;
                iChooseTheFromThe3(values, element);
            }
        }
    }

    public void iChooseTheFromThe3(List<String> values, WebElement parentElement) {
        List<WebElement> elements = parentElement.findElements(By.xpath("//span"));
        for (String value : values) {
            if (value != null && value.trim().length() != 0) {
                for (WebElement e : elements) {
                    ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", e);
                    String curElementText = e.getText();
                    if (curElementText.contains(value)) {
                            e.click();
                            break;
                    }
                }
            }
        }
    }


}
