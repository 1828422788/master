//package com.yottabyte.hooks;
//
//import com.yottabyte.config.ConfigManager;
//import com.yottabyte.pages.LoginPage;
//import com.yottabyte.pages.PageTemplate;
//import com.yottabyte.pages.manager.ManagerLoginPage;
//import com.yottabyte.pages.saas.SaasLoginPage;
//import com.yottabyte.webDriver.SharedDriver;
//import cucumber.api.java.After;
//import cucumber.api.java.Before;
//import org.openqa.selenium.Cookie;
//import org.openqa.selenium.WebDriver;
//import org.openqa.selenium.support.ui.ExpectedCondition;
//import org.openqa.selenium.support.ui.WebDriverWait;
//
//import java.lang.reflect.Constructor;
//import java.net.MalformedURLException;
//import java.net.URL;
//import java.util.Calendar;
//import java.util.Date;
//import java.util.GregorianCalendar;
//
//public class LoginBeforeAllTests {
//    private static WebDriver webDriver;
//    private static String baseURL;
//    private static Object pageFactory;
//    private static ConfigManager config;
//    private static Cookie cookie;
//    private static String loginURL;
//
//    public LoginBeforeAllTests(SharedDriver driver, ConfigManager manager) {
//        webDriver = driver;
//        config = manager;
//        baseURL = "http://" + manager.get("rizhiyi_server_host");
//        loginURL = manager.get("login_url");
//    }
//
//    @Before
//    public void beforeScenario() {
//        if (!isValidCookie(cookie, webDriver)) {
//            System.out.println("Login Before Test!");
//            webDriver.manage().deleteAllCookies();
//            String url = baseURL + loginURL;
//            webDriver.get(url);
//            login();
//            setPageFactory("PublicNavBarPage");
//        }
//    }
//
//    @After("@logout")
//    public void logoutAfterScenario() {
//        webDriver.manage().deleteAllCookies();
//    }
//
//    public static void login() {
//        PageTemplate loginPage;
//        String username;
//        String password;
//        String cookieName;
//        if (loginURL.contains("domainlogin")) {
//            loginPage = new SaasLoginPage(webDriver);
//            username = config.get("saas_username");
//            password = config.get("saas_password");
//            cookieName = "sessionid";
//        } else if (loginURL.contains("8180")) {
//            loginPage = new ManagerLoginPage(webDriver);
//            username = config.get("manager_name");
//            password = config.get("manager_password");
//            cookieName = "rizhiyimanagersessionID";
//        } else {
//            loginPage = new LoginPage(webDriver);
//            username = config.get("username");
//            password = config.get("password");
//            cookieName = "sessionid";
//        }
//        loginPage.getUsername().clear();
//        loginPage.getUsername().sendKeys(username);
//        loginPage.getPassword().clear();
//        loginPage.getPassword().sendKeys(password);
//        loginPage.getLoginButton().click();
//
//        WebDriverWait wait = new WebDriverWait(webDriver, 10, 1000);
//        wait.until(new ExpectedCondition<Boolean>() {
//            @Override
//            public Boolean apply(WebDriver driver) {
//                while (driver.manage().getCookieNamed(cookieName) == null) {
//                    return false;
//                }
//                return true;
//            }
//        });
//        cookie = webDriver.manage().getCookieNamed(cookieName);
//    }
//
//    public static WebDriver getWebDriver() {
//        return webDriver;
//    }
//
//    public static void setWebDriver(WebDriver webDriver) {
//        LoginBeforeAllTests.webDriver = webDriver;
//    }
//
//    public static Cookie getCookie() {
//        return cookie;
//    }
//
//    public static String getBaseURL() {
//        return baseURL;
//    }
//
//    public static Object getPageFactory() {
//        return pageFactory;
//    }
//
//    public static void setPageFactory(Object pageFactory) {
//        LoginBeforeAllTests.pageFactory = pageFactory;
//    }
//
//    public static void setPageFactory(String pageFactoryName) {
//        if (!pageFactoryName.startsWith("com.yottabyte.pages.")) {
//            pageFactoryName = "com.yottabyte.pages." + pageFactoryName;
//        }
//        Constructor c;
//        try {
//            c = Class.forName(pageFactoryName).getDeclaredConstructor(WebDriver.class);
//            c.setAccessible(true);
//            pageFactory = c.newInstance(webDriver);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    public static ConfigManager getConfig() {
//        return config;
//    }
//
//    private static boolean isValidCookie(Cookie cookie, WebDriver webDriver) {
//        try {
//            String url = new URL(webDriver.getCurrentUrl()).getHost();
//            if (url != baseURL) {
//                webDriver.get(baseURL);
//            }
//        } catch (MalformedURLException e) {
//            e.printStackTrace();
//        }
//        if (cookie == null) {
//            return false;
//        }
//        Cookie webCookie = webDriver.manage().getCookieNamed(cookie.getName());
//        return cookie.equals(webCookie) && new Date().before(webCookie.getExpiry());
//    }
//}
package com.yottabyte.hooks;

import com.yottabyte.config.ConfigManager;
import com.yottabyte.pages.LoginPage;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.pages.manager.ManagerLoginPage;
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
        String url = baseURL+loginURL;
        webDriver.get(url);
        if (cookie == null) {
            login();
        } else {
            webDriver.get(url);
            Date exDate = cookie.getExpiry();
            if (exDate.before(new Date())) {
                Calendar calendar = new GregorianCalendar();
                calendar.setTime(exDate);
                calendar.add(Calendar.DATE, 7);
                exDate = calendar.getTime();
                cookie = new Cookie(cookie.getName(), cookie.getValue(), cookie.getDomain(), cookie.getPath(), exDate);
            }
            webDriver.manage().addCookie(cookie);
            webDriver.get(url);
        }
        setPageFactory("PublicNavBarPage");
    }

    public static void login() {
        PageTemplate loginPage;
        String username;
        String password;
        String cookieName;
        if (loginURL.contains("domainlogin")) {
            loginPage = new SaasLoginPage(webDriver);
            username = config.get("saas_username");
            password = config.get("saas_password");
            cookieName = "sessionid";
        } else if (loginURL.contains("8180")) {
            loginPage = new ManagerLoginPage(webDriver);
            username = config.get("manager_name");
            password = config.get("manager_password");
            cookieName = "rizhiyimanagersessionID";
        } else {
            loginPage = new LoginPage(webDriver);
            username = config.get("username");
            password = config.get("password");
            cookieName = "sessionid";
        }
        loginPage.getUsername().clear();
        loginPage.getUsername().sendKeys(username);
        loginPage.getPassword().clear();
        loginPage.getPassword().sendKeys(password);
        loginPage.getLoginButton().click();

        WebDriverWait wait = new WebDriverWait(webDriver, 10, 1000);
        wait.until(new ExpectedCondition<Boolean>() {
            @Override
            public Boolean apply(WebDriver driver) {
                while (driver.manage().getCookieNamed(cookieName) == null) {
                    return false;
                }
                return true;
            }
        });
        cookie = webDriver.manage().getCookieNamed(cookieName);
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
