package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.pages.LoginPage;
import cucumber.api.java.en.And;
import org.openqa.selenium.WebDriver;

import java.net.MalformedURLException;
import java.net.URL;

/**
 * @author sunxj
 */
public class LogInAndOut {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 登出当前用户
     * author wangyueming
     */
    @And("^I logout current user$")
    public void logout() {
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        webDriver.manage().deleteAllCookies();

        try {
            URL url = new URL(webDriver.getCurrentUrl());
            String loginUrl = String.format("%s://%s:%s/auth/login/",
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

    /**
     * 退出当前用户，登录其他用户
     *
     * @param username
     * @param password
     */
    @And("^I login user \"([^\"]*)\" with password \"([^\"]*)\"$")
    public void userLogin(String username, String password) {
        this.logout();
        webDriver.navigate().refresh();
        LoginPage loginPage = new LoginPage(webDriver);
        loginPage.getUsername().clear();
        loginPage.getUsername().sendKeys(username);
        loginPage.getPassword().clear();
        loginPage.getPassword().sendKeys(password);
        loginPage.getLoginButton().click();
        System.out.println();
    }
}
