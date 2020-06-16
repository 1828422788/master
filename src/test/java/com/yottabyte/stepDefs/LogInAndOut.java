package com.yottabyte.stepDefs;

import com.yottabyte.config.ConfigManager;
import com.yottabyte.hooks.LoginBeforeAllTests;
import cucumber.api.java.en.And;
import org.apache.commons.codec.digest.DigestUtils;
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
    public void iLogoutCurrentUser() {
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
     * 登录用户，根据MD5加密进行URL登录
     *
     * @param username
     * @param password
     */
    @And("^I login user \"([^\"]*)\" with password \"([^\"]*)\"$")
    public void userLogin(String username, String password) {
        String passwordMD5 = DigestUtils.md5Hex(password);
        String finalMD5 = DigestUtils.md5Hex(username + passwordMD5);
        ConfigManager manager = new ConfigManager();
        String url = "http://"+manager.get("rizhiyi_server_host") + "/dashboard/login/" + username + "/" + passwordMD5 + "/" + finalMD5 + "/";
        System.out.println(url);
        webDriver.get(url);
    }
}
