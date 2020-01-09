package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import com.yottabyte.utils.WaitForElement;
import cucumber.api.java.en.And;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;

/**
 * 修改元素属性
 */
public class AlterElementAttribute {
    private WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 隐藏元素
     *
     * @param elementName 元素名称
     */
    @And("^I hide the element \"([^\"]*)\"$")
    public void hideElement(String elementName) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        hideElement(element);
    }

    private void hideElement(WebElement element) {
        if (element.isDisplayed()) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='none';", element);
            ExpectedCondition expectedCondition = ExpectedConditions.invisibilityOf(element);
            WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        }
    }

    /**
     * 显示元素
     *
     * @param elementName 元素名称
     */
    @And("^I make the element \"([^\"]*)\" visible$")
    public void showElement(String elementName) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        if (!element.isDisplayed()) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", element);
            ExpectedCondition expectedCondition = ExpectedConditions.invisibilityOf(element);
            WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        }
    }

    /**
     * 修改元素的class属性为其他值
     *
     * @param elementName 元素名称
     * @param className   要修改的属性值
     */
    @And("^I alter the element \"([^\"]*)\" class to \"([^\"]*)\"$")
    public void alterElementClass(String elementName, String className) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        while (!element.getAttribute("class").equals(className)) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].setAttribute('class','" + className + "')", element);
        }
    }

    /**
     * 修改元素的style属性为其他值
     *
     * @param elementName 元素名称
     * @param style       要修改的style值
     */
    @And("^I alter the element \"([^\"]*)\" style to \"([^\"]*)\"$")
    public void alterElementStyle(String elementName, String style) {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        this.changeStyle(style, element);
    }

    /**
     * app编辑时显示菜单栏的隐藏按钮
     *
     * @param style
     * @param name
     */
    @And("^I change the style to \"([^\"]*)\" which name is \"([^\"]*)\"$")
    public void appChangeStyleWithName(String style, String name) {
        WebElement element = webDriver.findElement(By.xpath("(//span[text()='" + name + "']/following-sibling::span[@class='item-title-edit-group group-title-edit'])[1]"));
        this.changeStyle(style, element);
    }

    private void changeStyle(String style, WebElement element) {
        ((JavascriptExecutor) webDriver).executeScript("arguments[0].setAttribute('style','" + style + "')", element);
    }

    /**
     * 让元素失去焦点
     *
     * @param elementName 需要失去焦点的元素名称
     */
    @And("^I let element \"([^\"]*)\" lose focus$")
    public void iLetElementLoseFocus(String elementName) {
        WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        ((JavascriptExecutor) webDriver).executeScript("arguments[0].blur();", element);
    }
}
