package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.openqa.selenium.WebDriver;

/**
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
}
