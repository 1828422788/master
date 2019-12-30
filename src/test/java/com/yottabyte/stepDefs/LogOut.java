package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.WaitForElement;
import cucumber.api.java.en.And;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;

public class LogOut {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    @And("^I logout current user$")
    public void iLogoutCurrentUser() {
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        webDriver.manage().deleteAllCookies();
        webDriver.navigate().refresh();
        String currentUrl = webDriver.getCurrentUrl();
        while (!currentUrl.contains("/auth/login/")) {
            webDriver.manage().deleteAllCookies();
        }
    }
}
