package com.yottabyte.utils;

import com.yottabyte.hooks.LoginBeforeAllTests;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

/**
 * @author sunxj
 */
public class ClickEvent {
    private static WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    public static void clickUnderneathButton(WebElement element) {
        ((JavascriptExecutor) webDriver).executeScript("arguments[0].click()", element);
    }
}
