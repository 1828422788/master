package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import cucumber.api.java.en.And;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;

/**
 * @author sunxj
 */
public class ScrollBar {
    @And("^I drag the scroll bar to the top$")
    public void dragTheScrollBarToTheElement() throws InterruptedException {
        WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
        ((JavascriptExecutor) webDriver).executeScript("scrollTo(0,1)");
        Thread.sleep(2000);
    }
}
