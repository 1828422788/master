package com.yottabyte.webDriver;

import com.yottabyte.config.ConfigManager;
import com.yottabyte.utils.GetLogger;
import com.yottabyte.utils.TakeScreenShot;
import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import net.lightbody.bmp.BrowserMobProxyServer;
import org.apache.logging.log4j.core.config.ConfigurationSource;
import org.apache.logging.log4j.core.config.Configurator;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.Platform;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebDriverException;
import org.openqa.selenium.chrome.ChromeDriverService;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.logging.LogEntries;
import org.openqa.selenium.logging.LogEntry;
import org.openqa.selenium.logging.LogType;
import org.openqa.selenium.logging.LoggingPreferences;
import org.openqa.selenium.remote.CapabilityType;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.remote.UnreachableBrowserException;
import org.openqa.selenium.support.events.EventFiringWebDriver;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;


public class SharedDriver extends EventFiringWebDriver {
    public static String WebDriverType;
    private static WebDriver REAL_DRIVER = null;
    private static Scenario scenario;
    private static TakeScreenShot screenShot = new TakeScreenShot();
    private static ChromeDriverService service;
    private static BrowserMobProxyServer browserMobProxy;
    private static final Thread CLOSE_THREAD = new Thread() {
        @Override
        public void run() {
            REAL_DRIVER.close();
            if (service != null && service.isRunning()) {
                service.stop();
            }
            if (browserMobProxy != null && browserMobProxy.isStarted()) {
                browserMobProxy.stop();
            }
        }
    };

    static {
        Runtime.getRuntime().addShutdownHook(CLOSE_THREAD);
        ConfigManager config = new ConfigManager();
        File conFile = new File("config/log4j2.xml");
        try {
            ConfigurationSource c = new ConfigurationSource(new BufferedInputStream(new FileInputStream(conFile)));
            Configurator.initialize(null, c);
        } catch (IOException e) {
            e.printStackTrace();
        }
        DesiredCapabilities browser = null;
        try {
            if ("chrome".equalsIgnoreCase(config.get("browser"))) {
                System.out.println("测试浏览器类型：" + config.get("browser"));
                browser = ChromeDes();
            } else {
                judgingBrowserType(config, browser);
            }
            EventListener eventListener = new EventListener();

            LoggingPreferences logPrefs = new LoggingPreferences();
            logPrefs.enable(LogType.BROWSER, Level.ALL);
            BrowserMobProxyService.startBrowserMobProxy();
            browserMobProxy = BrowserMobProxyService.getBrowserMobProxyServer();
            browser.setCapability(CapabilityType.LOGGING_PREFS, logPrefs);
            String ServerHOst;
            ServerHOst = config.get("selenium_server_host");
            GetLogger.getLogger().info("ServerHOst: {}", ServerHOst);
            URL url = new URL("http://" + ServerHOst + ":4444/wd/hub");
            REAL_DRIVER = new RemoteWebDriver(url, browser);
            REAL_DRIVER = new EventFiringWebDriver(REAL_DRIVER).register(eventListener);
            WebDriverType = "Remote";
        } catch (MalformedURLException exceptions) {

        } catch (UnreachableBrowserException e) {
            System.out.println("Can not find remote server. Start local service");
            if ("chrome".equalsIgnoreCase(config.get("browser"))) {
                browser = LocalChromeDes();
            } else {
                judgingBrowserType(config, browser);
            }
            EventListener eventListener = new EventListener();
            LoggingPreferences logPrefs = new LoggingPreferences();
            logPrefs.enable(LogType.BROWSER, Level.ALL);
            BrowserMobProxyService.startBrowserMobProxy();
            browserMobProxy = BrowserMobProxyService.getBrowserMobProxyServer();
            browser.setCapability(CapabilityType.LOGGING_PREFS, logPrefs);
            LocalChromeDriverService.createAndStartService();
            service = LocalChromeDriverService.getService();
            REAL_DRIVER = new RemoteWebDriver(service.getUrl(), browser);
            REAL_DRIVER = new EventFiringWebDriver(REAL_DRIVER).register(eventListener);
            WebDriverType = "Local";
        }
    }

    public SharedDriver() {
        super(REAL_DRIVER);
//        REAL_DRIVER.manage().window().maximize();
        REAL_DRIVER.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        REAL_DRIVER.manage().timeouts().pageLoadTimeout(5, TimeUnit.MINUTES);
    }

    @Override
    public void close() {
        if (Thread.currentThread() != CLOSE_THREAD) {
            throw new UnsupportedOperationException("You shouldn't close this WebDriver. It's shared and will close when the JVM exits.");
        }
        super.close();
        super.quit();
    }

    @Before
    public void deleteAllCookies(Scenario scenario) throws InterruptedException {
        this.scenario = scenario;
        System.out.println("===========开始测试   Feature: " + scenario.getName() + " Tags: " + scenario.getSourceTagNames().toString() + " ==========");
//        manage().deleteAllCookies();
    }

    @After
    public void embedScreenshot(Scenario scenario) {
        try {
            LogEntries logEntries = REAL_DRIVER.manage().logs().get(LogType.BROWSER);
            System.out.println("=============================浏览器控制台日志================================");
            for (LogEntry entry : logEntries) {
                if (entry.getLevel().toString().contains("INFO") || entry.getLevel().toString().contains("WARNING"))
                    break;
                System.out.println(entry);
            }
            System.out.println("=============================测试结束================================");
            System.out.println("进行截图时页面当前的url：" + REAL_DRIVER.getCurrentUrl());

            byte[] screenshot = getScreenshotAs(OutputType.BYTES);
            scenario.embed(screenshot, "image/png");

        } catch (WebDriverException somePlatformsDontSupportScreenshots) {
            System.err.println(somePlatformsDontSupportScreenshots.getMessage());
        }
    }

