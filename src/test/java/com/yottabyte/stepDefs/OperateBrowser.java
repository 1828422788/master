package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;

import javax.annotation.Nullable;

/**
 * @author sunxj
 * 操作浏览器
 */
public class OperateBrowser {
    private WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 切换标签页
     */
    @Then("switch to another window")
    public void switchWindow() {
        String handle = webDriver.getWindowHandle();
        for (String handles : webDriver.getWindowHandles()) {
            if (handles.equals(handle))
                continue;
            webDriver.switchTo().window(handles);
        }
    }

    /**
     * 刷新页面
     */
    @And("^I refresh the website$")
    public void refreshWebSite() {
        webDriver.navigate().refresh();
    }

    /**
     * 页面后退
     */
    @And("^I back to before$")
    public void iBackToBefore() {
        webDriver.navigate().back();
    }

    /**
     * chrome浏览器弹框
     */
    @And("^I accept alert window$")
    public void acceptAlertWindow() {
        webDriver.switchTo().alert().accept();
    }

    @And("^switch to window \"([^\"]*)\"$")
    public void switchToWindow(String titleName) {
        String handle = webDriver.getWindowHandle();
        for (String handles : webDriver.getWindowHandles()) {
            if (handles.equals(handle))
                continue;

            webDriver.switchTo().window(handles);
            if (webDriver.getTitle().contains(titleName))
                break;
        }
    }

    @Given("^I wait for loading complete$")
    public void waitForLoadingComplete() {
        JavascriptExecutor js = (JavascriptExecutor) webDriver;
        Object readyState = js.executeScript("return document.readyState");
        System.out.println("complete");
        WebDriverWait webDriverWait = new WebDriverWait(webDriver, 1000);
        webDriverWait.until(new ExpectedCondition<Boolean>() {

            @Nullable
            @Override
            public Boolean apply(@Nullable WebDriver webDriver) {
                return ifReady(readyState);
            }
        });
    }

    private boolean ifReady(Object readyState) {
        return "complete".equals(readyState);
    }
}
