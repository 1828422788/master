package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import cucumber.api.java.en.And;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.remote.RemoteWebDriver;

public class FieldExtraction {
    private WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 移动鼠标到某位置
     * @param elementName 元素名称
     */
    @And("^I move the mouse pointer to the \"([^\"]*)\"$")
    public void moveCursor(String elementName){
        WebElement webElement = GetElementFromPage.getWebElementWithName(elementName);
        Actions actions = new Actions(webDriver);
        actions.moveToElement(webElement).perform();
    }
}