    /**
     * 配置远程chrome浏览器设置
     *
     * @return
     */
    private static DesiredCapabilities ChromeDes() {
        String sp = File.separator;
        ConfigManager config = new ConfigManager();
        try {
            String downloadFilepath = config.get("ftp_base_path") + sp + "target" + sp + "download-files";
            ChromeOptions options = new ChromeOptions();
            System.out.println("测试系统：" + System.getProperty("os.name"));
            options.setBinary("C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe");
            HashMap<String, Object> chromePrefs = new HashMap<String, Object>();
            // 设置为禁止弹出下载窗口
            chromePrefs.put("profile.default_content_settings.popups", 0);
            // 设置为文件下载路径
            chromePrefs.put("download.default_directory", downloadFilepath);
            System.out.println("设置下载路径-----" + downloadFilepath);
            LoggingPreferences loggingPreferences = new LoggingPreferences();

            loggingPreferences.enable(LogType.BROWSER, Level.ALL);
            options.setExperimentalOption("prefs", chromePrefs);
            options.addArguments("test-type", "start-maximized");
//            options.addArguments("--trace-to-console", "--auto-open-devtools-for-tabs");  // 浏览器启动时自动打开开发者工具
//            options.addArguments("--headless", "--disable-gpu"); //使用chromeheadless模式
            DesiredCapabilities desiredCapabilities = DesiredCapabilities.chrome();
            desiredCapabilities.setBrowserName("chrome");
            desiredCapabilities.setJavascriptEnabled(true);
            desiredCapabilities.setCapability(CapabilityType.LOGGING_PREFS, loggingPreferences);
            desiredCapabilities.setCapability(CapabilityType.ACCEPT_SSL_CERTS, true);
            desiredCapabilities.setCapability(ChromeOptions.CAPABILITY, options);
            return desiredCapabilities;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    private static DesiredCapabilities LocalChromeDes() {
        String sp = File.separator;
        String downloadFilepath = System.getProperty("user.dir") + sp + "target" + sp + "download-files";
        try {
            ChromeOptions options = new ChromeOptions();
            if ("Mac OS X".equalsIgnoreCase(System.getProperty("os.name"))) {
                ConfigManager config = new ConfigManager();
                System.out.println("测试远程mac " + System.getProperty("os.name"));
                options.setBinary(config.get("macbinary"));
            }
            HashMap<String, Object> chromePrefs = new HashMap<String, Object>();
            // 设置为禁止弹出下载窗口
            chromePrefs.put("profile.default_content_settings.popups", 0);
            // 设置为文件下载路径
            chromePrefs.put("download.default_directory", downloadFilepath);

            LoggingPreferences loggingPreferences = new LoggingPreferences();

            loggingPreferences.enable(LogType.BROWSER, Level.ALL);
            options.setExperimentalOption("prefs", chromePrefs);
            options.addArguments("test-type", "start-maximized");
//            options.addArguments("--trace-to-console", "--auto-open-devtools-for-tabs");  // 浏览器启动时自动打开开发者工具
//            options.addArguments("--headless", "--disable-gpu"); //使用chromeheadless模式
            DesiredCapabilities desiredCapabilities = DesiredCapabilities.chrome();
            desiredCapabilities.setBrowserName("chrome");
            desiredCapabilities.setJavascriptEnabled(true);
            desiredCapabilities.setCapability(CapabilityType.LOGGING_PREFS, loggingPreferences);
            desiredCapabilities.setCapability(CapabilityType.ACCEPT_SSL_CERTS, true);
            desiredCapabilities.setCapability(ChromeOptions.CAPABILITY, options);
            return desiredCapabilities;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 配置远程IE浏览器设置
     *
     * @return
     */
    private static DesiredCapabilities IEDes() {
        try {
            DesiredCapabilities desiredCapabilities = DesiredCapabilities.internetExplorer();
            desiredCapabilities.setBrowserName("internet Explorer");
            desiredCapabilities.setVersion("11");
            desiredCapabilities.setPlatform(Platform.WINDOWS);
            desiredCapabilities.setCapability(InternetExplorerDriver.INTRODUCE_FLAKINESS_BY_IGNORING_SECURITY_DOMAINS, true);
            desiredCapabilities.setCapability("ignoreProtectedModeSettings", true);
            return desiredCapabilities;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 配置远程firefox浏览器设置
     *
     * @return
     */
    private static DesiredCapabilities FirefoxDes() {
        try {
            DesiredCapabilities desiredCapabilities = DesiredCapabilities.firefox();
            desiredCapabilities.setBrowserName("firefox");
            return desiredCapabilities;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Scenario getScenario() {
        return scenario;
    }

    public static TakeScreenShot getScreenShot() {
        return screenShot;
    }

    private static void judgingBrowserType(ConfigManager config, DesiredCapabilities browser) {
        if ("firefox".equalsIgnoreCase(config.get("browser"))) {
            browser = FirefoxDes();
        } else if ("internet Explorer".equalsIgnoreCase(config.get("browser"))) {
            browser = IEDes();
        } else {
            System.out.println("没有找到对应浏览器类型");
        }
    }
}