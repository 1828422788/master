package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import cucumber.api.java.en.And;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;

/**
 * @author sunxj
 */
public class ScrollBar {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    @And("^I drag the scroll bar to the top$")
    public void dragToTop() throws InterruptedException {
        ((JavascriptExecutor) webDriver).executeScript("scrollTo(0,1)");
        Thread.sleep(2000);
    }


    @And("^I drag the scroll bar to the end$")
    public void dragToEnd() {
        ((JavascriptExecutor) webDriver).executeScript("window.scrollTo(0, document.body.scrollHeight)");
        try {
            Thread.sleep(2000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @And("^I drag the scroll bar to the element \"([^\"]*)\"$")
    public void dragToElement(String elementName) {
        WebElement webElement = GetElementFromPage.getWebElementWithName(elementName);
        ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView(false);", webElement);
    }

    @And("^I drag the element \"([^\"]*)\" to the \"([^\"]*)\"$")
    public void dragElement(String source, String target) {
        WebElement element = webDriver.findElement(By.className("yw-drag-icon"));
        WebElement sourceElement = GetElementFromPage.getWebElementWithName(source);
        WebElement targetElement = GetElementFromPage.getWebElementWithName(target);
        Actions actions = (new Actions(webDriver));

        sourceElement.click();
        actions.dragAndDrop(element, targetElement).perform();
        actions.release();

        System.out.println();
    }
}
