package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import cucumber.api.java.en.And;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;

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

    /**
     * 移动鼠标到某位置
     * @param text 元素包含的text
     */
    @And("^I move the mouse pointer to the text \"([^\"]*)\"$")
    public void iMoveTheMousePointerToTheText(String text){
        String xpath = "//*[contains(text(),'"+ text + "')]";
        WebElement webElement = webDriver.findElement(By.xpath(xpath));
        Actions actions = new Actions(webDriver);
        actions.moveToElement(webElement).perform();
    }
}
