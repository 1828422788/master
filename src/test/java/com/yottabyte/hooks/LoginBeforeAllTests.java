package com.yottabyte.hooks;

import com.yottabyte.config.ConfigManager;
import com.yottabyte.pages.LoginPage;
import com.yottabyte.pages.EditorPage;
import com.yottabyte.pages.manager.ManagerLoginPage;
import com.yottabyte.pages.saas.SaasLoginPage;
import com.yottabyte.stepDefs.LogInAndOut;
import com.yottabyte.webDriver.SharedDriver;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import org.openqa.selenium.Cookie;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.lang.reflect.Constructor;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;

public class LoginBeforeAllTests {
    private static WebDriver webDriver;
    private static String baseURL;
    private static Object pageFactory;
    private static ConfigManager config;
    private static Cookie cookie;
    private static String loginURL;

    public LoginBeforeAllTests(SharedDriver driver, ConfigManager manager) {
        System.out.println("chsfinduml==============================================[2]入口");
        webDriver = driver;
        config = manager;
        baseURL = "http://" + manager.get("rizhiyi_server_host");
        loginURL = manager.get("login_url");
    }

    @Before
    public void beforeScenario() {
        System.out.println("chsfinduml==============================================[3]public void beforeScenario()");
        if (isValidCookie()) {
            return;
        }
        System.out.println("Login Before Test!");
        LogInAndOut logInAndOut = new LogInAndOut();
        logInAndOut.logout();
//        deleteAllCookies();
        webDriver.get(baseURL + loginURL);
        webDriver.manage().window().setSize(new Dimension(1920,1080));
        System.out.println("chsfinduml==============================================[4pre]beforeScenario");
        login();
        setPageFactory("PublicNavBarPage");
    }

    @After("@logout")
    public void logoutAfterScenario() {
        deleteAllCookies();
    }

    public static void login() {
        System.out.println("chsfinduml==============================================[4]");
        EditorPage loginPage;
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
        wait.until(driver -> driver.manage().getCookieNamed(cookieName) != null);
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
        System.out.println("chsfinduml==============================================[51]setPageFactory");
        if (!pageFactoryName.startsWith("com.yottabyte.pages.")) {
            pageFactoryName = "com.yottabyte.pages." + pageFactoryName;
        }
        try {
            Constructor<?> c = Class.forName(pageFactoryName).getDeclaredConstructor(WebDriver.class);
            c.setAccessible(true);
            pageFactory = c.newInstance(webDriver);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ConfigManager getConfig() {
        return config;
    }

    private static boolean isValidCookie() {
        try {
            String host = new URL(webDriver.getCurrentUrl()).getHost();
            if (!baseURL.contains(host)) {
                webDriver.get(baseURL);
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
        if (cookie == null) {
            return false;
        }
        Cookie webCookie = webDriver.manage().getCookieNamed(cookie.getName());
        return cookie.equals(webCookie) && new Date().before(webCookie.getExpiry());
    }

    private static void deleteAllCookies() {
        WebDriverWait wait = new WebDriverWait(webDriver, 20);
        wait.until(driver -> ((JavascriptExecutor) driver).executeScript("return document.readyState").equals("complete"));
        webDriver.manage().deleteAllCookies();
    }
}
