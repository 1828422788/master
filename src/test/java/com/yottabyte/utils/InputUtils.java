package com.yottabyte.utils;

import com.yottabyte.hooks.LoginBeforeAllTests;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

/**
 * @author sunxj
 */
public class InputUtils {
    private static WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    public static WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[text()='" + name + "']/following-sibling::input"));
    }
}
