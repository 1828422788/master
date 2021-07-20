package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;

import javax.annotation.Nullable;

/**
 * 对浏览器原生控件的操作
 *
 * @author sunxj
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
     * chrome浏览器弹框确定
     */
    @And("^I accept alert window$")
    public void acceptAlertWindow() {
        webDriver.switchTo().alert().accept();
    }

    /**
     * 切换到另一个名称为titleName的标签页
     *
     * @param titleName 标签页名称
     */
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

    /**
     * 等待页面加载完毕
     */
    @Given("^I wait for loading complete$")
    public void waitForLoadingComplete() {
        JavascriptExecutor js = (JavascriptExecutor) webDriver;
        Object readyState = js.executeScript("return document.readyState");
        WebDriverWait webDriverWait = new WebDriverWait(webDriver, 1000);
        webDriverWait.until(webDriver1 -> ifReady(readyState));
    }

    private boolean ifReady(Object readyState) {
        return "complete".equals(readyState);
    }

    /**
     * 关闭除当前打开页签以外的所有页签
     */
    @And("^I close all tabs except main tab$")
    public void closeTabsExceptMainTab() {
        String mainTab = webDriver.getWindowHandle();
        for (String handle : webDriver.getWindowHandles()) {
            if (!handle.equals(mainTab)) {
                webDriver.switchTo().window(handle).close();
            }
        }
        webDriver.switchTo().window(mainTab);
    }

    /**
     * 把屏幕放大到全屏
     */
    @And("^I zoom the browse to full screen$")
    public void zoomBrowsetoFullScreen() {
        webDriver.manage().window().fullscreen();
    }

}
