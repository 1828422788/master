package com.yottabyte.utils;

import com.gargoylesoftware.htmlunit.ElementNotFoundException;
import com.yottabyte.constants.WebDriverConst;
import com.yottabyte.hooks.LoginBeforeAllTests;
import org.openqa.selenium.*;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.FluentWait;

import java.util.concurrent.TimeUnit;

/**
 * 1.根据条件进行智能等待，当满足条件时退出等待
 * 2.智能等待出现alert
 */
public class WaitForElement {
    private static WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    public static void waitForElementWithExpectedCondition(WebDriver driver, ExpectedCondition expectedCondition) {
        FluentWait wait = new FluentWait(driver)
                .withTimeout(WebDriverConst.WAIT_FOR_DOM_READY_TIMEOUT, TimeUnit.MILLISECONDS)
                .pollingEvery(WebDriverConst.WAIT_FOR_ELEMENT_POLLING_DURING, TimeUnit.MILLISECONDS)
                .ignoring(NoSuchElementException.class)
                .ignoring(TimeoutException.class)
                .ignoring(StaleElementReferenceException.class);
        wait.until(expectedCondition);
    }

    public static void waitForAlertPresent(WebDriver driver) {
        FluentWait wait = new FluentWait(driver)
                .withTimeout(WebDriverConst.WAIT_FOR_DOM_READY_TIMEOUT, TimeUnit.MILLISECONDS)
                .pollingEvery(WebDriverConst.WAIT_FOR_ELEMENT_POLLING_DURING, TimeUnit.MILLISECONDS)
                .ignoring(NoSuchElementException.class);
        wait.until(ExpectedConditions.alertIsPresent());
    }

    //TODO 等待时会抛一次异常，后续完善
    public static WebElement waitForElementReload(WebDriver driver, By by) {
        FluentWait wait = new FluentWait(driver)
                .withTimeout(WebDriverConst.WAIT_FOR_DOM_READY_TIMEOUT, TimeUnit.MILLISECONDS)
                .pollingEvery(WebDriverConst.WAIT_FOR_ELEMENT_POLLING_DURING, TimeUnit.MILLISECONDS)
                .ignoring(NoSuchElementException.class);
        WebElement element = driver.findElement(by);
        wait.until(ExpectedConditions.stalenessOf(element));
        wait.until(ExpectedConditions.presenceOfAllElementsLocatedBy(by));
        return driver.findElement(by);
    }

    public static void waitUntilLoadingDisappear() {
        webDriver.manage().timeouts().implicitlyWait(WebDriverConst.WAIT_FOR_ELEMENT_POLLING_DURING, TimeUnit.MILLISECONDS);
            try {
            waitForElementWithExpectedCondition(webDriver, ExpectedConditions.invisibilityOfElementLocated(By.className("yotta-spinner-spin")));
            } catch (Exception e) {
            }
        webDriver.manage().timeouts().implicitlyWait(WebDriverConst.WAIT_FOR_ELEMENT_TIMEOUT, TimeUnit.SECONDS);
    }

    public static void waitElementInvisible(WebElement element) {
        FluentWait<WebDriver> wait = new FluentWait<>(webDriver);
        wait.pollingEvery(WebDriverConst.WAIT_FOR_ELEMENT_POLLING_DURING, TimeUnit.MILLISECONDS);
        wait.withTimeout(WebDriverConst.WAIT_FOR_DOM_READY_TIMEOUT, TimeUnit.MILLISECONDS);
        wait.ignoring(TimeoutException.class);
        try {
            wait.until(ExpectedConditions.invisibilityOf(element));
        } catch (ElementNotFoundException | NoSuchElementException e) {
//            e.printStackTrace();
            return;
        }
    }
}
