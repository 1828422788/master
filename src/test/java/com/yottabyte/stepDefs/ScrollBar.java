package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

/**
 * @author sunxj
 */
public class ScrollBar {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    @And("^I drag the scroll bar to the top$")
    public void dragTheScrollBarToTheElement() throws InterruptedException {
        ((JavascriptExecutor) webDriver).executeScript("scrollTo(0,1)");
        Thread.sleep(2000);
    }


    @And("^I drag the scroll bar to the end$")
    public void iDragTheScrollBarToTheEnd() {
        ((JavascriptExecutor) webDriver).executeScript("window.scrollTo(0, document.body.scrollHeight)");
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @And("^I drag the scroll bar to the element \"([^\"]*)\"$")
    public void iDragTheScrollBarToTheElement(String elementName) {
        WebElement webElement = GetElementFromPage.getWebElementWithName(elementName);
        ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView(false);", webElement);
    }
}
