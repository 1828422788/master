package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.WaitForElement;
import cucumber.api.java.en.And;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.net.MalformedURLException;
import java.net.URL;

/**
 * 退出登录
 */
public class LogOut {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 登出当前用户
     */
    @And("^I logout current user$")
    public void iLogoutCurrentUser() {
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        webDriver.manage().deleteAllCookies();

        try {
            URL url = new URL(webDriver.getCurrentUrl());
            String loginUrl =String.format("%s://%s:%s/auth/login/",
                    url.getProtocol(), url.getHost(), url.getPort() > 0 ? url.getPort() : url.getDefaultPort());
            webDriver.get(loginUrl);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }

        String currentUrl = webDriver.getCurrentUrl();
        while (!currentUrl.contains("/auth/login/")) {
            webDriver.manage().deleteAllCookies();
        }
    }
}
