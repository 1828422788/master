package com.yottabyte.hooks;

import com.yottabyte.config.ConfigManager;
import com.yottabyte.pages.LoginPage;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.pages.saas.SaasLoginPage;
import com.yottabyte.webDriver.SharedDriver;
import cucumber.api.java.Before;
import org.openqa.selenium.Cookie;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.lang.reflect.Constructor;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class LoginBeforeAllTests {
    private static WebDriver webDriver;
    private static String baseURL;
    private static Object pageFactory;
    private static ConfigManager config;
    private static Cookie cookie;
    private static String loginURL;

    public LoginBeforeAllTests(SharedDriver driver, ConfigManager manager) {
        webDriver = driver;
        config = manager;
        baseURL = "http://" + manager.get("rizhiyi_server_host");
        loginURL = manager.get("login_url");
    }

    @Before
    public void beforeScenario() {
        System.out.println("Login Before Test!");
        webDriver.manage().deleteAllCookies();
        webDriver.get(baseURL + loginURL);
        if (cookie == null) {
            login();
        } else {
            webDriver.get(baseURL);
            Date exDate = cookie.getExpiry();
            if (exDate.before(new Date())) {
                Calendar calendar = new GregorianCalendar();
                calendar.setTime(exDate);
                calendar.add(Calendar.DATE, 7);
                exDate = calendar.getTime();
                cookie = new Cookie(cookie.getName(), cookie.getValue(), cookie.getDomain(), cookie.getPath(), exDate);
            }
            webDriver.manage().addCookie(cookie);
            webDriver.get(baseURL);
        }
        setPageFactory("PublicNavBarPage");
    }

    public static void login() {
        PageTemplate loginPage;
        System.out.println("看这里！！！" + loginURL + loginURL.contains("domainlogin"));
        if (loginURL.contains("domainlogin"))
            loginPage = new SaasLoginPage(webDriver);
        else
            loginPage = new LoginPage(webDriver);

        loginPage.getUsername().clear();
        String username = config.get("username");
        loginPage.getUsername().sendKeys(username);
        loginPage.getPassword().clear();
        loginPage.getPassword().sendKeys(config.get("password"));
        loginPage.getLoginButton().click();

        WebDriverWait wait = new WebDriverWait(webDriver, 10, 1000);
        wait.until(new ExpectedCondition<Boolean>() {
            @Override
            public Boolean apply(WebDriver driver) {
                while (driver.manage().getCookieNamed("sessionid") == null) {
                    return false;
                }
                return true;
            }
        });
        cookie = webDriver.manage().getCookieNamed("sessionid");
    }

    public static WebDriver getWebDriver() {
        return webDriver;
    }

    public static void setWebDriver(WebDriver webDriver) {
        LoginBeforeAllTests.webDriver = webDriver;
    }

    public static Cookie getCookie() {
        return cookie;
    }

    public static String getBaseURL() {
        return baseURL;
    }

    public static Object getPageFactory() {
        return pageFactory;
    }

    public static void setPageFactory(Object pageFactory) {
        LoginBeforeAllTests.pageFactory = pageFactory;
    }

    public static void setPageFactory(String pageFactoryName) {
        if (!pageFactoryName.startsWith("com.yottabyte.pages.")) {
            pageFactoryName = "com.yottabyte.pages." + pageFactoryName;
        }
        Constructor c;
        try {
            c = Class.forName(pageFactoryName).getDeclaredConstructor(WebDriver.class);
            c.setAccessible(true);
            pageFactory = c.newInstance(webDriver);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ConfigManager getConfig() {
        return config;
    }
}
