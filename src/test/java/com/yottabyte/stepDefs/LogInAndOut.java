package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.pages.LoginPage;
import cucumber.api.java.en.And;
import org.openqa.selenium.By;
import org.openqa.selenium.Cookie;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.Iterator;
import java.util.Set;

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
        this.deleteCookie();
//        webDriver.manage().deleteAllCookies();
//        try {
//            URL url = new URL(webDriver.getCurrentUrl());
//            String loginUrl = String.format("%s://%s:%s/auth/login/",
//                    url.getProtocol(), url.getHost(), url.getPort() > 0 ? url.getPort() : url.getDefaultPort());
//            webDriver.get(loginUrl);
//        } catch (MalformedURLException e) {
//            e.printStackTrace();
//        }
//
//        String currentUrl = webDriver.getCurrentUrl();
//        while (!currentUrl.contains("/auth/login/")) {
//            webDriver.manage().deleteAllCookies();
//            currentUrl = webDriver.getCurrentUrl();
//        }
    }

    /**
     * 退出当前用户，登录其他用户
     *
     * @param username
     * @param password
     */
    @And("^I login user \"([^\"]*)\" with password \"([^\"]*)\"$")
    public void userLogin(String username, String password) throws InterruptedException {
        webDriver.manage().deleteAllCookies();
        webDriver.navigate().refresh();
        this.deleteCookie();
        int times = 0;
        LoginPage loginPage = new LoginPage(webDriver);
        String baseURL = LoginBeforeAllTests.getBaseURL();
        while (webDriver.getTitle().equals("登录")) {
            loginPage.getUsername().clear();
            loginPage.getUsername().sendKeys(username);
            loginPage.getPassword().clear();
            loginPage.getPassword().sendKeys(password);
            loginPage.getLoginButton().click();
            Thread.sleep(2000);
            webDriver.navigate().to(baseURL + "/dashboard/");
            times++;
            if (times > 10) {
                return;
            }
        }
        // 验证是否登录到正确用户下
        this.validateUser(username, password);
    }

    public void validateUser(String username, String password) throws InterruptedException {
        WaitElement waitElement = new WaitElement();
        waitElement.iWaitForWillBeVisible("userIcon");
        WebElement userIcon = webDriver.findElement(By.xpath("//span[@class='ant-badge']/i"));
        userIcon.click();
        WebElement loginUserName = webDriver.findElement(By.xpath("//div[@class='ant-popover-inner-content']//p"));
        if (!loginUserName.getText().equals(username)) {
            userLogin(username, password);
        }
    }

    private void deleteCookie() {
        Set<Cookie> cookies = webDriver.manage().getCookies();
        Iterator<Cookie> iterator = cookies.iterator();
        while (iterator.hasNext()) {
            if (iterator.next().getName().equals("sessionid")) {
                webDriver.manage().deleteAllCookies();
            }
        }
    }
}
